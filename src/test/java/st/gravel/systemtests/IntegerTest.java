package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class IntegerTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_allMask_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_allMask_");
	}
	@Test
	public void test_anyMask_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_anyMask_");
	}
	@Test
	public void test_asScaledDecimal_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_asScaledDecimal_");
	}
	@Test
	public void test_bitAnd_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitAnd_");
	}
	@Test
	public void test_bitAt_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitAt_");
	}
	@Test
	public void test_bitAt_put_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitAt_put_");
	}
	@Test
	public void test_bitOr_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitOr_");
	}
	@Test
	public void test_bitShift_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitShift_");
	}
	@Test
	public void test_bitXor_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_bitXor_");
	}
	@Test
	public void test_even() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_even");
	}
	@Test
	public void test_factorial() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_factorial");
	}
	@Test
	public void test_gcd_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_gcd_");
	}
	@Test
	public void test_highBit() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_highBit");
	}
	@Test
	public void test_lcm_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_lcm_");
	}
	@Test
	public void test_noMask_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_noMask_");
	}
	@Test
	public void test_odd() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_odd");
	}
	@Test
	public void test_printOn_base_showRadix_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_printOn_base_showRadix_");
	}
	@Test
	public void test_printStringRadix_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntegerTest", "test_printStringRadix_");
	}
}