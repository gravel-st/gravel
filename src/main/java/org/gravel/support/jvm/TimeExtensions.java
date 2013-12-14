package org.gravel.support.jvm;

import java.math.BigInteger;

public class TimeExtensions {
	private static final BigInteger ONE_MILLION = BigInteger.valueOf(1000000);

	public static long nanosecondClock(Object receiver) {
		return System.nanoTime();
	}

	public static Object waitForNanoseconds(final Object receiver,
			Object nanosecondsObject) {
		long timeout;
		int nanos;
		if (nanosecondsObject instanceof BigInteger) {
			final BigInteger nanoseconds = (BigInteger) nanosecondsObject;
			timeout = nanoseconds.divide(ONE_MILLION).longValue();
			nanos = nanoseconds.remainder(ONE_MILLION).intValue();
		} else if (nanosecondsObject instanceof Integer) {
			final int nanoseconds = (Integer) nanosecondsObject;
			timeout = nanoseconds / 1000000;
			nanos = nanoseconds % 1000000;
		} else {
			throw new RuntimeException("Unknown parameter type");
		}
		try {
			synchronized (receiver) {
				receiver.wait(timeout, nanos);
			}
		} catch (InterruptedException e) {
			throw new RuntimeException(e);
		}
		return receiver;
	}
}
