package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class OrderedCollectionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_addAllFirst_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAllFirst_");
	}
	@Test
	public void test_addAllLast_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAllLast_");
	}
	@Test
	public void test_addAll_afterIndex_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAll_afterIndex_");
	}
	@Test
	public void test_addAll_after_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAll_after_");
	}
	@Test
	public void test_addAll_beforeIndex_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAll_beforeIndex_");
	}
	@Test
	public void test_addAll_before_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addAll_before_");
	}
	@Test
	public void test_addFirst_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addFirst_");
	}
	@Test
	public void test_addLast_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_addLast_");
	}
	@Test
	public void test_add_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_add_");
	}
	@Test
	public void test_add_afterIndex_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_add_afterIndex_");
	}
	@Test
	public void test_add_after_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_add_after_");
	}
	@Test
	public void test_add_beforeIndex_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_add_beforeIndex_");
	}
	@Test
	public void test_add_before_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.OrderedCollectionTest", "test_add_before_");
	}
}