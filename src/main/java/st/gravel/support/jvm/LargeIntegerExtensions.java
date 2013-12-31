package st.gravel.support.jvm;

import java.math.BigInteger;

public class LargeIntegerExtensions {
	public static class Factory extends IntegerExtensions.Factory {
	}

	public static float asFloat(BigInteger receiver) {
		return receiver.floatValue();
	}

	public static Object compressed(BigInteger integer) {
		return Factory.fromValue(integer);
	}

	public static Number differenceFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument.subtract(receiver));
	}

	public static Number differenceFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(argument).subtract(receiver));
	}
	
	public static boolean equals_(BigInteger receiver, BigInteger other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}

	public static Number gcdFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument.gcd(receiver));
	}
	
	public static Number gcdFromSmallInteger_(BigInteger receiver, int argument) {
		return gcdFromLargeInteger_(receiver, BigInteger.valueOf(argument));
	}

	public static Number integerQuotientFromLargeInteger_(BigInteger y, BigInteger x) {
		// http://www.microhowto.info/howto/round_towards_minus_infinity_when_dividing_integers_in_java.html
		BigInteger q = x.divide(y);
		if (x.signum() != y.signum())
			return IntegerExtensions.objectFromBigInteger(q.subtract(BigInteger.ONE));
		return IntegerExtensions.objectFromBigInteger(q);
	}

	public static Number integerQuotientFromSmallInteger_(BigInteger receiver, int argument) {
		if (argument == 0) return 0;
		return integerQuotientFromLargeInteger_(receiver, BigInteger.valueOf(argument));
	}

	public static boolean isSmallerThan_(BigInteger receiver, Object other) {
		if (other instanceof BigInteger)
			return receiver.compareTo((BigInteger) other) < 0;
		return receiver.compareTo(BigInteger.valueOf((Integer) other)) < 0;
	}

	public static Number moduloQuotientFromLargeInteger_(BigInteger n, BigInteger x) {
		BigInteger r = x.remainder(n);
		if (x.signum() != n.signum())
			return IntegerExtensions.objectFromBigInteger(r.add(n));
		return IntegerExtensions.objectFromBigInteger(r);
	}

	public static Number moduloQuotientFromSmallInteger_(BigInteger receiver, int argument) {
		if (argument == 0) return 0;
		return moduloQuotientFromLargeInteger_(receiver, BigInteger.valueOf(argument));
	}

	public static BigInteger multiply_(BigInteger receiver, int argument) {
		return BigInteger.valueOf(argument).multiply(receiver);
	}

	public static BigInteger plus_(BigInteger receiver, int argument) {
		return BigInteger.valueOf(argument).add(receiver);
	}

	public static String printBase_(BigInteger receiver, int radix) {
		return receiver.toString(radix);
	}
	
	public static BigInteger productFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return argument.multiply(receiver);
	}

	public static Number productFromSmallInteger_(BigInteger receiver, int argument) {
		if (argument == 0) return 0;
		return BigInteger.valueOf(argument).multiply(receiver);
	}

	public static Number quoFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument.divide(receiver));
	}

	public static Number quoFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(argument).divide(receiver));
	}

	public static Number remFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument.remainder(receiver));
	}

	public static Number remFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(argument).remainder(receiver));
	}

	public static BigInteger sumFromLargeInteger_(BigInteger receiver, BigInteger argument) {
		return argument.add(receiver);
	}

	public static Number sumFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(argument).add(receiver));
	}

}
