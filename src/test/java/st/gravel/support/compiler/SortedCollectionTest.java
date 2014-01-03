package st.gravel.support.compiler;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class SortedCollectionTest {
	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void testSortArray1() {
		Object result = ClassBuilder
				.evaluate(" #(#E #D #C #B #A) asSortedCollection asArray");
		String str = (String) MethodTools.safePerform(result, "printString");
		assertEquals(
				"#(#A #B #C #D #E)",
				str);
	}

	@Test
	public void testSortArray2() {
		Object result = ClassBuilder
				.evaluate(" #(#'Core-Magniture' #'IDE-Browser' #'Core-Visitor' #'Core-Collections-Kernel' #'Core-Kernel' #'Core-Reflection') asSortedCollection asArray");
		String str = (String) MethodTools.safePerform(result, "printString");
		assertEquals(
				"#(#'Core-Collections-Kernel' #'Core-Kernel' #'Core-Magniture' #'Core-Reflection' #'Core-Visitor' #'IDE-Browser')",
				str);
	}

}
