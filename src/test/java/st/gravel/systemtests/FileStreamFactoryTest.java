package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class FileStreamFactoryTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_read_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamFactoryTest", "test_read_");
	}
	@Test
	public void test_read_type_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamFactoryTest", "test_read_type_");
	}
	@Test
	public void test_write_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamFactoryTest", "test_write_");
	}
	@Test
	public void test_write_mode_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamFactoryTest", "test_write_mode_");
	}
	@Test
	public void test_write_mode_check_type_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.FileStreamFactoryTest", "test_write_mode_check_type_");
	}
}