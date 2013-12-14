package org.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.gravel.support.compiler.testtools.ClassBuilder;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.junit.Before;
import org.junit.Test;

public class BlockTest {


	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testBooleanAnd() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testBooleanAnd").method(
				"foo: a bar: b ^a and: [b]").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_bar_", Object.class, Object.class);
		assertEquals(Boolean.TRUE, method.invoke(fooObject, true, true));
		assertEquals(Boolean.FALSE, method.invoke(fooObject, true, false));
		assertEquals(Boolean.FALSE, method.invoke(fooObject, false, true));
		assertEquals(Boolean.FALSE, method.invoke(fooObject, false, false));
	}

	@Test
	public void testBooleanOr() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testBooleanOr").method(
				"foo: a bar: b ^a or: [b]").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_bar_", Object.class, Object.class);
		assertEquals(Boolean.TRUE, method.invoke(fooObject, true, true));
		assertEquals(Boolean.TRUE, method.invoke(fooObject, true, false));
		assertEquals(Boolean.TRUE, method.invoke(fooObject, false, true));
		assertEquals(Boolean.FALSE, method.invoke(fooObject, false, false));
	}

	@Test
	public void testEmptyBlockReturnsNil() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testEmptyBlockReturnsNil").method(
				"foo ^[] value").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(null, method.invoke(fooObject));
	}

	@Test
	public void testCleanBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject").method(
				"foo: bar\n" + "	| block |\n" + "	block := [:a | a + 4].\n"
						+ "	^block value: bar").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(7), method.invoke(fooObject, 3));
	}

	@Test
	public void testTwoArgCleanBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testTwoArgCleanBlock").method(
				"foo: foo bar: bar\n" + "	| block |\n" + "	block := [:a :b| a + b].\n"
						+ "	^block value: foo value: bar").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_bar_", Object.class, Object.class);
		assertEquals(Integer.valueOf(7), method.invoke(fooObject, 3, 4));
	}

	@Test
	public void testCopyingBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testCopyingBlock")
				.method("foo: bar\n" + "	| block |\n"
						+ "	block := [:a | a + bar].\n" + "	^block value: 4")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(7), method.invoke(fooObject, 3));
	}

	@Test
	public void testCopyingBlockWithSelfReference()
			throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testCopyingBlockWithSelfReference")
				.method("foo ^11")
				.method("foo: bar\n" + "	| block |\n"
						+ "	block := [:a | a + bar + self foo].\n"
						+ "	^block value: 4").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(18), method.invoke(fooObject, 3));
	}

	@Test
	public void testFullBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testFullBlock")
				.method("foo: bar\n" + "	| block |\n" + "	block := [^1].\n"
						+ "	bar ifFalse:  [block value].\n" + "	^2").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, false));
	}

	@Test
	public void testFullCopyingBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testFullCopyingBlock").method(
				"foo: bar\n" + "	| block a |\n" + "	a := 1.\n"
						+ "	block := [^a].\n"
						+ "	bar ifFalse:  [block value].\n" + "	^2").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(2), method.invoke(fooObject, true));
		assertEquals(Integer.valueOf(1), method.invoke(fooObject, false));
	}

	@Test
	public void testReadOuterTemp1() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testReadOuterTemp1").method(
				"foo: bar\n" + "| a ar aw |\n" + "a := 0.\n"
						+ "ar := [a + 7].\n" + "a := bar.	\n" + "^ar value")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(9), method.invoke(fooObject, 2));
		assertEquals(Integer.valueOf(8), method.invoke(fooObject, 1));
	}

	@Test
	public void testReadWriteOuterTemp() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testReadWriteOuterTemp").method(
				"foo: bar\n" + "| a ar aw |\n" + "a := 0.\n" + "ar := [a].\n"
						+ "aw := [:x | a := x + 7].\n" + "aw value: bar.	\n"
						+ "^ar value").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(9), method.invoke(fooObject, 2));
		assertEquals(Integer.valueOf(8), method.invoke(fooObject, 1));
	}

	@Test
	public void testReadWriteOuterTempDoubleNested()
			throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testReadWriteOuterTempDoubleNested").method(
				"foo: bar\n" + "| a ar aw |\n" + "a := 0.\n"
						+ "ar := [[a] value].\n"
						+ "aw := [:x | [:y | a := y + 7] value: x].\n"
						+ "aw value: bar.	\n" + "^ar value").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(9), method.invoke(fooObject, 2));
		assertEquals(Integer.valueOf(8), method.invoke(fooObject, 1));
	}

	@Test
	public void testNestedReturn() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testNestedReturn")
				.method("foo: bar\n" + "| a ar aw |\n" + "a := 0.\n"
						+ "ar := [[^a] value].\n"
						+ "aw := [:x | [:y | a := y + 7] value: x].\n"
						+ "aw value: bar.	\n" + "^ar value").build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals(Integer.valueOf(9), method.invoke(fooObject, 2));
		assertEquals(Integer.valueOf(8), method.invoke(fooObject, 1));
	}

	@Test
	public void testReadWriteInstVar() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_testReadWriteInstVar")
				.method("foo: bar\n" + "bar name: 'Fromage'.\n" + "^bar name")
				.build();
		Class barClass = new ClassBuilder("BarObject_testReadWriteInstVar")
				.method("name: aString name := aString").method("name ^name")
				.instVar("name").build();

		Object fooObject = stClass.newInstance();
		Object barObject = barClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals("Fromage", method.invoke(fooObject, barObject));
	}

	@Test
	public void testReadWriteInstVarInBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testReadWriteInstVarInBlock").method(
				"foo: bar\n" + "bar setNameInBlock: 'Fromage'.\n"
						+ "^bar readNameInBlock").build();
		Class barClass = new ClassBuilder(
				"BarObject_testReadWriteInstVarInBlock")
				.method("setNameInBlock: anObject\n"
						+ "	[name := anObject] value")
				.method("readNameInBlock\n" + "	^[name] value").instVar("name")
				.build();

		Object fooObject = stClass.newInstance();
		Object barObject = barClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals("Fromage", method.invoke(fooObject, barObject));
	}

	@Test
	public void testReadWriteInstVarInNameBlock() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder(
				"FooObject_testReadWriteInstVarInNameBlock").method(
				"foo: bar\n" + "|bl|\n" + "bl := bar nameBlock.\n"
						+ "bar setNameInBlock: 'Fromage'.\n" + "^bl value")
				.build();
		Class barClass = new ClassBuilder(
				"BarObject_testReadWriteInstVarInNameBlock")
				.method("setNameInBlock: anObject\n"
						+ "	[name := anObject] value")
				.method("nameBlock\n" + "	^[name]").instVar("name")
				.build();

		Object fooObject = stClass.newInstance();
		Object barObject = barClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo_", Object.class);
		assertEquals("Fromage", method.invoke(fooObject, barObject));
	}

}
