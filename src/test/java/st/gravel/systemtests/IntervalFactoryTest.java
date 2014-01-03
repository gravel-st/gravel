package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class IntervalFactoryTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_from_to_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalFactoryTest", "test_from_to_");
	}
	@Test
	public void test_from_to_by_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalFactoryTest", "test_from_to_by_");
	}
}