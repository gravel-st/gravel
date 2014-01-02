package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FileStreamTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_contents() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamTest", "test_contents");
	}
	@Test
	public void test_externalType() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamTest", "test_externalType");
	}
	@Test
	public void test_isBinary() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamTest", "test_isBinary");
	}
	@Test
	public void test_isText() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamTest", "test_isText");
	}
}