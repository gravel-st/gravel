package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class CollectionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_allSatisfy_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_allSatisfy_");
	}
	@Test
	public void test_anySatisfy_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_anySatisfy_");
	}
	@Test
	public void test_asArray() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asArray");
	}
	@Test
	public void test_asBag() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asBag");
	}
	@Test
	public void test_asByteArray() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asByteArray");
	}
	@Test
	public void test_asOrderedCollection() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asOrderedCollection");
	}
	@Test
	public void test_asSet() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asSet");
	}
	@Test
	public void test_asSortedCollection() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asSortedCollection");
	}
	@Test
	public void test_asSortedCollection_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_asSortedCollection_");
	}
	@Test
	public void test_collect_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_collect_");
	}
	@Test
	public void test_detect_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_detect_");
	}
	@Test
	public void test_detect_ifNone_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_detect_ifNone_");
	}
	@Test
	public void test_do_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_do_");
	}
	@Test
	public void test_do_separatedBy_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_do_separatedBy_");
	}
	@Test
	public void test_includes_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_includes_");
	}
	@Test
	public void test_inject_into_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_inject_into_");
	}
	@Test
	public void test_isEmpty() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_isEmpty");
	}
	@Test
	public void test_notEmpty() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_notEmpty");
	}
	@Test
	public void test_occurrencesOf_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_occurrencesOf_");
	}
	@Test
	public void test_rehash() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_rehash");
	}
	@Test
	public void test_reject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_reject_");
	}
	@Test
	public void test_select_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_select_");
	}
	@Test
	public void test_size() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionTest", "test_size");
	}
}