package st.gravel.support.compiler;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ProcessTest {
	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void test_ForkProcesses() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_ForkProcesses").
				method("runForked: aName semaphore: sema " +
						"[1 to: 10 do: [:i |" +
						"Transcript cr; show: aName,': ', i printString. " +
						"(Delay forMilliseconds: 100) wait]. " +
						" sema signal] fork." +
						"").
						method("runForked" +
								"| sema |" +
								"sema := Semaphore new. " +
								"self runForked: 'A' semaphore: sema. " +
								"self runForked: 'B' semaphore: sema. " +
								"self runForked: 'C' semaphore: sema. " +
								"sema wait. "+
								"sema wait. "+
								"sema wait. "
								).
				build();

		Object fooObject = stClass.newInstance();
		MethodTools.perform(fooObject, "runForked");
	}

	@Test
	public void test_ParallelCollect() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_ParallelCollect").
	
						method("parallelCollect" +
								"^(1 to: 1000) parallel: 20 collect: [:each |" +
								"| s | s := 0. " +
								"1 to: 100 do: [:i | 1 to: 100 do: [:j | s := s + (i * j)]]." +
								"s" +
								"]"
								).
				build();

		Object fooObject = stClass.newInstance();
		MethodTools.perform(fooObject, "parallelCollect");
	}


}
