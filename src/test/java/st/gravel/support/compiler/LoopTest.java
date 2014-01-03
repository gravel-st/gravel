package st.gravel.support.compiler;

import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class LoopTest {

	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void test_whileFalse() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_whileFalse").method(
				"foo: sz | sum arr | arr := (1 to: sz) asArray.  sum := 0. [sum := sum + arr first.  arr := arr tail.  arr isEmpty] whileFalse.  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, 1));
		assertEquals(Integer.valueOf(21), method.invoke(fooObject, 6));
	}

	@Test
	public void test_whileFalse_() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_whileFalse_").method(
				"foo: sz  | sum arr | arr := (1 to: sz) asArray.  sum := 0. [sum := sum + arr first. arr size = 1] whileFalse: [arr := arr tail].  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, 1));
		assertEquals(Integer.valueOf(21), method.invoke(fooObject, 6));
	}

	@Test
	public void test_whileTrue() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_whileTrue").method(
				"foo: sz | sum arr | arr := (1 to: sz) asArray.  sum := 0. [sum := sum + arr first.  arr := arr tail.  arr isEmpty not] whileTrue.  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, 1));
		assertEquals(Integer.valueOf(21), method.invoke(fooObject, 6));
	}

	@Test
	public void test_whileTrue_() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_whileTrue_").method(
				"foo: sz | sum arr | arr := (1 to: sz) asArray.  sum := 0. [sum := sum + arr first. arr size ~= 1] whileTrue: [arr := arr tail].  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, 1));
		assertEquals(Integer.valueOf(21), method.invoke(fooObject, 6));
	}


	@Test
	public void test_to_do_() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_to_do_").method(
				"foo | sum | sum := 0. 1 to: 7 do: [:i | sum := sum + i].  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(Integer.valueOf(28), method.invoke(fooObject));
	}

	@Test
	public void test_BigInt_to_int_do_() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {
		Class stClass = new ClassBuilder("FooObject_test_BigInt_to_int_do_").
				method("start Transcript cr; show: 'start'. ^2934758938247592387459832475").
				method("stop Transcript cr; show: 'stop'. ^7").
				method("foo | sum | sum := 0. self start to: self stop do: [:i | sum := sum + i].  ^sum").
				build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(Integer.valueOf(0), method.invoke(fooObject));
	}

	@Test
	public void test_BigInt_to_BigInt_do_() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_test_BigInt_to_BigInt_do_").method(
				"foo | sum | sum := 0. 2934758938247592387459832475 to: 2934758938247592387459832475 do: [:i | sum := sum + i].  ^sum").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(new BigInteger("2934758938247592387459832475"), method.invoke(fooObject));
	}

	@Test
	public void test_int_to_BigInt_do_() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_test_int_to_BigInt_do_").
				instVar("startRuns").
				instVar("stopRuns").
				method("initialize startRuns := 0. stopRuns := 0").
				method("validateRun ^startRuns = 1 and: [stopRuns = 1]").
				method("start startRuns := startRuns + 1. ^16r7FFFFFFF").
				method("stop stopRuns := stopRuns + 1. ^(16r7FFFFFFF + 1)").
				method("foo | sum | sum := 0. self start to: self stop do: [:i | sum := sum + i].  ^sum").
				build();

		Object fooObject = stClass.newInstance();
		MethodTools.perform(fooObject, "initialize");
		Object result = MethodTools.perform(fooObject, "foo");
		boolean validateRun = (Boolean) MethodTools.perform(fooObject, "validateRun");
		assertEquals(new BigInteger("4294967295"), result);
		assertTrue(validateRun);
	}

}
