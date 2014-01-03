package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class NumberPrintTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_big_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_big_printString");
	}
	@Test
	public void test_fixed_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_fixed_printString");
	}
	@Test
	public void test_float_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_float_printString");
	}
	@Test
	public void test_fraction_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_fraction_printString");
	}
	@Test
	public void test_int_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_int_printString");
	}
	@Test
	public void test_zero_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.NumberPrintTest", "test_zero_printString");
	}
}