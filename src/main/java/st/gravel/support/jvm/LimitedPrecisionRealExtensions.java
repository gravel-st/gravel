package st.gravel.support.jvm;

public class LimitedPrecisionRealExtensions {
	
	public static boolean denormalized() {
		// java float and double support denormalized values
		return true;
	}
	
	public static int radix() {
		// java float and double use 2 as their radix in normalization
		return 2;
	}
}
