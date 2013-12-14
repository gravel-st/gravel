package org.gravel.support.compiler;

import java.math.BigInteger;

import org.gravel.support.parser.ArrayLiteralNode;
import org.gravel.support.parser.BooleanLiteralNode;
import org.gravel.support.parser.ByteArrayLiteralNode;
import org.gravel.support.parser.CharacterLiteralNode;
import org.gravel.support.parser.FixedPointLiteralNode;
import org.gravel.support.parser.IntegerLiteralNode;
import org.gravel.support.parser.LiteralNode;
import org.gravel.support.parser.NilLiteralNode;
import org.gravel.support.parser.StringLiteralNode;
import org.gravel.support.parser.SymbolLiteralNode;
import org.objectweb.asm.MethodVisitor;

public class BytecodeConstantFieldGenerator extends
		BytecodeInstructionGenerator {

	public BytecodeConstantFieldGenerator(MethodVisitor mv) {
		this.mv = mv;
	}
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	@Override
	public Void visitArrayLiteralNode_(ArrayLiteralNode literalNode) {
		final LiteralNode[] elements = literalNode.elements();
		pushInt(elements.length);
		mv.visitTypeInsn(ANEWARRAY, "java/lang/Object");
		for (int i= 0; i < elements.length ; i++) {
			mv.visitInsn(DUP);
			pushInt(i);
			visit_(elements[i]);
			mv.visitInsn(AASTORE);
		}
		return null;
	}

	@Override
	public Void visitBooleanLiteralNode_(BooleanLiteralNode literalNode) {
		pushConstant(literalNode.value());
		return null;
	}

	@Override
	public Void visitByteArrayLiteralNode_(ByteArrayLiteralNode literalNode) {
		pushByteArray(literalNode.value());
		return null;
	}

	@Override
	public Void visitCharacterLiteralNode_(CharacterLiteralNode literalNode) {
		pushConstant(literalNode.value());
		return null;
	}

	@Override
	public Void visitFixedPointLiteralNode_(FixedPointLiteralNode literalNode) {
		pushFixedPoint(literalNode.value());
		return null;
	}

	@Override
	public Void visitIntegerLiteralNode_(IntegerLiteralNode literalNode) {
		Object value = literalNode.value();
		if (value instanceof BigInteger)
			pushBigInteger((BigInteger) value);
		else 
			pushConstant(value);
		return null;
	}

	@Override
	public Void visitNilLiteralNode_(NilLiteralNode literalNode) {
		pushNull();
		return null;
	}

	@Override
	public Void visitStringLiteralNode_(StringLiteralNode literalNode) {
		pushConstant(literalNode.value());
		return null;
	}

	@Override
	public Void visitSymbolLiteralNode_(SymbolLiteralNode literalNode) {
		pushSymbol(literalNode.value());
		return null;
	}

	
	
}
