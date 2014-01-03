package st.gravel.support.jvm;

public class DoubleExtensions {
	public static double sqrt(double receiver) {
		return Math.sqrt(receiver);
	}

	public static float asFloat(double receiver) {
		return (float) receiver;
	}

}
