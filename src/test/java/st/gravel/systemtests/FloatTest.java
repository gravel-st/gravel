package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FloatTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_arcCos() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_arcCos");
	}
	@Test
	public void test_arcSin() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_arcSin");
	}
	@Test
	public void test_arcTan() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_arcTan");
	}
	@Test
	public void test_cos() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_cos");
	}
	@Test
	public void test_degreesToRadians() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_degreesToRadians");
	}
	@Test
	public void test_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_equals");
	}
	@Test
	public void test_exp() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_exp");
	}
	@Test
	public void test_floorLog_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_floorLog_");
	}
	@Test
	public void test_ln() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_ln");
	}
	@Test
	public void test_log_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_log_");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_printString");
	}
	@Test
	public void test_radiansToDegrees() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_radiansToDegrees");
	}
	@Test
	public void test_sin() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_sin");
	}
	@Test
	public void test_tan() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FloatTest", "test_tan");
	}
}