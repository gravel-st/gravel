package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DateAndTimeTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_asLocal() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_asLocal");
	}
	@Test
	public void test_asUTC() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_asUTC");
	}
	@Test
	public void test_dayOfMonth() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_dayOfMonth");
	}
	@Test
	public void test_dayOfWeek() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_dayOfWeek");
	}
	@Test
	public void test_dayOfWeekAbbreviation() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_dayOfWeekAbbreviation");
	}
	@Test
	public void test_dayOfWeekName() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_dayOfWeekName");
	}
	@Test
	public void test_dayOfYear() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_dayOfYear");
	}
	@Test
	public void test_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_equals");
	}
	@Test
	public void test_hour() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_hour");
	}
	@Test
	public void test_hour12() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_hour12");
	}
	@Test
	public void test_hour24() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_hour24");
	}
	@Test
	public void test_isLeapYear() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_isLeapYear");
	}
	@Test
	public void test_less() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_less");
	}
	@Test
	public void test_meridianAbbreviation() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_meridianAbbreviation");
	}
	@Test
	public void test_minus() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_minus");
	}
	@Test
	public void test_minute() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_minute");
	}
	@Test
	public void test_month() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_month");
	}
	@Test
	public void test_monthAbbreviation() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_monthAbbreviation");
	}
	@Test
	public void test_monthName() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_monthName");
	}
	@Test
	public void test_more() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_more");
	}
	@Test
	public void test_offset() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_offset");
	}
	@Test
	public void test_offset_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_offset_");
	}
	@Test
	public void test_plus() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_plus");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_printString");
	}
	@Test
	public void test_second() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_second");
	}
	@Test
	public void test_timeZoneAbbreviation() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_timeZoneAbbreviation");
	}
	@Test
	public void test_timeZoneName() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_timeZoneName");
	}
	@Test
	public void test_year() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeTest", "test_year");
	}
}