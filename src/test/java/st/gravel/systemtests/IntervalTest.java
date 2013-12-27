package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class IntervalTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_collect_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_collect_");
	}
	@Test
	public void test_comma() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_comma");
	}
	@Test
	public void test_copyFrom_to_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyFrom_to_");
	}
	@Test
	public void test_copyReplaceAll_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyReplaceAll_with_");
	}
	@Test
	public void test_copyReplaceFrom_to_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyReplaceFrom_to_withObject_");
	}
	@Test
	public void test_copyReplaceFrom_to_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyReplaceFrom_to_with_");
	}
	@Test
	public void test_copyReplacing_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyReplacing_withObject_");
	}
	@Test
	public void test_copyWithout_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyWithout_");
	}
	@Test
	public void test_copyWith_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_copyWith_");
	}
	@Test
	public void test_reject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_reject_");
	}
	@Test
	public void test_reverse() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_reverse");
	}
	@Test
	public void test_select_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.IntervalTest", "test_select_");
	}
}