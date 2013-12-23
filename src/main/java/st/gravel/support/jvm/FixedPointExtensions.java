package st.gravel.support.jvm;

import java.math.BigDecimal;

public class FixedPointExtensions {

	public static BigDecimal fromString_(String string) {
		return new BigDecimal(string);
	}

	public static BigDecimal fromSmalltalkString_(String string) {
		return fromString_(string.substring(0, string.length() - 1));
	}

	public static BigDecimal fromString_scale_(String string, int _scale) {
		if (_scale == 0)
			return fromSmalltalkString_(string);
		if (_scale != 1)
			throw new UnsupportedOperationException();
		return fromSmalltalkString_(string);
	}
}