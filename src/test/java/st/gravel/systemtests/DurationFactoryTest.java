package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DurationFactoryTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_days_hours_minutes_seconds_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationFactoryTest", "test_days_hours_minutes_seconds_");
	}
	@Test
	public void test_seconds_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationFactoryTest", "test_seconds_");
	}
	@Test
	public void test_zero() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationFactoryTest", "test_zero");
	}
}