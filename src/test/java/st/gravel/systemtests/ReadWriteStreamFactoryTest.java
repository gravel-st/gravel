package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ReadWriteStreamFactoryTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.ReadWriteStreamFactoryTest", "test_with_");
	}
}