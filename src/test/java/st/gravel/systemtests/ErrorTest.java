package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ErrorTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_defaultAction() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ErrorTest", "test_defaultAction");
	}
	@Test
	public void test_isResumable() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ErrorTest", "test_isResumable");
	}
}