package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SequencedCollectionTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_atAllPut_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_atAllPut_");
	}
	@Test
	public void test_atAll_put_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_atAll_put_");
	}
	@Test
	public void test_at_put_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_at_put_");
	}
	@Test
	public void test_replaceFrom_to_withObject_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_replaceFrom_to_withObject_");
	}
	@Test
	public void test_replaceFrom_to_with_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_replaceFrom_to_with_");
	}
	@Test
	public void test_replaceFrom_to_with_startingAt_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedCollectionTest", "test_replaceFrom_to_with_startingAt_");
	}
}