package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class MonadicValuableTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_argumentCount() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MonadicValuableTest", "test_argumentCount");
	}
	@Test
	public void test_value_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MonadicValuableTest", "test_value_");
	}
}