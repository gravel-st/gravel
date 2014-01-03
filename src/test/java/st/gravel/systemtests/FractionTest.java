package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FractionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_denominator() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FractionTest", "test_denominator");
	}
	@Test
	public void test_numerator() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FractionTest", "test_numerator");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FractionTest", "test_printString");
	}
}