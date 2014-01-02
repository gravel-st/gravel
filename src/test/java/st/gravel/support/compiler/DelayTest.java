package st.gravel.support.compiler;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DelayTest {
	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void testWaitForDelay() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("st.gravel.lang.Delay");
		Object delay = MethodTools.safePerform(appClass, "forMilliseconds:",
				100);
		Date start = new Date();

		MethodTools.safePerform(delay, "wait");
		Date stop = new Date();
		long duration = stop.getTime() - start.getTime();
		System.out.println("Waited: " + duration + " ms");
		assertTrue(duration >= 100);

	}

}
