package org.gravel.support.compiler;

import java.lang.invoke.CallSite;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaType;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.jvm.Block1;
import org.gravel.support.jvm.runtime.MethodLinker;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.MessageNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.Node;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.SelectorConverter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Handle;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class BytecodeClassGenerator extends BytecodeBehaviorGenerator {
	public static final Handle bootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"bootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle superBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, JavaType.getType(MethodLinker.class)
					.getInternalName(), "superBootstrap", MethodType
					.methodType(CallSite.class, MethodHandles.Lookup.class,
							String.class, MethodType.class, String.class)
					.toMethodDescriptorString());
	public static final Handle blockBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"blockBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class, String.class, String.class)
					.toMethodDescriptorString());
	public static final Handle fieldReadBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"fieldReadBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle fieldWriteBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"fieldWriteBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle globalReadBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"globalReadBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class, String.class)
					.toMethodDescriptorString());
	public static final Handle globalWriteBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			JavaType.getType(MethodLinker.class).getInternalName(),
			"globalWriteBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class, String.class)
					.toMethodDescriptorString());
	private JavaVarDecl[] instVars;
	private List<MethodNode> methods;
	private JavaType identityType;
	private Reference reference;
	
	public BytecodeClassGenerator(Reference reference, String dottedName,
			JavaType identityType, MethodNode[] methods, boolean isStatic,
			JavaVarDecl[] instVars, Class<Object> javaSuperclass,
			SourceIndex sourceIndex) {
		super(dottedName, sourceIndex);
		this.reference = reference;
		this.identityType = identityType;
		this.sourceIndex = sourceIndex;
		this.methods = Arrays.asList(methods);
		this.isStatic = isStatic;
		this.instVars = instVars;
		if (javaSuperclass != null) {
			this.superName = slashed(javaSuperclass.getCanonicalName());
		}
	}

	@Override 
	protected byte[] createBytes() {
		ConstantExtractor constantExtractor = new ConstantExtractor();
		constantExtractor.loadConstantMap(methods);

		// System.out.println("Generating: " + selfName);
		cw = newClassWriter();
		cw.visit(V1_7, ACC_PUBLIC + ACC_SUPER, selfName, null, superName,
				new String[] { "java/lang/Cloneable" });

		if (sourceIndex != null) {
			cw.visitSource(sourceIndex.name(), null);
		}
		for (JavaVarDecl instVar : instVars) {
			FieldVisitor fv = cw.visitField(ACC_PUBLIC, instVar.name(), instVar.decl()
					.getDescriptor(), null, null);
			fv.visitEnd();
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
		createCloneMethod();


		for (MethodNode methodNode : methods) {
			createMethod(methodNode, constantExtractor.getConstantMap());
		}
		for (Symbol extraSuper: getExtraSupers()) {
			createOuterSuperAccess(extraSuper);
		}
		
		createASTConstantLinkMethod(cw, astConstants, selfName);
		
		for (InnerClassDefinition inner : innerclasses) {
			cw.visitInnerClass(inner.innerclassName(), selfName, null,
					ACC_PUBLIC);
		}

		cw.visitEnd();

		return cw.toByteArray();
	}

	public void createCloneMethod() {
		{
			MethodVisitor mv = cw.visitMethod(ACC_PUBLIC, "clone", "()Ljava/lang/Object;", null, new String[] { "java/lang/CloneNotSupportedException" });
			mv.visitCode();
			Label l0 = new Label();
			mv.visitLabel(l0);
			mv.visitLineNumber(51, l0);
			mv.visitVarInsn(ALOAD, 0);
			mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "clone", "()Ljava/lang/Object;");
			mv.visitInsn(ARETURN);
			Label l1 = new Label();
			mv.visitLabel(l1);
			mv.visitLocalVariable("this", "Lorg/gravel/support/parser/AbsoluteReference;", null, l0, l1, 0);
			mv.visitMaxs(1, 1);
			mv.visitEnd();
			}
	}

	private void createOuterSuperAccess(Symbol selector) {
		{
			SelectorConverter selectorConverter = SelectorConverter.factory.basicNew();
			String functionName = selectorConverter.selectorAsFunctionName_(selector);
			String desc = getOuterSuperAccessDesc(identityType, selector);
			MethodVisitor mv = cw.visitMethod(ACC_PUBLIC + ACC_STATIC + ACC_SYNTHETIC, "access$"+functionName, desc, null, null);
			mv.visitCode();
			String name = selectorConverter.selectorAsFunctionName_(selector);
			mv.visitVarInsn(ALOAD, 0);
			for (int i = 0; i < selector.numArgs(); i++) {
				mv.visitVarInsn(ALOAD, i+1);
			}
			String dynDesc = BytecodeMethodGenerator.getDescWithReceiver(selector);
			mv.visitInvokeDynamicInsn(name, dynDesc,
					BytecodeClassGenerator.superBootstrap, reference.toString());
			mv.visitInsn(ARETURN);
			mv.visitMaxs(0, 0);
			mv.visitEnd();
		}
	}

	public static String getOuterSuperAccessDesc(JavaType type, Symbol selector) {
		String receiverType = type.getDescriptor();
		StringBuilder str = new StringBuilder();
		str.append('(');
		str.append(receiverType);
		for (int i = 0; i < selector.numArgs(); i++)
			str.append(i == 0 ? receiverType : "Ljava/lang/Object;");
		str.append(')');
		str.append("Ljava/lang/Object;");
		return str.toString();
	}

	public HashSet<Symbol> getExtraSupers() {
		final HashSet<Symbol> extraSupers = new HashSet<>();
		for (MethodNode methodNode : methods) {
			

			methodNode.allNodesDo_(new Block1<Object, Node>() {
				@Override
				public Object value_(Node node) {
					if (node.isBlockNode()) {
						node.allNodesDo_(new Block1<Object, Node>() {
							@Override
							public Object value_(Node node) {
								if (node.isMessageNode()) {
									MessageNode messageNode = (MessageNode) node;
									if (messageNode.receiver().isSuperNode()) {
										extraSupers.add(Symbol.value(messageNode.selector()));
									}
								}
								return null;
							}
						});
					}
					return null;
				}
			});
		}
		return extraSupers;
	}

	private void createMethod(MethodNode methodNode,
			HashMap<LiteralNode, String> constantMap) {
 
		new BytecodeMethodGenerator(reference, cw, selfName,
				identityType, isStatic, innerclasses, selfType, new JavaVarDecl[0],
				constantMap, sourceIndex, astConstants)
				.generate(methodNode);
	}

}