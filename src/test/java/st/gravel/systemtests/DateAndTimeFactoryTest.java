package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DateAndTimeFactoryTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_clockPrecision() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_clockPrecision");
	}
	@Test
	public void test_now() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_now");
	}
	@Test
	public void test_year_day_hour_minute_second_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_year_day_hour_minute_second_");
	}
	@Test
	public void test_year_day_hour_minute_second_offset_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_year_day_hour_minute_second_offset_");
	}
	@Test
	public void test_year_month_day_hour_minute_second_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_year_month_day_hour_minute_second_");
	}
	@Test
	public void test_year_month_day_hour_minute_second_offset_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DateAndTimeFactoryTest", "test_year_month_day_hour_minute_second_offset_");
	}
}