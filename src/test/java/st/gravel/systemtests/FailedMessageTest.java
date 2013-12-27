package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FailedMessageTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_arguments() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FailedMessageTest", "test_arguments");
	}
	@Test
	public void test_selector() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FailedMessageTest", "test_selector");
	}
}