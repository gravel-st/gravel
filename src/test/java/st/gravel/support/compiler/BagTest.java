package st.gravel.support.compiler;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class BagTest {
	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void test_addAll_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.BagTest", "test_addAll_");
	}

}
