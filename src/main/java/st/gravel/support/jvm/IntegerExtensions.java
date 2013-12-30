package st.gravel.support.jvm;

import java.math.BigInteger;

public class IntegerExtensions {
	private static final BigInteger MIN_INT_VALUE = BigInteger
			.valueOf(Integer.MIN_VALUE);
	private static final BigInteger MAX_INT_VALUE = BigInteger
			.valueOf(Integer.MAX_VALUE);

	public static class Factory {

		public static Number fromValue(BigInteger integer) {
			if (integer.compareTo(MAX_INT_VALUE) == 1) {
				return integer;
			} else if (integer.compareTo(MIN_INT_VALUE) == -1) {
				return (integer);
			} else {
				return (integer.intValue());
			}
		}

		public static Number fromValue(long value) {
			if (value > Integer.MAX_VALUE || value < Integer.MIN_VALUE) {
				return BigInteger.valueOf(value);
			}
			return Integer.valueOf((int) value);
		}

	}

	static Number objectFromLong(final long result) {
		if (result > Integer.MAX_VALUE)
			return BigInteger.valueOf(result);
		if (result < Integer.MIN_VALUE)
			return BigInteger.valueOf(result);
		return Integer.valueOf((int) result);
	}

	static Number objectFromBigInteger(final BigInteger result) {
		if (result.compareTo(MAX_INT_VALUE) == 1) {
			return result;
		} else if (result.compareTo(MIN_INT_VALUE) == -1) {
			return (result);
		} else {
			return (result.intValue());
		}
	}

	public static Number sumFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) + receiver);
	}

	public static Number productFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) * receiver);
	}

	public static Number differenceFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) - receiver);
	}

	public static int remFromSmallInteger_(int receiver, int argument) {
		return argument % receiver;
	}

	public static Number sumFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.add(BigInteger.valueOf(receiver)));
	}

	public static Number quoFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.divide(BigInteger
				.valueOf(receiver)));
	}

	public static Number quoFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) / receiver);
	}

	public static int integerQuotientFromSmallInteger_(int y, int x) {
		int q = x / y;
		if ((x % y != 0) && ((x < 0) != (y < 0)))
			--q;
		return q;
	}

	public static Number integerQuotientFromLargeInteger_(int receiver,
			BigInteger argument) {
		return LargeIntegerExtensions.integerQuotientFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static int moduloQuotientFromSmallInteger_(int y, int x) {
		int r = x % y;
		if (((r < 0) && (y > 0)) || ((r > 0) && (y < 0)))
			r += y;
		return r;
	}

	public static Number moduloQuotientFromLargeInteger_(int receiver,
			BigInteger argument) {
		return LargeIntegerExtensions.moduloQuotientFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static Number productFromLargeInteger_(int receiver,
			BigInteger argument) {
		if (receiver == 0)
			return 0;
		return argument.multiply(BigInteger.valueOf(receiver));
	}

	public static Number differenceFromLargeInteger_(int receiver,
			BigInteger argument) {
		return objectFromBigInteger(argument.subtract(BigInteger
				.valueOf(receiver)));
	}

	public static Number remFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.remainder(BigInteger
				.valueOf(receiver)));
	}

	public static int gcdFromSmallInteger_(int a, int b) {
		if (b == 0)
			return a;
		return gcdFromSmallInteger_(a % b, b);
	}

	public static Number gcdFromLargeInteger_(int receiver, BigInteger argument) {
		return LargeIntegerExtensions.gcdFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static Number minus_(Object receiver, Object argument) {
		if (receiver instanceof Integer)
			return minus_((int) receiver, argument);
		if (receiver instanceof BigInteger)
			return minus_((BigInteger) receiver, argument);
		throw new IllegalArgumentException();
	}

	public static Number minus_(int receiver, Object argument) {
		if (argument instanceof Integer)
			return integerMinusInteger(receiver, (Integer) argument);
		if (argument instanceof BigInteger)
			return integerMinusBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException("argument.class: "
				+ argument.getClass());
	}

	public static Number minus_(Integer receiver, Object argument) {
		if (argument instanceof Integer)
			return integerMinusInteger(receiver, (Integer) argument);
		if (argument instanceof BigInteger)
			return integerMinusBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException("argument.class: "
				+ argument.getClass());
	}

	private static Number integerMinusBigInteger(long receiver,
			BigInteger argument) {
		return BigInteger.valueOf(receiver).subtract(argument);
	}

	private static Number integerMinusInteger(long receiver, long argument) {
		final long result = ((long) (receiver)) - argument;
		return objectFromLong(result);
	}

	public static Number multiply_(Object receiver, Object argument) {
		if (receiver instanceof Integer)
			return multiply_((int) receiver, argument);
		if (receiver instanceof BigInteger)
			return multiply_((BigInteger) receiver, argument);
		throw new IllegalArgumentException();
	}

	public static Number multiply_(Integer receiver, Object argument) {
		if (argument instanceof Integer)
			return integerMultiplyInteger(receiver, (int) argument);
		if (argument instanceof BigInteger)
			return integerMultiplyBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException();
	}

	public static Number multiply_(int receiver, Object argument) {
		if (argument instanceof Integer)
			return integerMultiplyInteger(receiver, (int) argument);
		if (argument instanceof BigInteger)
			return integerMultiplyBigInteger(receiver, (BigInteger) argument);
		throw new IllegalArgumentException();
	}

	private static BigInteger integerMultiplyBigInteger(long receiver,
			BigInteger argument) {
		return BigInteger.valueOf(receiver).multiply(argument);
	}

	private static Number integerMultiplyInteger(long receiver, int argument) {
		final long result = receiver * argument;
		return objectFromLong(result);
	}

	public static boolean equals_(int receiver, int other) {
		return receiver == other;
	}

	public static boolean equals_(int receiver, Integer other) {
		return other != null && other.intValue() == receiver;
	}

	public static boolean equals_(Integer receiver, int other) {
		return receiver != null && receiver.intValue() == other;
	}

	public static boolean equals_(Integer receiver, Integer other) {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	public static boolean isSmallerThan_(Integer receiver, Object other) {
		if (other instanceof BigInteger)
			return true;
		return receiver < (Integer) other;
	}

	public static Number integerDivision_(Object receiver, Object argument) {
		if (receiver instanceof Integer)
			return integerDivision_((int) receiver, argument);
		throw new IllegalArgumentException();
	}

	public static Integer integerDivision_(int receiver, Object argument) {
		if (argument instanceof Integer)
			return receiver / ((int) argument);
		if (argument instanceof BigInteger)
			return 0;
		throw new IllegalArgumentException();
	}

	public static Number integerRemainder_(Object receiver, Object argument) {
		if (receiver instanceof Integer)
			return integerRemainder_((int) receiver, argument);
		throw new IllegalArgumentException();
	}

	public static Integer integerRemainder_(int receiver, Object argument) {
		if (argument instanceof Integer)
			return receiver % ((int) argument);
		throw new IllegalArgumentException();
	}

	public static String printBase_(Integer receiver, int radix) {
		return Integer.toString(receiver, radix);
	}

	public static int bitAnd_(int receiver, int other) {
		return receiver & other;
	}

	public static int bitOr_(int receiver, int other) {
		return receiver | other;
	}

	public static int bitXor_(int receiver, int other) {
		return receiver ^ other;
	}

	public static Object raisedToInteger_(final int ibase, final int iexp) {
		// From:
		// http://stackoverflow.com/questions/101439/the-most-efficient-way-to-implement-an-integer-based-power-function-powint-int
		long result = 1;
		long base = ibase;
		int exp = iexp;
		while (exp != 0) {
			if ((exp & 1) != 0) {
				result *= base;
				if (result > Integer.MAX_VALUE || result < Integer.MIN_VALUE) {
					return bigIntegerRaisedToInteger_(ibase, iexp);
				}
			}
			exp >>= 1;
			base *= base;
			if (base > Integer.MAX_VALUE || base < Integer.MIN_VALUE) {
				return bigIntegerRaisedToInteger_(ibase, iexp);
			}
		}

		return Integer.valueOf((int) result);
	}

	public static BigInteger bigIntegerRaisedToInteger_(int ibase, int iexp) {
		// From:
		// http://stackoverflow.com/questions/101439/the-most-efficient-way-to-implement-an-integer-based-power-function-powint-int
		BigInteger result = BigInteger.valueOf(1);
		BigInteger base = BigInteger.valueOf(ibase);
		long exp = iexp;
		while (exp != 0) {
			if ((exp & 1) != 0) {
				result = result.multiply(base);
			}
			exp >>= 1;
			base = base.multiply(base);
		}
		return result;
	}

	public static int quo_(int receiver, int other) {
		return receiver / other;
	}

	public static int rem_(int receiver, int other) {
		return receiver % other;
	}

	public static int hashMultiply(int receiver) {
		int low14Bits = receiver & 0x3FFF;
		int a = receiver >> 14;
		int b = 0x0065 * low14Bits;
		int c = 0x260D * a + b;
		int d = c & 0x3FFF;
		int e = 0x260D * low14Bits;
		int f = 16384 * d;
		int g = f + e;
		return g & 0xFFFFFFF;
	}

}
