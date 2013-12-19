package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.jvm.runtime.ImageBootstrapper;


public class LiteralsTest {

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testSymbolLiteral() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA_testSymbolLiteral")
				.method("foo ^#aap")
				.method("bar ^#aap")
				.build();

		Object classAObj = classA.newInstance();
		Method method = classAObj.getClass().getMethod("foo");
		Object result = method.invoke(classAObj);
		assertEquals(Symbol.value("aap"), result);
	}


	@Test
	public void testByteArrayLiteral() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA_testByteArrayLiteral")
				.method("foo ^#[0 1 127 128 255 0]")
				.method("bar ^#[0 1 127 128 255 0]")
				.method("eq ^self foo == self bar")
				.build();

		Object classAObj = classA.newInstance();
		Method foo = classAObj.getClass().getMethod("foo");
		Method bar = classAObj.getClass().getMethod("bar");
		Method eq = classAObj.getClass().getMethod("eq");
		Object fooValue = foo.invoke(classAObj);
		Object barValue = bar.invoke(classAObj);
		Object eqValue = eq.invoke(classAObj);
		assertEquals(Boolean.TRUE, eqValue);
		assertEquals(fooValue, barValue);
		byte[] arr = (byte[]) fooValue;
		assertEquals(0, arr[0]);
		assertEquals(1, arr[1]);
		assertEquals(127, arr[2]);
		assertEquals(-128, arr[3]);
		assertEquals(-1, arr[4]);
		assertEquals(0, arr[5]);
		assertEquals(6, arr.length);
	}

	@Test
	public void testArrayLiteral() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA_testArrayLiteral")
				.method("foo ^#(aap 1 nil)")
				.method("bar ^#(aap 1 nil)")
				.method("eq ^self foo == self bar")
				.build();

		Object classAObj = classA.newInstance();
		Method foo = classAObj.getClass().getMethod("foo");
		Method bar = classAObj.getClass().getMethod("bar");
		Method eq = classAObj.getClass().getMethod("eq");
		Object fooValue = foo.invoke(classAObj);
		Object barValue = bar.invoke(classAObj);
		Object eqValue = eq.invoke(classAObj);
		assertEquals(Boolean.TRUE, eqValue);
		assertEquals(fooValue, barValue);
		Object[] arr = (Object[]) fooValue;
		assertEquals(3, arr.length);
	}

	@Test
	public void testLargeIntegerLiteral() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class classA = new ClassBuilder("ClassA_testLargeIntegerLiteral")
				.method("foo ^12389471234798172348979183249871234")
				.method("bar ^12389471234798172348979183249871234")
				.build();

		Object classAObj = classA.newInstance();
		Method foo = classAObj.getClass().getMethod("foo");
		Method bar = classAObj.getClass().getMethod("bar");
		Object fooValue = foo.invoke(classAObj);
		Object barValue = bar.invoke(classAObj);
		assertEquals(fooValue, barValue);
	}



}
