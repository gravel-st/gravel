package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SequencedContractibleCollectionTest {
	@Before
	public void setUp() {
		st.gravel.support.compiler.testtools.TestBootstrap.getSingleton();
	}
	@Test
	public void test_removeAtIndex_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedContractibleCollectionTest", "test_removeAtIndex_");
	}
	@Test
	public void test_removeFirst() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedContractibleCollectionTest", "test_removeFirst");
	}
	@Test
	public void test_removeLast() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedContractibleCollectionTest", "test_removeLast");
	}
}