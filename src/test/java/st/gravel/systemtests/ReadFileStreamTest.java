package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ReadFileStreamTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_next_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadFileStreamTest", "test_next_");
	}
	@Test
	public void test_upTo_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadFileStreamTest", "test_upTo_");
	}
}