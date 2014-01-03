package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class AbstractDictionaryTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_addAll_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_addAll_");
	}
	@Test
	public void test_at_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_at_");
	}
	@Test
	public void test_at_ifAbsentPut_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_at_ifAbsentPut_");
	}
	@Test
	public void test_at_ifAbsent_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_at_ifAbsent_");
	}
	@Test
	public void test_at_put_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_at_put_");
	}
	@Test
	public void test_collect_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_collect_");
	}
	@Test
	public void test_includesKey_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_includesKey_");
	}
	@Test
	public void test_keyAtValue_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_keyAtValue_");
	}
	@Test
	public void test_keyAtValue_ifAbsent_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_keyAtValue_ifAbsent_");
	}
	@Test
	public void test_keys() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_keys");
	}
	@Test
	public void test_keysAndValuesDo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_keysAndValuesDo_");
	}
	@Test
	public void test_keysDo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_keysDo_");
	}
	@Test
	public void test_reject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_reject_");
	}
	@Test
	public void test_removeAllKeys_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_removeAllKeys_");
	}
	@Test
	public void test_removeAllKeys_ifAbsent_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_removeAllKeys_ifAbsent_");
	}
	@Test
	public void test_removeKey_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_removeKey_");
	}
	@Test
	public void test_removeKey_ifAbsent_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_removeKey_ifAbsent_");
	}
	@Test
	public void test_select_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_select_");
	}
	@Test
	public void test_values() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.AbstractDictionaryTest", "test_values");
	}
}