package st.gravel.support.jvm;

import java.math.BigInteger;

public class LargeIntegerExtensions {
	public static class Factory extends IntegerExtensions.Factory {
	}

	private static final BigInteger INTEGER_MIN_VALUE = BigInteger
			.valueOf(Integer.MIN_VALUE);
	private static final BigInteger INTEGER_MAX_VALUE = BigInteger
			.valueOf(Integer.MAX_VALUE);

	public static Object compressed(BigInteger integer) {
		return Factory.fromValue(integer);
	}

	public static int asSmallInteger(BigInteger integer) {
		if ((integer.compareTo(INTEGER_MAX_VALUE) == 1)
				|| (integer.compareTo(INTEGER_MIN_VALUE) == -1)) {
			throw new RuntimeException("Integer out of range");
		} else {
			return (integer.intValue());
		}
	}

	public static boolean equals_(BigInteger receiver, BigInteger other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}

	public static String printBase_(BigInteger receiver, int radix) {
		return receiver.toString(radix);
	}

	public static BigInteger quo_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return receiver.divide(BigInteger.valueOf((int)argument));
		if (argument instanceof BigInteger)
			return receiver.divide((BigInteger) argument);
		throw new IllegalArgumentException("argument.class: "
				+ argument.getClass());
	}

	public static BigInteger rem_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return receiver.remainder(BigInteger.valueOf((int)argument));
		if (argument instanceof BigInteger)
			return receiver.remainder((BigInteger) argument);
		throw new IllegalArgumentException("argument.class: "
				+ argument.getClass());
	}

	public static BigInteger gcd_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return receiver.gcd(BigInteger.valueOf((int)argument));
		if (argument instanceof BigInteger)
			return receiver.gcd((BigInteger) argument);
		throw new IllegalArgumentException("argument.class: "
				+ argument.getClass());
	}

	public static boolean isSmallerThan_(BigInteger receiver, Object other) {
		if (other instanceof BigInteger)
			return receiver.compareTo((BigInteger) other) < 0;
		return receiver.compareTo(BigInteger.valueOf((Integer) other)) < 0;
	}

	public static BigInteger multiply_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return bigIntegerMultiplyInteger(receiver, (int) argument);
		if (argument instanceof BigInteger)
			return bigIntegerMultiplyBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException();
	}

	private static BigInteger bigIntegerMultiplyBigInteger(BigInteger receiver,
			BigInteger argument) {
		return receiver.multiply(argument);
	}

	private static BigInteger bigIntegerMultiplyInteger(BigInteger receiver,
			int argument) {
		return receiver.multiply(BigInteger.valueOf(argument));
	}

	public static BigInteger plus_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return bigIntegerPlusInteger(receiver, (Integer) argument);
		if (argument instanceof BigInteger)
			return bigIntegerPlusBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException();
	}

	private static BigInteger bigIntegerPlusBigInteger(BigInteger receiver,
			BigInteger argument) {
		return receiver.add(argument);
	}

	private static BigInteger bigIntegerPlusInteger(BigInteger receiver,
			long argument) {
		return receiver.add(BigInteger.valueOf(argument));
	}

	public static BigInteger minus_(BigInteger receiver, Object argument) {
		if (argument instanceof Integer)
			return bigIntegerMinusInteger(receiver, (Integer) argument);
		if (argument instanceof BigInteger)
			return bigIntegerMinusBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException();
	}

	private static BigInteger bigIntegerMinusBigInteger(BigInteger receiver,
			BigInteger argument) {
		return receiver.subtract(argument);
	}

	private static BigInteger bigIntegerMinusInteger(BigInteger receiver,
			long argument) {
		return receiver.subtract(BigInteger.valueOf(argument));
	}

	public static BigInteger integerDivision_(BigInteger receiver,
			Object argument) {
		if (argument instanceof Integer)
			return receiver.divide(BigInteger.valueOf((int) argument));
		if (argument instanceof BigInteger)
			return receiver.divide((BigInteger) argument);
		throw new IllegalArgumentException();
	}

}
