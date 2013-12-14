package org.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;

import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Test;

public class TraitTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void test_notEmpty() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {
		
		Object setClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.lang.Set");
		Object set = MethodTools.safePerform(setClass, "with:", 1);
		//#notEmpty is a method from a trait
		Object bool = MethodTools.safePerform(set, "notEmpty");
		assertEquals(Boolean.TRUE, bool);
	}


}
