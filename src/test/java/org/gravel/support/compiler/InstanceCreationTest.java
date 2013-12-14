package org.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.gravel.support.compiler.testtools.ClassBuilder;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.junit.Before;
import org.junit.Test;


public class InstanceCreationTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testCreateInstance() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA")
				.method("foo ^3")
				.build();

		Class classB = new ClassBuilder("ClassB")
		.method("newClassA ^ClassA new")
		.build();

		Object classBObject = classB.newInstance();
		Method method = classBObject.getClass().getMethod("newClassA");
		Object classAObj = method.invoke(classBObject);
		Method fooMethod = classAObj.getClass().getMethod("foo");
		Object result = fooMethod.invoke(classAObj);
		assertEquals(Integer.valueOf(3), result);
	}

	@Test
	public void testSendClassMethod() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA_testSendClassMethod")
				.classMethod("foo ^3")
				.build();

		Class classB = new ClassBuilder("ClassB_testSendClassMethod")
		.method("bar ^ClassA_testSendClassMethod foo")
		.build();

		Object classBObject = classB.newInstance();
		Method method = classBObject.getClass().getMethod("bar");
		Object result =method.invoke(classBObject);
		 
		assertEquals(Integer.valueOf(3), result);
	}


}
