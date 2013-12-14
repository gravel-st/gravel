package org.gravel.support.jvm;

public abstract class SmalltalkFactory {

	public Object r_new() {
		return basicNew();
	}

	public abstract Object basicNew();

	public String printString() {
		return this.toString();
	}

}
