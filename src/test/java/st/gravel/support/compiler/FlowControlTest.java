package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.jvm.runtime.ImageBootstrapper;


public class FlowControlTest {

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testToDo() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testToDo")
				.method("foo ^self foo: 4")
				.method("foo: bar |t| t := 0. 1 to: bar do: [:i | t := t + i]. ^t")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(Integer.valueOf(10), result);
	}

	@Test
	public void testIfTrue1() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrue1").method(
				"foo: bar bar ifTrue: [^1]. ^2").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrue2() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrue2").method(
				"foo: bar |t| t := 2. bar ifTrue:  [t := 1]. ^t").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrue3() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrue3").method(
				"foo: bar ^bar ifTrue: [1]").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(null, method.invoke(fooObject, false));
	}

	@Test
	public void testIfFalse1() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfFalse1").method(
				"foo: bar\n" + 
				"	bar ifFalse:  [^1].\n" + 
				"	^2").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(1),  method.invoke(fooObject, false));
	}

	@Test
	public void testIfFalse2() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfFalse2").method(
				"foo: bar\n" + 
				"	|t| t := 2.\n" + 
				"	bar ifFalse:  [t := 1].\n" + 
				"	^t").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, false));
	}

	@Test
	public void testIfFalse3() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfFalse3").method(
				"foo: bar\n" + 
				"	^bar ifFalse: [1]").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(null, method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrueIfFalse1() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrueIfFalse1").method(
				"foo: bar\n" + 
				"	bar ifTrue: [^1] ifFalse: [^2]").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrueIfFalse2() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrueIfFalse2").method(
				"foo: bar\n" + 
				"	|res|\n" + 
				"	res := bar ifTrue: [1] ifFalse: [2].\n" + 
				"	^res").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrueIfFalse3() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrueIfFalse3").method(
				"foo: bar\n" + 
				"	|res|\n" + 
				"	bar ifTrue: [res := 1] ifFalse: [res := 2].\n" + 
				"	^res").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

	@Test
	public void testIfTrueIfFalse_withSameTempNames() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testIfTrueIfFalse_withSameTempNames").method(
				"foo: bar\n" + 
				"	|res|\n" + 
				"	bar ifTrue: [|tmp| tmp := 1. res := tmp] ifFalse: [|tmp| tmp := 2. res := tmp].\n" + 
				"	^res").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, false));
	}

}
