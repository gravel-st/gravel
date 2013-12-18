package org.gravel.support.compiler;

import java.io.PrintWriter;

import org.gravel.support.compiler.jvm.JVMClass;
import org.gravel.support.compiler.jvm.JVMField;
import org.gravel.support.compiler.jvm.JVMMethod;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.util.TraceClassVisitor;

public class ASMClassWriter implements Opcodes {

	private JVMClass jvmClass;
	private ClassWriter cw;
	public static final StClassLoader loader = new StClassLoader();

	public ASMClassWriter(JVMClass jvmClass) {
		this.jvmClass = jvmClass;
	}

	public ClassWriter newClassWriter() {
		return new ClassWriter(ClassWriter.COMPUTE_MAXS | ClassWriter.COMPUTE_FRAMES) {

			@Override
			protected String getCommonSuperClass(String type1, String type2) {
				return "java/lang/Object";
			}

		};
	}

	protected byte[] createBytes() {
		cw = newClassWriter();
		cw.visit(V1_7, ACC_PUBLIC + ACC_SUPER, jvmClass.type().className(),
				null, jvmClass.superType().className(),
				new String[] { "java/lang/Cloneable" });

		if (jvmClass.source() != null) {
			cw.visitSource(jvmClass.source(), null);
		}

		for (JVMField field : jvmClass.fields()) {
			createField(field);
		}
		for (JVMMethod method : jvmClass.methods()) {
			createMethod(method);
		}

		cw.visitEnd();

		return cw.toByteArray();
	}

	private void createMethod(JVMMethod method) {
		ASMMethodWriter writer = new ASMMethodWriter(cw);
		try {
			writer.write(method);

		} catch (Exception e) {
			e.toString();
			throw e;
		}

	}

	private void createField(JVMField field) {
		FieldVisitor fv = cw.visitField(ACC_PUBLIC | (field.isStatic() ? ACC_STATIC : 0), field.varName(), field
				.type().descriptorString(), null, null);
		fv.visitEnd();
	}

	public Class<?> createClass() {
		byte[] bytes = createBytes();
//		printBytecode(bytes);
		Class<?> instanceClass = loader.defineClass(jvmClass.type()
				.dottedClassName(), bytes);
		return instanceClass;
	}

	private void printBytecode(byte[] bytes) {
		ClassReader cr = new ClassReader(bytes);
		cr.accept(new TraceClassVisitor(new PrintWriter(System.out)), 0);
	}

}
