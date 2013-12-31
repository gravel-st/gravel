package st.gravel.support.jvm;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class FloatExtensions {
	public static Number ceiling(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.CEILING);
	}

	public static float differenceFromFloat_(float receiver, float argument) {
		return argument - receiver;
	}

	public static Number floor(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.FLOOR);
	}

	public static Object javaNaN() {
		return Float.NaN;
	}

	public static Object javaNegativeInfinity() {
		return Float.NEGATIVE_INFINITY;
	}

	public static Object javaPositiveInfinity() {
		return Float.POSITIVE_INFINITY;
	}

	public static float productFromFloat_(float receiver, float argument) {
		return argument * receiver;
	}

	public static float quotientFromFloat_(float receiver, float argument) {
		return argument / receiver;
	}

	public static Number rounded(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.HALF_UP);
	}

	private static Number roundToRoundingMode(float receiver,
			RoundingMode roundingMode) {
		BigDecimal bigDecimal = new BigDecimal(receiver);
		BigDecimal rounded = bigDecimal.setScale(0, roundingMode);
		return IntegerExtensions.objectFromBigInteger(rounded.toBigInteger());
	}

	public static float sumFromFloat_(float receiver, float argument) {
		return argument + receiver;
	}

	public static Number truncated(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.DOWN);
	}
}
