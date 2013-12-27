package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FloatCharacterizationTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_denormalized() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_denormalized");
	}
	@Test
	public void test_e() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_e");
	}
	@Test
	public void test_emax() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_emax");
	}
	@Test
	public void test_emin() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_emin");
	}
	@Test
	public void test_epsilon() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_epsilon");
	}
	@Test
	public void test_fmax() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_fmax");
	}
	@Test
	public void test_fmin() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_fmin");
	}
	@Test
	public void test_fminDenormalized() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_fminDenormalized");
	}
	@Test
	public void test_fminNormalized() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_fminNormalized");
	}
	@Test
	public void test_pi() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_pi");
	}
	@Test
	public void test_precision() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_precision");
	}
	@Test
	public void test_radix() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatCharacterizationTest", "test_radix");
	}
}