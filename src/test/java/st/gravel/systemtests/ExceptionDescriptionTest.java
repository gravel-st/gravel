package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ExceptionDescriptionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_defaultAction() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionDescriptionTest", "test_defaultAction");
	}
	@Test
	public void test_description() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionDescriptionTest", "test_description");
	}
	@Test
	public void test_isResumable() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionDescriptionTest", "test_isResumable");
	}
	@Test
	public void test_messageText() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionDescriptionTest", "test_messageText");
	}
	@Test
	public void test_tag() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExceptionDescriptionTest", "test_tag");
	}
}