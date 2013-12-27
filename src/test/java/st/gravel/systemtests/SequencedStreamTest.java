package st.gravel.systemtests;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SequencedStreamTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}
	@Test
	public void test_close() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_close");
	}
	@Test
	public void test_contents() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_contents");
	}
	@Test
	public void test_isEmpty() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_isEmpty");
	}
	@Test
	public void test_position() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_position");
	}
	@Test
	public void test_position_() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_position_");
	}
	@Test
	public void test_reset() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_reset");
	}
	@Test
	public void test_setToEnd() throws Throwable {
		MethodTools.debugTest("st.gravel.ansitests.SequencedStreamTest", "test_setToEnd");
	}
}