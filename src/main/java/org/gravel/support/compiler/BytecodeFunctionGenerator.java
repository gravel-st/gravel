package org.gravel.support.compiler;

import java.util.HashMap;

import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.jvm.ArrayExtensions;
import org.gravel.support.jvm.Block1;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.VariableDeclarationNode;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

public class BytecodeFunctionGenerator extends BytecodeBehaviorGenerator {

	private String methodName = "value";
	private MethodVisitor mv;
	private MethodNode methodNode;
	private HashMap<LiteralNode, String> constantMap;

	private static int generatedClasses = 0;
	private LiteralBlockInlinePrecondition lbiPrecondition;
	private Reference reference;

	private static String generateDottedName() {
		return "Function" + generatedClasses++;
	}

	public BytecodeFunctionGenerator(MethodNode methodNode,
			LiteralBlockInlinePrecondition lbiPrecondition, Reference reference) {
		super(generateDottedName(), null);
		this.methodNode = methodNode;
		this.lbiPrecondition = lbiPrecondition;
		this.reference = reference;
//		 verbose = true;
	}

	@Override
	protected byte[] createBytes() {
		// System.out.println("Generating: " + selfName);
		ConstantExtractor constantExtractor = new ConstantExtractor();
		constantExtractor.loadConstantsInNode(methodNode);
		constantMap = constantExtractor.getConstantMap();
		cw = newClassWriter();
		cw.visit(V1_7, ACC_PUBLIC + ACC_SUPER, selfName, null, superName,
				new String[] {});

		if (sourceIndex != null) {
			cw.visitSource(sourceIndex.name(), null);
		}
		constantExtractor.writeStaticFields(cw);
		{
			MethodVisitor mv = cw.visitMethod(ACC_STATIC, "<clinit>", "()V",
					null, null);
			mv.visitCode();
			constantExtractor.writeStaticFieldAssignments(mv, selfName);
			mv.visitInsn(RETURN);
			mv.visitMaxs(2, 0);
			mv.visitEnd();
		}

		createDefaultConstructor();

		createFunction();
		createToString();

		createASTConstantLinkMethod(cw, astConstants, selfName);

		for (InnerClassDefinition inner : innerclasses) {
			cw.visitInnerClass(inner.innerclassName(), selfName, null,
					ACC_PUBLIC);
		}

		cw.visitEnd();

		return cw.toByteArray();
	}

	public void createToString() {
		mv = cw.visitMethod(ACC_PUBLIC, "toString", "()Ljava/lang/String;",
				null, null);
		mv.visitCode();
		mv.visitLdcInsn(methodNode.sourceString());
		mv.visitInsn(ARETURN);
		mv.visitMaxs(1, 1);
		mv.visitEnd();
	}

	public void createFunction() {
		Type[] argumentTypes = ArrayExtensions.collect_(methodNode.arguments(),
				new Block1<Type, VariableDeclarationNode>() {
					@Override
					public Type value_(VariableDeclarationNode arg1) {
						return Type.getType(arg1.isHolderDeclarationNode() ? Object[].class
								: Object.class);
					}
				});

		String desc = Type.getMethodDescriptor(Type.getType(Object.class),
				argumentTypes);

		mv = cw.visitMethod(ACC_PUBLIC | ACC_STATIC, methodName, desc, null,
				null);
		mv.visitCode();

		new BytecodeMethodGenerator(reference, cw, selfName, null, isStatic,
				innerclasses, selfType, new JavaVarDecl[0], constantMap,
				sourceIndex, astConstants).generateFunctionBody(methodNode, mv,
				lbiPrecondition);
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}

}
