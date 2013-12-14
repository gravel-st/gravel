package org.gravel.support.jvm;

import java.math.BigDecimal;

public class FixedPointExtensions {

	public static BigDecimal fromString_(String string) {
		return new BigDecimal(string);
	}

	public static BigDecimal fromSmalltalkString_(String string) {
		return fromString_(string.substring(0, string.length() - 1));
	}

}
