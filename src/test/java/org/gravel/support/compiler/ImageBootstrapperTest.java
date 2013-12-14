package org.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.ClassMapping;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.SystemMapping;
import org.junit.Before;
import org.junit.Test;


public class ImageBootstrapperTest {
	private SystemMapping systemMapping;

	@Before
	public void setUp() {
	}

	@Test
	public void testLookupClass() throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ImageBootstrapper.bootstrap();
		systemMapping = ImageBootstrapper.systemMapping;
		Reference ref = Reference.factory.value_("org.gravel.lang.Message class");
		ClassMapping meta = systemMapping.classMappingAtReference_(ref);
		Object cl = systemMapping.singletonAtReference_(ref.nonmeta());
		Method basicNew = cl.getClass().getMethod("basicNew");
		Object instance = basicNew.invoke(cl);
		Method r_class = instance.getClass().getMethod("r_class");
		Object instanceClass = r_class.invoke(instance);
		assertEquals(meta.identityClass(), instanceClass.getClass());
	}
	
	public Object foo() {
		return new Object();
	}

//	@Test
//	public void testObjectClassLoop() {
//		final SmalltalkClassDescription Object_class_superclass = Core.at_("Object").getSmalltalkClass().superclass();
//		assertEquals("Class", Object_class_superclass.toString());
//
//	}
}
