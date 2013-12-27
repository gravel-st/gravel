package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class BooleanTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_and() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_and");
	}
	@Test
	public void test_and_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_and_");
	}
	@Test
	public void test_eqv_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_eqv_");
	}
	@Test
	public void test_ifFalse_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_ifFalse_");
	}
	@Test
	public void test_ifFalse_ifTrue_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_ifFalse_ifTrue_");
	}
	@Test
	public void test_ifTrue_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_ifTrue_");
	}
	@Test
	public void test_ifTrue_ifFalse_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_ifTrue_ifFalse_");
	}
	@Test
	public void test_not() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_not");
	}
	@Test
	public void test_or_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_or_");
	}
	@Test
	public void test_pipe() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_pipe");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_printString");
	}
	@Test
	public void test_xor_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BooleanTest", "test_xor_");
	}
}