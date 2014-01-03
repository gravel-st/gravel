package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class CharacterTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_asLowercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_asLowercase");
	}
	@Test
	public void test_asString() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_asString");
	}
	@Test
	public void test_asUppercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_asUppercase");
	}
	@Test
	public void test_codePoint() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_codePoint");
	}
	@Test
	public void test_equals() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_equals");
	}
	@Test
	public void test_isAlphaNumeric() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_isAlphaNumeric");
	}
	@Test
	public void test_isDigit() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_isDigit");
	}
	@Test
	public void test_isLetter() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_isLetter");
	}
	@Test
	public void test_isLowercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_isLowercase");
	}
	@Test
	public void test_isUppercase() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.CharacterTest", "test_isUppercase");
	}
}