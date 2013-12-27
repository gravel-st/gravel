package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ReadableStringTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_asLowercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_asLowercase");
	}
	@Test
	public void test_asString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_asString");
	}
	@Test
	public void test_asSymbol() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_asSymbol");
	}
	@Test
	public void test_asUppercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_asUppercase");
	}
	@Test
	public void test_comma() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_comma");
	}
	@Test
	public void test_copyReplaceAll_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_copyReplaceAll_with_");
	}
	@Test
	public void test_copyReplaceFrom_to_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_copyReplaceFrom_to_with_");
	}
	@Test
	public void test_copyReplacing_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_copyReplacing_withObject_");
	}
	@Test
	public void test_copyWith_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_copyWith_");
	}
	@Test
	public void test_less() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_less");
	}
	@Test
	public void test_less_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_less_equals");
	}
	@Test
	public void test_more() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_more");
	}
	@Test
	public void test_more_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_more_equals");
	}
	@Test
	public void test_sameAs_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_sameAs_");
	}
	@Test
	public void test_subStrings_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadableStringTest", "test_subStrings_");
	}
}