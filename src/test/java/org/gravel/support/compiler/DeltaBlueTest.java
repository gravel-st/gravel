package org.gravel.support.compiler;

import java.util.Date;

import org.gravel.benchmark.DeltaBlue;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

public class DeltaBlueTest {
	private static final int ITERATIONS = 5;

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testRunGravelDeltaBlue() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("org.gravel.test.deltablue.Planner");
		for (int i = 0; i < ITERATIONS; i++) {
			MethodTools.safePerform(appClass, "standardBenchmark");
		}
	}

	@Test
	public void testRunJavaDeltaBlue() {
		for (int i = 0; i < ITERATIONS; i++) {
			Date start = new Date();
			DeltaBlue.standardBenchmark();
			Date stop = new Date();
			System.out.println("Duration: "
					+ (stop.getTime() - start.getTime()) + " ms");
		}
	}

	@Test
	public void testRunGravelDeltaBlueLong() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("org.gravel.test.deltablue.Planner");
		for (int i = 0; i < ITERATIONS; i++) {
			Date start = new Date();
			MethodTools.safePerform(appClass, "longBenchmark");
			Date stop = new Date();
			System.out.println("Duration: "
					+ (stop.getTime() - start.getTime()) + " ms");
		}
	}

	@Test
	public void testRunJavaDeltaBlueLong() {
		for (int i = 0; i < ITERATIONS; i++) {
			Date start = new Date();
			DeltaBlue.longBenchmark();
			Date stop = new Date();
			System.out.println("Duration: "
					+ (stop.getTime() - start.getTime()) + " ms");
		}
	}

}
