package st.gravel.support.jvm;

public class DoubleExtensions {
	public static float asFloat(double receiver) {
		return (float) receiver;
	}

	public static double ln(double receiver) {
		return Math.log(receiver);
	}	
	
	public static double sqrt(double receiver) {
		return Math.sqrt(receiver);
	}
	
	public static double sin(double receiver) {
		return Math.sin(receiver);
	}
	
	public static double cos(double receiver) {
		return Math.cos(receiver);
	}
	
	public static double tan(double receiver) {
		return Math.tan(receiver);
	}
	
	public static double degreesToRadians(double receiver) {
		return Math.toRadians(receiver);
	}
	
	public static double radiansToDegrees(double receiver) {
		return Math.toDegrees(receiver);
	}
	
	public static double arcSin(double receiver) {
		return Math.asin(receiver);
	}
	
	public static double arcCos(double receiver) {
		return Math.acos(receiver);
	}
	
	public static double arcTan(double receiver) {
		return Math.atan(receiver);
	}
	
	public static double exp(double receiver) {
		return Math.exp(receiver);
	}
}
