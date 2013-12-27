package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class CollectionFactoryTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_new() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionFactoryTest", "test_new");
	}
	@Test
	public void test_new_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CollectionFactoryTest", "test_new_");
	}
}