package st.gravel.support.jvm;

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
	
	public static double cos(double receiver) {
		return Math.cos(receiver);
	}

	public static double degreesToRadians(double receiver) {
		return Math.toRadians(receiver);
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
	
	public static double fmax() {
		return Double.MAX_VALUE;
	}
	
	public static double fminDenormalized() {
		return Double.MIN_VALUE;
	}
	
	public static double fminNormalized() {
		return Double.MIN_NORMAL;
	}
	
	public static double ln(double receiver) {
		return Math.log(receiver);
	}
	
	public static int precision() {
		return 64;
	}
	
	public static double radiansToDegrees(double receiver) {
		return Math.toDegrees(receiver);
	}
	
	public static double sin(double receiver) {
		return Math.sin(receiver);
	}
	
	public static double sqrt(double receiver) {
		return Math.sqrt(receiver);
	}
	
	public static double tan(double receiver) {
		return Math.tan(receiver);
	}
}
