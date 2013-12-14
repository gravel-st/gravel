package org.gravel.support.compiler;

public class CompilerSettings {

	public static CompilerSettings getDefault() {
		return new CompilerSettings(
/** literalBlockInlining **/			true);
	}

	private boolean literalBlockInlining;

	private CompilerSettings(boolean literalBlockInlining) {
		this.setLiteralBlockInlining(literalBlockInlining);
	}

	public boolean literalBlockInlining() {
		return literalBlockInlining;
	}

	public void setLiteralBlockInlining(boolean literalBlockInlining) {
		this.literalBlockInlining = literalBlockInlining;
	}

}
