package st.gravel.support.jvm;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;

public class FloatExtensions {
	public static double asDouble(float receiver) {
		return receiver;
	}
	
	public static Number ceiling(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.FLOOR);
	}
	
	public static double differenceFromDouble_(float receiver, double argument) {
		return argument - receiver;
	}
	
	public static float differenceFromFloat_(float receiver, float argument) {
		return argument - receiver;
	}

	public static float differenceFromLargeInteger_(float receiver,
			BigInteger argument) {
		return argument.floatValue() - receiver;
	}
	
	public static float differenceFromSmallInteger_(float receiver, int argument) {
		return argument - receiver;
	}
	
	public static int emax() {
		return Float.MAX_EXPONENT;
	}

	public static int emin() {
		return Float.MIN_EXPONENT;
	}
	
	public static float epsilon() {
		return Math.ulp(1.0f);
	}

	public static Number floor(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.FLOOR);
	}
	
	public static float fmax() {	
		return Float.MAX_VALUE;
	}

	public static float fminDenormalized() {
		return Float.MIN_VALUE;
	}

	public static float fminNormalized() {
		return Float.MIN_NORMAL;
	}

	public static boolean lessFromDouble_(float receiver, double argument) {
		return argument < receiver;
	}
	
	public static boolean lessFromFloat_(float receiver, float argument) {
		return argument < receiver;
	}

	public static boolean lessFromLargeInteger_(float receiver,
			BigInteger argument) {
		return new BigDecimal(argument).compareTo(BigDecimal.valueOf(receiver)) == -1;
	}
	
	public static boolean lessFromSmallInteger_(float receiver, int argument) {
		return argument < receiver;
	}
	
	public static float ln(float receiver) {
		return (float)Math.log(receiver);
	}

	public static float naN() {
		return Float.NaN;
	}
	
	public static float negativeInfinity() {
		return Float.NEGATIVE_INFINITY;
	}

	public static float positiveInfinity() {
		return Float.POSITIVE_INFINITY;
	}
	
	
	
	public static int precision() {
		return 32;
	}

	public static String printBase_(float receiver, int radix) {
		if (radix == 10)
			return Float.toString(receiver);
		throw new UnsupportedOperationException("Unsupported radix: " + radix);
	}

	public static double productFromDouble_(float receiver, double argument) {
		return argument * receiver;
	}

	public static float productFromFloat_(float receiver, float argument) {
		return argument * receiver;
	}

	public static float productFromLargeInteger_(float receiver,
			BigInteger argument) {
		return argument.floatValue() * receiver;
	}

	public static float productFromSmallInteger_(float receiver, int argument) {
		return argument * receiver;
	}

	public static float quotientFromFloat_(float receiver, float argument) {
		return argument / receiver;
	}
	
	public static double quotientFromDouble_(float receiver, double argument) {
		return argument / receiver;
	}
	
	public static float quotientFromLargeInteger_(float receiver,
			BigInteger argument) {
		return argument.floatValue() / receiver;
	}

	public static float quotientFromSmallInteger_(float receiver, int argument) {
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

	public static float sqrt(float receiver) {
		return (float) Math.sqrt(receiver);
	}

	public static double sumFromDouble_(float receiver, double argument) {
		return argument + receiver;
	}
	
	public static float sumFromFloat_(float receiver, float argument) {
		return argument + receiver;
	}

	public static float sumFromLargeInteger_(float receiver, BigInteger argument) {
		return argument.floatValue() + receiver;
	}

	public static float sumFromSmallInteger_(float receiver, int argument) {
		return argument + receiver;
	}

	public static Number truncated(float receiver) {
		return roundToRoundingMode(receiver, RoundingMode.DOWN);
	}
}
