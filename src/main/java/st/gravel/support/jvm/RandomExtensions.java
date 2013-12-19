package st.gravel.support.jvm;

import java.math.BigInteger;
import java.security.SecureRandom;

public class RandomExtensions {
	private static final SecureRandom random = new SecureRandom();

	public static BigInteger nextInt() {
		return new BigInteger(130, random);
	}

	public static String nextUUIDString(Object receiver) {
		return nextInt().toString(32);
	}
}
