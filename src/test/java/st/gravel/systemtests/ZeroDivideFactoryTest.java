package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ZeroDivideFactoryTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_dividend_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ZeroDivideFactoryTest", "test_dividend_");
	}
	@Test
	public void test_signal() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ZeroDivideFactoryTest", "test_signal");
	}
}