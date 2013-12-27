package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ClassDescriptionTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_allSubclasses() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ClassDescriptionTest", "test_allSubclasses");
	}
	@Test
	public void test_allSuperclasses() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ClassDescriptionTest", "test_allSuperclasses");
	}
	@Test
	public void test_name() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ClassDescriptionTest", "test_name");
	}
	@Test
	public void test_subclasses() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ClassDescriptionTest", "test_subclasses");
	}
	@Test
	public void test_superclass() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ClassDescriptionTest", "test_superclass");
	}
}