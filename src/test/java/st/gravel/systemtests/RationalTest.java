package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class RationalTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_denominator() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.RationalTest", "test_denominator");
	}
	@Test
	public void test_numerator() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.RationalTest", "test_numerator");
	}
}