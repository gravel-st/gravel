package org.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.util.Date;

import org.gravel.support.compiler.testtools.ClassBuilder;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.junit.Before;
import org.junit.Test;


public class BytecodeGeneratorTest {


	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testPrintInt() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testPrintInt").method("foo ^7 printString")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals("7", result);
	}

	@Test
	public void testReturnInt() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testReturnInt").method("foo ^1")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(1), result);
	}

	@Test
	public void testTemp() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {
		
		Class stClass = new ClassBuilder("FooObject_testTemp").method("foo | a | a := 1. ^a")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(1), result);
	}

	@Test
	public void testFactorial() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testFactorial").method("foo ^100 factorial")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = null;
		for (int i = 0; i < 10; i++) {
			Date start = new Date();
			result = method.invoke(fooObject);
			Date stop = new Date();
			System.out.println("Duration: "
					+ (stop.getTime() - start.getTime()) + " ms");
		}
		assertEquals(new BigInteger("93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000"), result);
	}

	@Test
	public void testReturnAssignment() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testReturnAssignment").method("foo | a | ^a := 3")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(3), result);
	}

	@Test
	public void testPlusInt() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testPlusInt").method(
				"foo ^3 + 4").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(7), result);
	}

	@Test
	public void testPlusLargeInt() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testPlusLargeInt").method(
				"foo ^2147483647 + 1").build();
		
		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(new BigInteger("2147483648"), result);
	}

	@Test
	public void testSendMessage() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testSendMessage").
				method("foo ^1").
				method("bar ^self boo: self").
				method("boo: anObject ^anObject foo").
				build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("bar");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(1), result);
	}

	@Test
	public void testDispatch() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class constructor1 = new ClassBuilder("FooObject_testDispatch").
				method("boo: anObject ^anObject foo").
				build();

		Class constructor2 = new ClassBuilder("BorkObject_testDispatch").
				method("foo ^2").
				build();

		Object fooObject = constructor1.newInstance();
		Object borkObject = constructor2.newInstance();
		Method method = fooObject.getClass().getMethod("boo_", Object.class);
		Object result = method.invoke(fooObject, borkObject);
		assertEquals(Integer.valueOf(2), result);
	}

	@Test
	public void testPolymorphicDispatch() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class constructor1 = new ClassBuilder("FooObject_testPolymorphicDispatch").
				method("foo ^3").
				method("bar: anObject ^(self boo: self) + (self boo: anObject)").
				method("boo: anObject ^anObject foo").
				build();

		Class constructor2 = new ClassBuilder("BorkObject_testPolymorphicDispatch").
				method("foo ^4").
				build();


		Object fooObject = constructor1.newInstance();
		Object borkObject = constructor2.newInstance();
		Method method = fooObject.getClass().getMethod("bar_", Object.class);
		Object result = method.invoke(fooObject, borkObject);
		assertEquals(Integer.valueOf(7), result);
	}
	@Test
	public void testAssignTemp() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class fooClass = new ClassBuilder("FooObject_testAssignTemp").
				method("foo: bar | a b |\n" + 
						"	a := 3.\n" + 
						"	b := a + bar.\n" + 
						"	^b").
				build();


		Object fooObject = fooClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		Object result = method.invoke(fooObject, 4);
		assertEquals(Integer.valueOf(7), result);
	}
}
