package org.gravel.support.jvm;

import java.util.HashSet;

import org.gravel.core.Symbol;

public class SymbolExtensions {

	public static Symbol newInstance_(Object receiver, String value) {
		return Symbol.value(value);
	}

	public static char at_(Symbol receiver, int i) {
		return StringExtensions.at_(receiver.asString(), i);
	}

	public static Symbol do_(Symbol receiver, Object aBlock) {
		StringExtensions.do_(receiver.asString(), aBlock);
		return receiver;
	}

	public static int size(Symbol receiver) {
		return StringExtensions.size(receiver.asString());
	}

	public static HashSet<String> allStrings(Object receiver) {
		return Symbol.allStrings();
	}
	
	
}
