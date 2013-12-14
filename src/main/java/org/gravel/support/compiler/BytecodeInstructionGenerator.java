package org.gravel.support.compiler;

import java.math.BigDecimal;
import java.math.BigInteger;

import org.gravel.core.Symbol;
import org.gravel.support.parser.NodeVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class BytecodeInstructionGenerator extends NodeVisitor<Void> implements
		Opcodes {

	protected MethodVisitor mv;

	public void pushConstant(Object constant) {
		if (constant == null) {
			pushNull();
			return;
		}
		if (constant instanceof String) {
			mv.visitLdcInsn(constant);
			return;
		}
		if (constant instanceof Integer) {
			pushInteger((int) constant);
			return;
		}
		if (constant instanceof Boolean) {
			pushBoolean((boolean) constant);
			return;
		}
		if (constant instanceof Character) {
			pushCharacter(((Character)constant));
			return;
		}
		if (constant instanceof Float) {
			pushFloat(((Float)constant));
			return;
		}
		throw new RuntimeException("Unsupported constant type: "
				+ constant.getClass());
	}

	public void pushInteger(int intConstant) {
		pushInt(intConstant);
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf",
				"(I)Ljava/lang/Integer;");
	}

	public void pushBoolean(final boolean value) {
		pushBooleanStatic(value);
	}

	public void pushBooleanStatic(final boolean value) {
		if (value) {
			mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "TRUE", "Ljava/lang/Boolean;");
		} else {
			mv.visitFieldInsn(GETSTATIC, "java/lang/Boolean", "FALSE", "Ljava/lang/Boolean;");
		}
	}

	public void pushNull() {
		mv.visitInsn(ACONST_NULL);
	}

	public void pushInt(int i) {
		switch (i) {
		case (0) : mv.visitInsn(ICONST_0); return;
		case (1) : mv.visitInsn(ICONST_1); return;
		case (2) : mv.visitInsn(ICONST_2); return;
		case (3) : mv.visitInsn(ICONST_3); return;
		case (4) : mv.visitInsn(ICONST_4); return;
		case (5) : mv.visitInsn(ICONST_5); return;
		}
		if (i >= Byte.MIN_VALUE && i <= Byte.MAX_VALUE) {
			mv.visitIntInsn(BIPUSH, i); return;
		}
		if (i >= Short.MIN_VALUE && i <= Short.MAX_VALUE) {
			mv.visitIntInsn(SIPUSH, i); return;
		}
		mv.visitLdcInsn(i);
	}

	public void pushByteArray(final byte[] ba) {
		pushInt(ba.length);
		mv.visitIntInsn(NEWARRAY, T_BYTE);
		for (int i= 0; i < ba.length ; i++) {
			mv.visitInsn(DUP);
			pushInt(i);
			pushInt(ba[i]);
			mv.visitInsn(BASTORE);
		}
	}

	public void pushCharacter(final char ch) {
		pushChar(ch);
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Character", "valueOf",
				"(C)Ljava/lang/Character;");
	}

	public void pushChar(final char ch) {
		if (ch < 128) {
			mv.visitIntInsn(BIPUSH, ch);
		} else { 
			mv.visitIntInsn(SIPUSH, ch);
		}
	}

	public void pushFloat(Float aFloat) {
		mv.visitLdcInsn(aFloat.toString());
		mv.visitMethodInsn(INVOKESTATIC, "java/lang/Float", "valueOf", "(Ljava/lang/String;)Ljava/lang/Float;");
	}

	public void pushBigInteger(BigInteger integer) {
		mv.visitTypeInsn(NEW, "java/math/BigInteger");
		mv.visitInsn(DUP);
		mv.visitLdcInsn(integer.toString());
		mv.visitMethodInsn(INVOKESPECIAL, "java/math/BigInteger", "<init>",
				"(Ljava/lang/String;)V");
	}

	public void pushSymbol(Symbol symbol) {
		mv.visitLdcInsn(symbol.asString());
		mv.visitMethodInsn(INVOKESTATIC, "org/gravel/core/Symbol", "value", "(Ljava/lang/String;)Lorg/gravel/core/Symbol;");
	}
	
	public void pushFixedPoint(BigDecimal fixedPoint) {
		mv.visitTypeInsn(NEW, "java/math/BigDecimal");
		mv.visitInsn(DUP);
		mv.visitLdcInsn(fixedPoint.toString());
		mv.visitMethodInsn(INVOKESPECIAL, "java/math/BigDecimal", "<init>", "(Ljava/lang/String;)V");
	}
	
	
	
}
