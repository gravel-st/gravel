package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DyadicValuableTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_argumentCount() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DyadicValuableTest", "test_argumentCount");
	}
	@Test
	public void test_value_value_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.DyadicValuableTest", "test_value_value_");
	}
}