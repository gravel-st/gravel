package st.gravel.support.jvm;

import java.math.BigInteger;

public class IntegerExtensions {
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

	public static final BigInteger MIN_INT_VALUE = BigInteger
			.valueOf(Integer.MIN_VALUE);

	public static final BigInteger MAX_INT_VALUE = BigInteger
			.valueOf(Integer.MAX_VALUE);

	public static final BigInteger MIN_LONG_VALUE = BigInteger
			.valueOf(Long.MIN_VALUE);

	public static final BigInteger MAX_LONG_VALUE = BigInteger
			.valueOf(Long.MAX_VALUE);

	public static double asDouble(int receiver) {
		return receiver;
	}

	public static float asFloat(int receiver) {
		return receiver;
	}

	public static int asInt(BigInteger integer) {
		if ((integer.compareTo(IntegerExtensions.MAX_INT_VALUE) == 1)
				|| (integer.compareTo(IntegerExtensions.MIN_INT_VALUE) == -1)) {
			throw new RuntimeException("Integer out of range");
		} else {
			return (integer.intValue());
		}
	}

	public static long asLong(BigInteger integer) {
		if ((integer.compareTo(IntegerExtensions.MAX_LONG_VALUE) == 1)
				|| (integer.compareTo(IntegerExtensions.MIN_LONG_VALUE) == -1))
			throw new RuntimeException("Long out of range");
		return integer.longValue();
	}

	public static long asLong(Object argument) {
		if (argument instanceof Integer)
			return (int) argument;
		if (argument instanceof BigInteger) {
			return asLong((BigInteger) argument);
		}
		throw new IllegalArgumentException();
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

	public static int bitAnd_(int receiver, int other) {
		return receiver & other;
	}

	public static int bitOr_(int receiver, int other) {
		return receiver | other;
	}

	public static int bitShift_(int receiver, int other) {
		return receiver << other;
	}

	public static int bitXor_(int receiver, int other) {
		return receiver ^ other;
	}

	public static Number differenceFromLargeInteger_(int receiver,
			BigInteger argument) {
		return objectFromBigInteger(argument.subtract(BigInteger
				.valueOf(receiver)));
	}

	public static Number differenceFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) - receiver);
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

	private static int gcd(int a, int b) {
		// http://en.wikipedia.org/wiki/Euclidean_algorithm
		if (b == 0)
			return a;
		else
			return gcd(b, a % b);
	}

	public static Number gcdFromLargeInteger_(int receiver, BigInteger argument) {
		return LargeIntegerExtensions.gcdFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static int gcdFromSmallInteger_(int a, int b) {
		return gcd(Math.abs(b), Math.abs(a));
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

	public static Number integerQuotientFromLargeInteger_(int receiver,
			BigInteger argument) {
		return LargeIntegerExtensions.integerQuotientFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static int integerQuotientFromSmallInteger_(int y, int x) {
		int q = x / y;
		if ((x % y != 0) && ((x < 0) != (y < 0)))
			--q;
		return q;
	}

	public static boolean lessFromLargeInteger_(Integer receiver,
			BigInteger argument) {
		return argument.compareTo(BigInteger.valueOf((int) receiver)) == -1;
	}

	public static boolean lessFromSmallInteger_(Integer receiver,
			Integer argument) {
		return argument < receiver;
	}

	public static Number moduloQuotientFromLargeInteger_(int receiver,
			BigInteger argument) {
		return LargeIntegerExtensions.moduloQuotientFromLargeInteger_(
				BigInteger.valueOf(receiver), argument);
	}

	public static int moduloQuotientFromSmallInteger_(int y, int x) {
		int r = x % y;
		if (((r < 0) && (y > 0)) || ((r > 0) && (y < 0)))
			r += y;
		return r;
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

	static Number objectFromLong(final long result) {
		if (result > Integer.MAX_VALUE)
			return BigInteger.valueOf(result);
		if (result < Integer.MIN_VALUE)
			return BigInteger.valueOf(result);
		return Integer.valueOf((int) result);
	}

	public static String printBase_(Integer receiver, int radix) {
		return Integer.toString(receiver, radix);
	}

	public static Number productFromLargeInteger_(int receiver,
			BigInteger argument) {
		if (receiver == 0)
			return 0;
		return argument.multiply(BigInteger.valueOf(receiver));
	}

	public static Number productFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) * receiver);
	}

	public static Number quoFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.divide(BigInteger
				.valueOf(receiver)));
	}

	public static Number quoFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) / receiver);
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

	public static Number remFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.remainder(BigInteger
				.valueOf(receiver)));
	}

	public static int remFromSmallInteger_(int receiver, int argument) {
		return argument % receiver;
	}

	public static Number sumFromLargeInteger_(int receiver, BigInteger argument) {
		return objectFromBigInteger(argument.add(BigInteger.valueOf(receiver)));
	}

	public static Number sumFromSmallInteger_(int receiver, int argument) {
		return objectFromLong(((long) (argument)) + receiver);
	}
	
	public static double doubleDivFromLargeInteger_(int receiver,
			BigInteger argument) {
		return  (argument.doubleValue() / receiver);
	}

	public static double doubleDivFromSmallInteger_(int receiver, int argument) {
		return (double) argument / receiver;
	}

	public static float floatDivFromLargeInteger_(int receiver,
			BigInteger argument) {
		return (float) (argument.doubleValue() / receiver);
	}

	public static float floatDivFromSmallInteger_(int receiver, int argument) {
		return (float) (argument / receiver);
	}



}
