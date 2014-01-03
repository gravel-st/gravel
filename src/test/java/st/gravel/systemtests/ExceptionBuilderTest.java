package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ExceptionBuilderTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_messageText_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionBuilderTest", "test_messageText_");
	}
}