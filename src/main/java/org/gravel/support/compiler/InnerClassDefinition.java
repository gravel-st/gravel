package org.gravel.support.compiler;

public class InnerClassDefinition {

	private final String innerclassName;
	private byte[] bytes;
	private ASTConstants astConstants;

	public ASTConstants astConstants() {
		return astConstants;
	}

	public InnerClassDefinition(int innerclassIndex, String owner) {
		this.innerclassName = owner+"$"+ innerclassIndex;
	}

	public String javaName() {
		return innerclassName.replaceAll("/", "\\.");
	}

	public byte[] bytes() {
		return bytes;
	}

	public String innerclassName() {
		return innerclassName;
	}

	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}

	public void setAstConstants(ASTConstants astConstants) {
		this.astConstants = astConstants;
	}
	
}