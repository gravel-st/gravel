package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ObjectTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_class() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_class");
	}
	@Test
	public void test_copy() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_copy");
	}
	@Test
	public void test_doesNotUnderstand_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_doesNotUnderstand_");
	}
	@Test
	public void test_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_equals");
	}
	@Test
	public void test_equals_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_equals_equals");
	}
	@Test
	public void test_error_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_error_");
	}
	@Test
	public void test_hash() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_hash");
	}
	@Test
	public void test_identityHash() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_identityHash");
	}
	@Test
	public void test_isKindOf_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_isKindOf_");
	}
	@Test
	public void test_isMemberOf_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_isMemberOf_");
	}
	@Test
	public void test_isNil() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_isNil");
	}
	@Test
	public void test_notNil() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_notNil");
	}
	@Test
	public void test_perform_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_perform_");
	}
	@Test
	public void test_perform_withArguments_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_perform_withArguments_");
	}
	@Test
	public void test_perform_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_perform_with_");
	}
	@Test
	public void test_perform_with_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_perform_with_with_");
	}
	@Test
	public void test_perform_with_with_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_perform_with_with_with_");
	}
	@Test
	public void test_printOn_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_printOn_");
	}
	@Test
	public void test_printString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_printString");
	}
	@Test
	public void test_respondsTo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_respondsTo_");
	}
	@Test
	public void test_tilde_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_tilde_equals");
	}
	@Test
	public void test_tilde_tilde() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_tilde_tilde");
	}
	@Test
	public void test_yourself() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ObjectTest", "test_yourself");
	}
}