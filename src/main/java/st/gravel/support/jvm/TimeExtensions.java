package st.gravel.support.jvm;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class TimeExtensions {
	private static final BigInteger ONE_MILLION = BigInteger.valueOf(1000000);
	private static final long nanoOffset = calculateNanoOffset();

	public static long nanosecondClock() {
		return System.nanoTime() + nanoOffset;
	}

	public static long clockPrecisionNS() {
		long sample = System.nanoTime();
		long prec = Long.MAX_VALUE;
		for (int samples = 0; samples < 10;) {
			long diff = System.nanoTime() - sample;
			if (diff > 0) {
				prec = Math.min(diff, prec);
				samples++;
			}
		}
		System.out.println(prec);
		return prec;
	}

	public static TimeZone defaultTimeZone() {
		return TimeZone.getDefault();
	}

	public static TimeZone getTimeZoneNamed_(String name) {
		return TimeZone.getTimeZone(name);
	}

	public static TimeZone getTimeZoneForOffsetMS_(int ms) {
		String[] availableIDs = TimeZone.getAvailableIDs(ms);
		if (availableIDs.length == 0)
			throw new RuntimeException("No timezone for offset: " + ms);
		return getTimeZoneNamed_(availableIDs[0]);
	}

	public static Calendar newCalendar_timeZone_(long millis, TimeZone timeZone) {
		Calendar calendar = Calendar.getInstance(timeZone);
		calendar.setTimeInMillis(millis);
		return calendar;
	}

	public static Calendar newCalendarFromString_(String str) throws ParseException {
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss.SSS");
	    cal.setTime(sdf.parse(str));
		return cal;
	}

	public static int year(Calendar cal) {
		return cal.get(Calendar.YEAR);
	}
	public static int monthIndex(Calendar cal) {
		return cal.get(Calendar.MONTH)+1;
	}
	public static int dayOfMonth(Calendar cal) {
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	public static int dayOfYear(Calendar cal) {
		return cal.get(Calendar.DAY_OF_YEAR);
	}
	public static int hour(Calendar cal) {
		return cal.get(Calendar.HOUR_OF_DAY);
	}
	public static int minute(Calendar cal) {
		return cal.get(Calendar.MINUTE);
	}
	public static int second(Calendar cal) {
		return cal.get(Calendar.SECOND);
	}
	public static boolean isLeapYear(Calendar cal) {
		return new GregorianCalendar().isLeapYear(year(cal)); 
	}
	private static long calculateNanoOffset() {
		long currentTimeMillis = System.currentTimeMillis();
		long nanoTime = System.nanoTime();
		return (currentTimeMillis * 1000000) - nanoTime;
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
