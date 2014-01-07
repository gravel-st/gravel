package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class UnicodeStringTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void testPrintInteger() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.UnicodeStringTest", "testPrintInteger");
	}
	@Test
	public void testStringEquals() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.UnicodeStringTest", "testStringEquals");
	}
	@Test
	public void testUnicodeRange() throws Throwable {
		MethodTools.debugTest("st.gravel.systemtests.UnicodeStringTest", "testUnicodeRange");
	}
}