package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SignaledExceptionTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_isNested() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_isNested");
	}
	@Test
	public void test_outer() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_outer");
	}
	@Test
	public void test_pass() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_pass");
	}
	@Test
	public void test_resignalAs_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_resignalAs_");
	}
	@Test
	public void test_resume() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_resume");
	}
	@Test
	public void test_resume_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_resume_");
	}
	@Test
	public void test_retry() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_retry");
	}
	@Test
	public void test_retryUsing_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_retryUsing_");
	}
	@Test
	public void test_return() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_return");
	}
	@Test
	public void test_return_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SignaledExceptionTest", "test_return_");
	}
}