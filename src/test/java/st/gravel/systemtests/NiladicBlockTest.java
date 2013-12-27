package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class NiladicBlockTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_ensure_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicBlockTest", "test_ensure_");
	}
	@Test
	public void test_ifCurtailed_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicBlockTest", "test_ifCurtailed_");
	}
	@Test
	public void test_on_do_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicBlockTest", "test_on_do_");
	}
}