package org.gravel.support.compiler;

import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import org.gravel.support.compiler.BytecodeBlockGenerator.JavaType;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.util.TraceClassVisitor;

public abstract class BytecodeBehaviorGenerator implements Opcodes {

	public BytecodeBehaviorGenerator(String dottedName, SourceIndex sourceIndex) {
		this.dottedName = dottedName;
		this.selfName = slashed(dottedName);
		this.selfType = JavaType.fromDotted(dottedName);
	}

	protected static final String LINK_AST_CONSTANTS_METHOD_NAME = "_LinkASTConstants";
	public static final StClassLoader loader = new StClassLoader();

	public static void createASTConstantLinkMethod(ClassWriter cw,
			ASTConstants astConstants, String owner) {
		for (Entry<String, ASTConstants.ASTConstant> entry : astConstants
				.constants().entrySet()) {
			FieldVisitor fv = cw.visitField(ACC_PUBLIC + ACC_STATIC,
					entry.getKey(),
					"Lorg/gravel/support/compiler/ASTConstants$ASTConstant;",
					null, null);
			fv.visitEnd();
		}
		MethodVisitor mv = cw.visitMethod(ACC_PUBLIC + ACC_STATIC,
				LINK_AST_CONSTANTS_METHOD_NAME,
				"(Lorg/gravel/support/compiler/ASTConstants;)V", null, null);
		mv.visitCode();

		for (Entry<String, ASTConstants.ASTConstant> entry : astConstants
				.constants().entrySet()) {

			mv.visitVarInsn(ALOAD, 0);
			mv.visitLdcInsn(entry.getKey());
			mv.visitMethodInsn(INVOKEVIRTUAL,
					"org/gravel/support/compiler/ASTConstants", "constantAt",
					"(Ljava/lang/String;)Lorg/gravel/support/compiler/ASTConstants$ASTConstant;");
			mv.visitFieldInsn(PUTSTATIC, owner, entry.getKey(),
					"Lorg/gravel/support/compiler/ASTConstants$ASTConstant;");
		}
		mv.visitInsn(RETURN);
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}

	public static String slashed(String dotted) {
		return dotted.replaceAll("\\.", "/");
	}

	protected ClassWriter cw;
	protected String selfName;
	protected SourceIndex sourceIndex;
	protected String superName = "java/lang/Object";
	protected ASTConstants astConstants = new ASTConstants();

	protected boolean isStatic = true;
	protected List<InnerClassDefinition> innerclasses = new ArrayList<>();
	protected String dottedName;
	protected JavaType selfType;
	protected boolean verbose = false;

	public void createDefaultConstructor() {
		createDefaultConstructor(superName);
	}

	public void createDefaultConstructor(String superInitName) {
		MethodVisitor mv = cw.visitMethod(Opcodes.ACC_PUBLIC, "<init>", "()V",
				null, null);
		mv.visitCode();
		mv.visitVarInsn(Opcodes.ALOAD, 0);
		mv.visitMethodInsn(Opcodes.INVOKESPECIAL, superInitName, "<init>",
				"()V");
		mv.visitInsn(Opcodes.RETURN);
		mv.visitMaxs(0, 0);
		mv.visitEnd();
	}

	public Class<?> createInstanceClass() {
		byte[] bytes = createBytes();
		printBytecode(bytes);
		Class<?> instanceClass = loader.defineClass(dottedName, bytes);
		loadAstConstants(instanceClass, astConstants);
		for (InnerClassDefinition innerclass : innerclasses) {
			printBytecode(innerclass.bytes());
			final Class<?> blockClass = loader.defineClass(
					innerclass.javaName(), innerclass.bytes());
			loadAstConstants(blockClass, innerclass.astConstants());
		}
		linkAstConstants(astConstants);
		for (InnerClassDefinition innerclass : innerclasses) {
			linkAstConstants(innerclass.astConstants());
		}

		return instanceClass;
	}

	protected abstract byte[] createBytes();

	private void linkAstConstants(ASTConstants astConstants) {
		for (ASTConstants.ASTConstant c : astConstants.constants().values()) {
			c.linkIn(loader);
		}
	}

	private void loadAstConstants(Class<?> instanceClass,
			ASTConstants astConstants) {
		try {

			Method method = instanceClass.getDeclaredMethod(
					LINK_AST_CONSTANTS_METHOD_NAME, ASTConstants.class);
			method.setAccessible(true);
			method.invoke(null, astConstants);
		} catch (NoSuchMethodException | SecurityException
				| IllegalAccessException | IllegalArgumentException
				| InvocationTargetException e) {
			throw new RuntimeException(e);
		}
	}

	private void printBytecode(byte[] bytes) {
		if (verbose) {
			ClassReader cr = new ClassReader(bytes);
			cr.accept(new TraceClassVisitor(new PrintWriter(System.out)), 0);
		}
	}

	public ClassWriter newClassWriter() {
		return new ClassWriter(ClassWriter.COMPUTE_MAXS
				| ClassWriter.COMPUTE_FRAMES) {

			@Override
			protected String getCommonSuperClass(String type1, String type2) {
				return "java/lang/Object";
			}

		};
	}
}
