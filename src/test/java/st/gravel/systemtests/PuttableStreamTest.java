package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class PuttableStreamTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_cr() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_cr");
	}
	@Test
	public void test_flush() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_flush");
	}
	@Test
	public void test_nextPutAll_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_nextPutAll_");
	}
	@Test
	public void test_nextPut_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_nextPut_");
	}
	@Test
	public void test_space() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_space");
	}
	@Test
	public void test_tab() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.PuttableStreamTest", "test_tab");
	}
}