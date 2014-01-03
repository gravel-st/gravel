package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class MagnitudeTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_between_and_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_between_and_");
	}
	@Test
	public void test_less() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_less");
	}
	@Test
	public void test_less_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_less_equals");
	}
	@Test
	public void test_max_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_max_");
	}
	@Test
	public void test_min_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_min_");
	}
	@Test
	public void test_more() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_more");
	}
	@Test
	public void test_more_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MagnitudeTest", "test_more_equals");
	}
}