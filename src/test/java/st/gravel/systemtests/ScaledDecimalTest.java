package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ScaledDecimalTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_scale() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ScaledDecimalTest", "test_scale");
	}
}