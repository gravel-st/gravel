package st.gravel.support.jvm;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;

public class DoubleExtensions {
	public static double arcCos(double receiver) {
		return Math.acos(receiver);
	}
	
	public static double arcSin(double receiver) {
		return Math.asin(receiver);
	}
	
	public static double arcTan(double receiver) {
		return Math.atan(receiver);
	}
	
	public static float asFloat(double receiver) {
		return (float) receiver;
	}
	
	public static Number ceiling(double receiver) {
		return roundToRoundingMode(receiver, RoundingMode.FLOOR);
	}
	
	public static double cos(double receiver) {
		return Math.cos(receiver);
	}
	
	public static double degreesToRadians(double receiver) {
		return Math.toRadians(receiver);
	}

	public static double differenceFromDouble_(double receiver, double argument) {
		return argument - receiver;
	}
	
	public static int emax() {
		return Double.MAX_EXPONENT;
	}
	
	public static int emin() {
		return Double.MIN_EXPONENT;
	}
	
	public static double epsilon() {
		return Math.ulp(1.0d);
	}

	public static double exp(double receiver) {
		return Math.exp(receiver);
	}

	public static Number floor(double receiver) {
		return roundToRoundingMode(receiver, RoundingMode.FLOOR);
	}

	public static double fmax() {
		return Double.MAX_VALUE;
	}	
	
	public static double fminDenormalized() {
		return Double.MIN_VALUE;
	}
	
	public static double fminNormalized() {
		return Double.MIN_NORMAL;
	}
	
	public static boolean lessFromDouble_(double receiver, double argument) {
		return argument < receiver;
	}
	
	public static boolean lessFromFloat_(double receiver, float argument) {
		return argument < receiver;
	}
	
	public static boolean lessFromLargeInteger_(double receiver,
			BigInteger argument) {
		return new BigDecimal(argument).compareTo(BigDecimal.valueOf(receiver)) == -1;
	}
	
	public static boolean lessFromSmallInteger_(double receiver, int argument) {
		return argument < receiver;
	}
	
	public static double ln(double receiver) {
		return Math.log(receiver);
	}
	
	public static double naN() {
		return Double.NaN;
	}
	
	public static double negativeInfinity() {
		return Double.NEGATIVE_INFINITY;
	}

	public static double positiveInfinity() {
		return Double.POSITIVE_INFINITY;
	}

	public static int precision() {
		return 64;
	}
	
	public static double productFromDouble_(double receiver, double argument) {
		return argument * receiver;
	}
	
	public static double productFromFloat_(double receiver, float argument) {
		return argument * receiver;
	}
	
	public static double productFromLargeInteger_(double receiver,
			BigInteger argument) {
		return argument.floatValue() * receiver;
	}
	
	public static double productFromSmallInteger_(double receiver, int argument) {
		return argument * receiver;
	}
	
	public static double quotientFromDouble_(double receiver, double argument) {
		return argument / receiver;
	}
	
	public static double quotientFromFloat_(double receiver, float argument) {
		return argument / receiver;
	}
	
	public static double quotientFromLargeInteger_(double receiver,
			BigInteger argument) {
		return argument.doubleValue() / receiver;
	}
	
	public static double quotientFromSmallInteger_(double receiver, int argument) {
		return argument / receiver;
	}
	
	public static double radiansToDegrees(double receiver) {
		return Math.toDegrees(receiver);
	}
	
	
	
	
	public static Number rounded(double receiver) {
		return roundToRoundingMode(receiver, RoundingMode.HALF_UP);
	}

	private static Number roundToRoundingMode(double receiver,
			RoundingMode roundingMode) {
		BigDecimal bigDecimal = new BigDecimal(receiver);
		BigDecimal rounded = bigDecimal.setScale(0, roundingMode);
		return IntegerExtensions.objectFromBigInteger(rounded.toBigInteger());
	}

	public static double sin(double receiver) {
		return Math.sin(receiver);
	}

	public static double sqrt(double receiver) {
		return Math.sqrt(receiver);
	}

	public static double sumFromDouble_(double receiver, double argument) {
		return argument + receiver;
	}

	public static double sumFromLargeInteger_(double receiver, BigInteger argument) {
		return argument.doubleValue() + receiver;
	}
	
	
	public static double sumFromSmallInteger_(double receiver, int argument) {
		return argument + receiver;
	}

	public static double tan(double receiver) {
		return Math.tan(receiver);
	}

	public static Number truncated(double receiver) {
		return roundToRoundingMode(receiver, RoundingMode.DOWN);
	}
}
