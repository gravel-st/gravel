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
	
	public static double arcSin(double receiver) {
		return Math.asin(receiver);
	}
	
	public static double arcCos(double receiver) {
		return Math.acos(receiver);
	}
	
	public static double arcTan(double receiver) {
		return Math.atan(receiver);
	}
}
