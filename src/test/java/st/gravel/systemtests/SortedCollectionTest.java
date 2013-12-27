package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SortedCollectionTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_add_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_add_");
	}
	@Test
	public void test_asSortedCollection() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_asSortedCollection");
	}
	@Test
	public void test_collect_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_collect_");
	}
	@Test
	public void test_comma() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_comma");
	}
	@Test
	public void test_copyReplaceAll_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_copyReplaceAll_with_");
	}
	@Test
	public void test_copyReplaceFrom_to_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_copyReplaceFrom_to_withObject_");
	}
	@Test
	public void test_copyReplaceFrom_to_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_copyReplaceFrom_to_with_");
	}
	@Test
	public void test_copyReplacing_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_copyReplacing_withObject_");
	}
	@Test
	public void test_reverse() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_reverse");
	}
	@Test
	public void test_sortBlock() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_sortBlock");
	}
	@Test
	public void test_sortBlock_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SortedCollectionTest", "test_sortBlock_");
	}
}