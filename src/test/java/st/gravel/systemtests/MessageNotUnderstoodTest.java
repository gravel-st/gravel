package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class MessageNotUnderstoodTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_isResumable() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MessageNotUnderstoodTest", "test_isResumable");
	}
	@Test
	public void test_message() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MessageNotUnderstoodTest", "test_message");
	}
	@Test
	public void test_receiver() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.MessageNotUnderstoodTest", "test_receiver");
	}
}