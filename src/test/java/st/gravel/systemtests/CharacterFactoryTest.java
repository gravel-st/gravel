package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class CharacterFactoryTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_codePoint_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterFactoryTest", "test_codePoint_");
	}
	@Test
	public void test_cr() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterFactoryTest", "test_cr");
	}
	@Test
	public void test_lf() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterFactoryTest", "test_lf");
	}
	@Test
	public void test_space() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterFactoryTest", "test_space");
	}
	@Test
	public void test_tab() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterFactoryTest", "test_tab");
	}
}