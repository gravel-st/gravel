package org.gravel.core;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.WeakHashMap;

import org.gravel.support.jvm.CharacterExtensions;

public class Symbol {
	private final static WeakHashMap<String, Symbol> map = new WeakHashMap<String, Symbol>();

	public static String getSmalltalkName() {
		return "Symbol";
	}

	private final String value;

	private Symbol(String value) {
		super();
		this.value = value;
	}

	public static Symbol value(String value) {
		if (value == null)
			return value("");
		String intern = value.intern();
		Symbol current = map.get(intern);
		if (current == null)
			return newSymbol(intern);
		return current;
	}

	private synchronized static Symbol newSymbol(String intern) {
		Symbol current = map.get(intern);
		if (current == null) {
			current = new Symbol(intern);
			map.put(intern, current);
		}
		return current;
	}

	public String asString() {
		return value;
	}

	public String toString() {
		return "#" + value;
	}

	public boolean isEmpty() {
		return value.isEmpty();
	}

	public int numArgs() {
		if (value.length() == 0) return 0;
		if (!(CharacterExtensions.isLetter(value.charAt(0)) || value.charAt(0) == '_')) return 1; 
		int tally = 0;
		for (int i = 0; i < value.length(); i++) {
			if (value.charAt(i) == ':')
				tally++;
		}
		return tally;
	}

	public String[] keywords() {
		if (numArgs() <= 1) return new String[] {asString()};
		ArrayList<String> parts = new ArrayList<>();
		int length = value.length();
		int mark = 0;
		for (int i = 0; i < length; i++) {
			if (value.charAt(i) == ':') {
				parts.add(value.substring(mark, i+1));
				mark = i + 1;
			}
		}
		return parts.toArray(new String[parts.size()]);
	}

	public static HashSet<String> allStrings() {
		return new HashSet(map.keySet());
	}

	public boolean isUnary() {
		return numArgs() == 0;
	}

	public boolean isKeyword() {
		if( value.length() <= 1) return false;
		return value.charAt(value.length() -1 ) == ':';
	}

	public boolean isBinary() {
		return !isUnary() && !isKeyword();
	}

	public static Symbol forNumArgs(int numArgs) {
		if (numArgs == 0) return Symbol.value("value");
		StringBuilder str = new StringBuilder();
		for (int i = 0 ;i<numArgs ;i++) {
			str.append("value:");
		}
		return Symbol.value(str.toString());
	}

}
