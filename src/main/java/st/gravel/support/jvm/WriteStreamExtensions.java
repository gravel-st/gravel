package st.gravel.support.jvm;

import st.gravel.core.Symbol;

public class WriteStreamExtensions {
	public static StringBuilder nextPut_(StringBuilder stringBuilder,
			Character ch) {
		stringBuilder.append(ch);
		return stringBuilder;
	}

	public static StringBuilder nextPutAll_(StringBuilder stringBuilder,
			Object aString) {
		if (aString instanceof String) {
			stringBuilder.append((String) aString);
		} else if (aString instanceof Symbol) {
			stringBuilder.append(((Symbol) aString).asString());
		} else {
			stringBuilder.append(aString.toString());
		}
		return stringBuilder;
	}

	public static int position(StringBuilder stringBuilder) {
		return stringBuilder.length();
	}


}
