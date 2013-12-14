package org.gravel.support.compiler;

import java.util.HashMap;
import java.util.List;

import org.gravel.core.Symbol;
import org.gravel.support.parser.BlockNode;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.Reference;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

public class BytecodeBlockGenerator implements Opcodes {

	public static class JavaVarDecl {

		@Override
		public String toString() {
			return "JavaVarDecl [name=" + name + ", decl=" + decl + ", owner="
					+ owner + "]";
		}

		private final String name;
		private final JavaType decl;
		private final JavaType owner;
		private final boolean inScope;

		public JavaVarDecl(String name, JavaType decl, JavaType owner) {
			this(name, decl, owner, true);
		}

		public JavaVarDecl(String name, JavaType decl, JavaType owner,
				boolean inScope) {
			if (name == null || 
					decl == null) throw new RuntimeException();
				
				
			this.name = name;
			this.decl = decl;
			this.owner = owner;
			this.inScope = inScope;
		}

		public String name() {
			return name;
		}

		public JavaType decl() {
			return decl;
		}

		public JavaVarDecl asOutOfScope() {
			return new JavaVarDecl(name, decl, owner, false);
		}

		public boolean isInScope() {
			return inScope;
		}

		public boolean isHolder() {
			return decl.isArray();
		}
	}

	public static class JavaType {

		private Type type;

		public JavaType(String name) {
			this.type = Type.getType(name);
			// validate();
		}

		public boolean isArray() {
			return type.getSort() == Type.ARRAY;
		}

		public Type type() {
			return type;
		}

		public static JavaType getType(Class<?> class1) {
			return new JavaType(Type.getType(class1).toString());
		}

		public Class<?> toClass() {
			try {
				switch (type.getSort()) {
				case Type.OBJECT:
					return Class.forName(type.getClassName());
				case Type.ARRAY:
					return Class.forName(type.toString().replace('/', '.'));
				}
				throw new RuntimeException("NIY");
			} catch (ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
		}

		public String getClassName() {
			return type.getClassName();
		}

		public String getDescriptor() {
			return type.getDescriptor();
		}

		public String getInternalName() {
			return type.getInternalName();
		}

		public JavaType asHolder(boolean convert) {
			return convert ? new JavaType("[" + type.toString()) : this;
		}

		public static JavaType fromDotted(String dottedName) {
			return fromSlashed(dottedName.replace('.', '/'));
		}

		public static JavaType fromSlashed(String slashed) {
			return new JavaType("L" + slashed + ";");
		}
	}

	public static final String[] valueMethodNames = new String[] { "value",
			"value_", "value_value_", "value_value_value_",
			"value_value_value_value_" };

	private final BlockNode blockNode;
	private final String owner;
	private final String innerclassName;
	private final String outerMethodName;
	private final String outerMethodDesc;
	private final String superName;
	private final List<InnerClassDefinition> innerclasses;
	private JavaVarDecl[] copiedVariables;

	private HashMap<LiteralNode, String> constantMap;

	private SourceIndex sourceIndex;

	private Reference reference;

	private Symbol selector;

	private ASTConstants astConstants;

	private LiteralBlockInlinePrecondition lbiPrecondition;

	public BytecodeBlockGenerator(Reference reference,
			BlockNode blockNode, String owner, String innerclassName,
			String outerMethodName, String outerMethodDesc,
			List<InnerClassDefinition> innerclasses, JavaVarDecl[] copiedVariables,
			HashMap<LiteralNode, String> constantMap, SourceIndex sourceIndex,
			Symbol selector, ASTConstants astConstants, LiteralBlockInlinePrecondition lbiPrecondition) {
		this.reference = reference;
		this.blockNode = blockNode;
		this.owner = owner;
		this.innerclassName = innerclassName;
		this.outerMethodName = outerMethodName;
		this.outerMethodDesc = outerMethodDesc;
		this.innerclasses = innerclasses;
		this.copiedVariables = copiedVariables;
		this.constantMap = constantMap;
		this.sourceIndex = sourceIndex;
		this.selector = selector;
		this.astConstants = astConstants;
		this.lbiPrecondition = lbiPrecondition;
		this.superName = "org/gravel/support/jvm/Block" + blockNode.numArgs();
	}

	public byte[] generate() {

		ClassWriter cw = new ClassWriter(ClassWriter.COMPUTE_MAXS
				| ClassWriter.COMPUTE_FRAMES);
		FieldVisitor fv;
		MethodVisitor mv;

		cw.visit(V1_7, ACC_STATIC + ACC_PUBLIC + ACC_SUPER, innerclassName,
				null, superName, null);

		if (sourceIndex != null) {
			cw.visitSource(sourceIndex.name(), null);
		}

		cw.visitOuterClass(owner, outerMethodName, outerMethodDesc);

		cw.visitInnerClass(innerclassName, owner, null, ACC_PUBLIC);
		if (copiedVariables.length == 0) {
			fv = cw.visitField(ACC_PUBLIC + ACC_FINAL + ACC_STATIC,
					"SINGLETON", "L" + innerclassName + ";", null, null);
			fv.visitEnd();

			{
				mv = cw.visitMethod(ACC_STATIC, "<clinit>", "()V", null, null);
				mv.visitCode();

				mv.visitTypeInsn(NEW, innerclassName);
				mv.visitInsn(DUP);
				mv.visitMethodInsn(INVOKESPECIAL, innerclassName, "<init>",
						initDesc(copiedVariables));
				mv.visitFieldInsn(PUTSTATIC, innerclassName, "SINGLETON", "L"
						+ innerclassName + ";");
				mv.visitInsn(RETURN);
				mv.visitMaxs(1, 0);
				mv.visitEnd();
			}

		}

		for (JavaVarDecl var : copiedVariables) {
			fv = cw.visitField(ACC_PRIVATE + ACC_FINAL + ACC_SYNTHETIC,
					var.name(), var.decl().getDescriptor(), null, null);
			fv.visitEnd();
		}
		{
			String initDesc = initDesc(copiedVariables);
			mv = cw.visitMethod(ACC_PUBLIC, "<init>", initDesc, null, null);
			mv.visitCode();

			for (int i = 0; i < copiedVariables.length; i++) {
				mv.visitVarInsn(ALOAD, 0);
				mv.visitVarInsn(ALOAD, i + 1);
				mv.visitFieldInsn(PUTFIELD, innerclassName, copiedVariables[i]
						.name(), copiedVariables[i].decl().getDescriptor());
			}

			mv.visitVarInsn(ALOAD, 0);
			mv.visitMethodInsn(INVOKESPECIAL, superName, "<init>", "()V");
			mv.visitInsn(RETURN);
			mv.visitMaxs(0, 0);
			mv.visitEnd();
		}
		{
			mv = cw.visitMethod(ACC_PUBLIC,
					valueMethodNames[blockNode.numArgs()],
					BytecodeMethodGenerator.getDesc(blockNode.numArgs()), null,
					null);
			mv.visitCode();
			JavaType localCopyOwnerType = JavaType.fromSlashed(innerclassName);
			new BytecodeMethodGenerator(reference, cw, owner,
					null, false, innerclasses, localCopyOwnerType,
					copiedVariables, constantMap, sourceIndex, astConstants).generateBlockBody(blockNode, mv, selector, lbiPrecondition);
			mv.visitMaxs(0, 0);
			mv.visitEnd();
		}

		BytecodeClassGenerator.createASTConstantLinkMethod(cw, astConstants,
				innerclassName);

		generateToString(cw);

		cw.visitEnd();

		return cw.toByteArray();
	}

	MethodVisitor mv;

	public void generateToString(ClassWriter cw) {
		if (selector == null) return;
		mv = cw.visitMethod(ACC_PUBLIC, "toString", "()Ljava/lang/String;",
				null, null);
		mv.visitCode();
		Label l0 = new Label();
		mv.visitLabel(l0);
		mv.visitLineNumber(171, l0);
		mv.visitLdcInsn("[] in " + reference + ">>"
				+ selector.asString() + "\n\t" + blockNode.sourceString());
		mv.visitInsn(ARETURN);
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}

	public static String initDesc(final JavaVarDecl[] copiedVariables) {
		String initDesc = "(";
		for (JavaVarDecl varDecl : copiedVariables) {
			initDesc = initDesc + varDecl.decl().getDescriptor();
		}
		initDesc = initDesc + ")V";
		if (initDesc.indexOf('.') != -1) {
			throw new RuntimeException();

		}
		return initDesc;
	}

}
