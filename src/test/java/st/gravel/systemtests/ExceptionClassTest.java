package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ExceptionClassTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_handles_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionClassTest", "test_handles_");
	}
	@Test
	public void test_new() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionClassTest", "test_new");
	}
	@Test
	public void test_signal() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionClassTest", "test_signal");
	}
}