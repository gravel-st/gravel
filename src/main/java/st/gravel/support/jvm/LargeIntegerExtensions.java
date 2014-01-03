package st.gravel.support.jvm;

import java.math.BigInteger;

public class LargeIntegerExtensions {
	public static class Factory extends IntegerExtensions.Factory {
	}

	public static double asDouble(BigInteger receiver) {
		return receiver.doubleValue();
	}

	public static float asFloat(BigInteger receiver) {
		return receiver.floatValue();
	}

	public static Number bitAndFromLargeInteger_(BigInteger receiver,
			BigInteger operand) {
		return IntegerExtensions.objectFromBigInteger(operand.and(receiver));
	}

	public static Number bitAndFromSmallInteger_(BigInteger receiver,
			int operand) {
		return bitAndFromLargeInteger_(receiver, BigInteger.valueOf(operand));
	}

	public static int bitAndFromPositiveSmallInteger_(BigInteger receiver,
			int operand) {
		return operand & receiver.intValue();
	}

	public static BigInteger bitOrFromLargeInteger_(BigInteger receiver,
			BigInteger operand) {
		return operand.or(receiver);
	}

	public static Number bitOrFromSmallInteger_(BigInteger receiver, int operand) {
		return IntegerExtensions.objectFromBigInteger(((BigInteger
				.valueOf(operand)).or(receiver)));
	}

	public static Number bitShift_(BigInteger receiver, int operand) {
		return IntegerExtensions.objectFromBigInteger(receiver.shiftLeft(operand));
	}

	public static Number bitXorFromLargeInteger_(BigInteger receiver, BigInteger operand) {
		return IntegerExtensions.objectFromBigInteger(operand.xor(receiver));
	}

	public static Number bitXorFromSmallInteger_(BigInteger receiver, int operand) {
		return bitXorFromLargeInteger_(receiver, BigInteger.valueOf(operand));
	}

	public static Object compressed(BigInteger integer) {
		return Factory.fromValue(integer);
	}

	public static Number differenceFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument
				.subtract(receiver));
	}

	public static Number differenceFromSmallInteger_(BigInteger receiver,
			int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(
				argument).subtract(receiver));
	}

	public static double doubleDivFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return (argument.doubleValue() / receiver.doubleValue());
	}

	public static double doubleDivFromSmallInteger_(BigInteger receiver,
			int argument) {
		return (double) argument / receiver.doubleValue();
	}

	public static boolean equals_(BigInteger receiver, BigInteger other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}

	public static float floatDivFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return (float) (argument.doubleValue() / receiver.doubleValue());
	}

	public static float floatDivFromSmallInteger_(BigInteger receiver,
			int argument) {
		return (float) (argument / receiver.doubleValue());
	}

	public static Number gcdFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument.gcd(receiver));
	}

	public static Number gcdFromSmallInteger_(BigInteger receiver, int argument) {
		return gcdFromLargeInteger_(receiver, BigInteger.valueOf(argument));
	}

	public static Number integerQuotientFromLargeInteger_(BigInteger y,
			BigInteger x) {
		// http://www.microhowto.info/howto/round_towards_minus_infinity_when_dividing_integers_in_java.html
		BigInteger q = x.divide(y);
		if (x.signum() != y.signum())
			return IntegerExtensions.objectFromBigInteger(q
					.subtract(BigInteger.ONE));
		return IntegerExtensions.objectFromBigInteger(q);
	}

	public static Number integerQuotientFromSmallInteger_(BigInteger receiver,
			int argument) {
		if (argument == 0)
			return 0;
		return integerQuotientFromLargeInteger_(receiver,
				BigInteger.valueOf(argument));
	}

	public static boolean isSmallerThan_(BigInteger receiver, Object other) {
		if (other instanceof BigInteger)
			return receiver.compareTo((BigInteger) other) < 0;
		return receiver.compareTo(BigInteger.valueOf((Integer) other)) < 0;
	}

	public static boolean lessFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return argument.compareTo(receiver) == -1;
	}

	public static boolean lessFromSmallInteger_(BigInteger receiver,
			Integer argument) {
		return BigInteger.valueOf((int) argument).compareTo(receiver) == -1;
	}

	public static Number moduloQuotientFromLargeInteger_(BigInteger n,
			BigInteger x) {
		BigInteger r = x.remainder(n);
		if (x.signum() != n.signum())
			return IntegerExtensions.objectFromBigInteger(r.add(n));
		return IntegerExtensions.objectFromBigInteger(r);
	}

	public static Number moduloQuotientFromSmallInteger_(BigInteger receiver,
			int argument) {
		if (argument == 0)
			return 0;
		return moduloQuotientFromLargeInteger_(receiver,
				BigInteger.valueOf(argument));
	}

	public static BigInteger multiply_(BigInteger receiver, BigInteger argument) {
		// only used by parser
		return argument.multiply(receiver);
	}

	public static BigInteger multiply_(BigInteger receiver, int argument) {
		// only used by parser
		return BigInteger.valueOf(argument).multiply(receiver);
	}

	public static BigInteger plus_(BigInteger receiver, BigInteger argument) {
		// only used by parser (so no compression needed)
		return argument.add(receiver);
	}

	public static BigInteger plus_(BigInteger receiver, int argument) {
		// only used by parser (so no compression needed)
		return BigInteger.valueOf(argument).add(receiver);
	}

	public static String printBase_(BigInteger receiver, int radix) {
		return receiver.toString(radix);
	}

	public static BigInteger productFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return argument.multiply(receiver);
	}

	public static Number productFromSmallInteger_(BigInteger receiver,
			int argument) {
		if (argument == 0)
			return 0;
		return BigInteger.valueOf(argument).multiply(receiver);
	}

	public static Number quoFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return IntegerExtensions
				.objectFromBigInteger(argument.divide(receiver));
	}

	public static Number quoFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(
				argument).divide(receiver));
	}

	public static Number remFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return IntegerExtensions.objectFromBigInteger(argument
				.remainder(receiver));
	}

	public static Number remFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(
				argument).remainder(receiver));
	}

	public static BigInteger sumFromLargeInteger_(BigInteger receiver,
			BigInteger argument) {
		return argument.add(receiver);
	}

	public static Number sumFromSmallInteger_(BigInteger receiver, int argument) {
		return IntegerExtensions.objectFromBigInteger(BigInteger.valueOf(
				argument).add(receiver));
	}

}
