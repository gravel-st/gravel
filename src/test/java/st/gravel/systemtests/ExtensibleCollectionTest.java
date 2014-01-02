package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ExtensibleCollectionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_addAll_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExtensibleCollectionTest", "test_addAll_");
	}
	@Test
	public void test_add_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExtensibleCollectionTest", "test_add_");
	}
	@Test
	public void test_removeAll_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExtensibleCollectionTest", "test_removeAll_");
	}
	@Test
	public void test_remove_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExtensibleCollectionTest", "test_remove_");
	}
	@Test
	public void test_remove_ifAbsent_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ExtensibleCollectionTest", "test_remove_ifAbsent_");
	}
}