package st.gravel.support.compiler;

import java.util.Date;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import st.gravel.benchmark.Richards;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class RichardsTest {
	private static final int ITERATIONS = 5;

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testRunGravelRichards() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("st.gravel.tests.richards.RichardsBenchmark");
		for (int i = 0; i < ITERATIONS; i++) {
			MethodTools.safePerform(appClass, "start");
		}
	}

	@Test  @Ignore
	public void testRunGravelRichardsLong() {
		Object appClass = ImageBootstrapper.systemMapping
				.singletonAtReferenceString_("st.gravel.tests.richards.RichardsBenchmark");
		for (int i = 0; i < ITERATIONS; i++) {
			MethodTools.safePerform(appClass, "startLongRun");
		}
	}

	@Test  @Ignore
	public void testRunJavaRichards() {
		for (int i = 0; i < ITERATIONS; i++) {
			Date start = new Date();
			Richards richards = new Richards();
			richards.run();
			Date stop = new Date();
			System.out.println("Duration: "
					+ (stop.getTime() - start.getTime()) + " ms");
		}
	
		
	}

}
