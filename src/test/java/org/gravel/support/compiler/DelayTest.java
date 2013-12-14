package org.gravel.support.compiler;

import static org.junit.Assert.*;

import java.util.Date;

import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Test;

public class DelayTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testWaitForDelay() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("org.gravel.lang.Delay");
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
