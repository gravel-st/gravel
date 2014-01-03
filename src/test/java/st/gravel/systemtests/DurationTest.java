package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DurationTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_abs() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_abs");
	}
	@Test
	public void test_asSeconds() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_asSeconds");
	}
	@Test
	public void test_days() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_days");
	}
	@Test
	public void test_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_equals");
	}
	@Test
	public void test_hours() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_hours");
	}
	@Test
	public void test_less() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_less");
	}
	@Test
	public void test_minus() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_minus");
	}
	@Test
	public void test_minutes() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_minutes");
	}
	@Test
	public void test_more() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_more");
	}
	@Test
	public void test_negated() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_negated");
	}
	@Test
	public void test_negative() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_negative");
	}
	@Test
	public void test_plus() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_plus");
	}
	@Test
	public void test_positive() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_positive");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_printString");
	}
	@Test
	public void test_seconds() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_seconds");
	}
	@Test
	public void test_slash() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_slash");
	}
	@Test
	public void test_times() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DurationTest", "test_times");
	}
}