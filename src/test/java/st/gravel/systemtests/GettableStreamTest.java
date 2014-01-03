package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class GettableStreamTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_atEnd() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_atEnd");
	}
	@Test
	public void test_do_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_do_");
	}
	@Test
	public void test_next() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_next");
	}
	@Test
	public void test_nextLine() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_nextLine");
	}
	@Test
	public void test_nextMatchFor_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_nextMatchFor_");
	}
	@Test
	public void test_next_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_next_");
	}
	@Test
	public void test_peek() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_peek");
	}
	@Test
	public void test_peekFor_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_peekFor_");
	}
	@Test
	public void test_skipTo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_skipTo_");
	}
	@Test
	public void test_skip_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_skip_");
	}
	@Test
	public void test_upTo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.GettableStreamTest", "test_upTo_");
	}
}