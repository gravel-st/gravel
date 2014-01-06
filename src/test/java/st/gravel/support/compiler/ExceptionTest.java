package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;
import st.gravel.support.jvm.runtime.UnhandledException;

public class ExceptionTest {
	private static Class testExceptionAClass;
	private static Class testExceptionBClass;

	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
		if (testExceptionAClass == null) {
			testExceptionAClass = new ClassBuilder("TestExceptionA")
					.superclassName("st.gravel.lang.Exception")
					.method("testValue ^7").build();
		}
		if (testExceptionBClass == null) {
			testExceptionBClass = new ClassBuilder("TestExceptionB")
					.superclassName("st.gravel.lang.Exception")
					.method("testValue ^11").build();
		}
	}

	@Test
	public void test_on_do_() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {


		Class stClass = new ClassBuilder("FooObject_test_on_do_").instVar("bar")
				.method("foo" + "	^self foo: [TestExceptionA raise. bar := #failed]")
				.method("isFailed ^bar notNil")
				.method("foo: aBlock  "
						+ "^[aBlock value] on: TestExceptionA do: [:ex | ex testValue]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Method isFailed = fooObject.getClass().getMethod("isFailed");
		assertEquals(Integer.valueOf(7), method.invoke(fooObject));
		assertEquals(Boolean.FALSE, isFailed.invoke(fooObject));
	}

	@Test
	public void testNested_on_do_1() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {


		Class stClass = new ClassBuilder("FooObject_testNested_on_do_1").instVar("bar")
				.method("foo" + "	^self foo: [TestExceptionA raise. bar := #failed]")
				.method("isFailed ^bar notNil")
				.method("foo: aBlock  "
						+ "^[[aBlock value] on: TestExceptionA do: [:ex1 | ex1 testValue]] on: TestExceptionB do: [:ex | ex testValue]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Method isFailed = fooObject.getClass().getMethod("isFailed");
		assertEquals(Integer.valueOf(7), method.invoke(fooObject));
		assertEquals(Boolean.FALSE, isFailed.invoke(fooObject));
	}

	@Test
	public void testNested_on_do_2() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {


		Class stClass = new ClassBuilder("FooObject_testNested_on_do_2").instVar("bar")
				.method("foo" + "	^self foo: [TestExceptionA raise. bar := #failed]")
				.method("isFailed ^bar notNil")
				.method("foo: aBlock  "
						+ "^[[aBlock value] on: TestExceptionB do: [:ex | ex testValue]] on: TestExceptionA do: [:ex1 | ex1 testValue]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Method isFailed = fooObject.getClass().getMethod("isFailed");
		assertEquals(Integer.valueOf(7), method.invoke(fooObject));
		assertEquals(Boolean.FALSE, isFailed.invoke(fooObject));
	}

	@Test
	public void test_pass() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {


		Class stClass = new ClassBuilder("FooObject_test_pass").instVar("bar")
				.method("foo" + "	^self foo: [TestExceptionA raise. bar := #failed]")
				.method("isFailed ^bar notNil")
				.method("foo: aBlock  "
						+ "^[[aBlock value] on: Exception do: [:ex | ex pass]] on: TestExceptionA do: [:ex1 | ex1 testValue]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Method isFailed = fooObject.getClass().getMethod("isFailed");
		assertEquals(Integer.valueOf(7), method.invoke(fooObject));
		assertEquals(Boolean.FALSE, isFailed.invoke(fooObject));
	}

	@Test
	public void test_MessageNotUnderstood1() throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException {


		Class stClass = new ClassBuilder("FooObject_test_MessageNotUnderstood1")
				.method("foo"
						+ "^[3 zork] on: MessageNotUnderstood do: [:ex | 7]"
						)
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(Integer.valueOf(7), method.invoke(fooObject));
	}


	@Test(expected=UnhandledException.class)
	public void test_MessageNotUnderstood2() throws Throwable {


		Class stClass = new ClassBuilder("FooObject_test_MessageNotUnderstood2")
				.method("foo"
						+ "^3 zork"
						)
				.build();

		Object fooObject = stClass.newInstance();
		assertEquals(Integer.valueOf(7), MethodTools.perform(fooObject, "foo"));
	}
	
	@Test
	public void test_MessageNotUnderstood3() throws Throwable {


		Class stClass = new ClassBuilder("FooObject_test_MessageNotUnderstood3")
				.method("foo"
						+ "^[3 zork: 4] on: MessageNotUnderstood do: [:ex | ex receiver + ex message argument]"
						)
				.build();

		Object fooObject = stClass.newInstance();
		assertEquals(Integer.valueOf(7), MethodTools.perform(fooObject, "foo"));
	}
	
	@Test
	public void test_MessageNotUnderstood4() throws Throwable {


		Class stClass = new ClassBuilder("FooObject_test_MessageNotUnderstood4")
				.method("foo"
						+ "^self zork: 4"
						)
				.method("doesNotUnderstand: aMessage"
						+ "^3 + aMessage argument"
						)
				.build();

		Object fooObject = stClass.newInstance();
		assertEquals(Integer.valueOf(7), MethodTools.perform(fooObject, "foo"));
	}
}
