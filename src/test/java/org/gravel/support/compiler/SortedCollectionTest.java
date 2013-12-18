package org.gravel.support.compiler;

import static org.junit.Assert.*;

import org.gravel.support.compiler.testtools.ClassBuilder;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Test;

public class SortedCollectionTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testSortArray() {
		Object result = ClassBuilder
				.evaluate(" #(#'Core-Magniture' #'IDE-Browser' #'Core-Visitor' #'Core-Collections-Kernel' #'Core-Kernel' #'Core-Reflection') asSortedCollection asArray");
		String str = (String) MethodTools.safePerform(result, "printString");
		assertEquals(
				" #(#'Core-Collections-Kernel' #'Core-Kernel' #'Core-Magniture' #'Core-Reflection' #'Core-Visitor' #'IDE-Browser')",
				str);
	}

}
