package org.gravel.support.jvm;

public class BooleanExtensions {
	public static class Factory extends SmalltalkFactory {

		@Override
		public Object basicNew() {
			throw new UnsupportedOperationException("Can't create new booleans");
		}

	}

	public static Boolean not(Boolean receiver) {
		return !receiver;
	}

	public static boolean equals_(boolean receiver, boolean other) {
		return receiver == other;
	}

}
