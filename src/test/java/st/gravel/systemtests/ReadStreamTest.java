package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ReadStreamTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_next_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadStreamTest", "test_next_");
	}
	@Test
	public void test_upTo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadStreamTest", "test_upTo_");
	}
}