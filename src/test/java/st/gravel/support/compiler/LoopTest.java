package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class LoopTest {

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
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

}
