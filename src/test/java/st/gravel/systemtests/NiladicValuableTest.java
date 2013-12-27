package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class NiladicValuableTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_argumentCount() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_argumentCount");
	}
	@Test
	public void test_value() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_value");
	}
	@Test
	public void test_whileFalse() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_whileFalse");
	}
	@Test
	public void test_whileFalse_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_whileFalse_");
	}
	@Test
	public void test_whileTrue() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_whileTrue");
	}
	@Test
	public void test_whileTrue_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.NiladicValuableTest", "test_whileTrue_");
	}
}