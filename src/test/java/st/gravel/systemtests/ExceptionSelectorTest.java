package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ExceptionSelectorTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_comma() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionSelectorTest", "test_comma");
	}
	@Test
	public void test_handles_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionSelectorTest", "test_handles_");
	}
}