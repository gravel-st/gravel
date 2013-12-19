package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class IntegerTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void test_Integer_equals() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_Integer_equals").
				method("foo: x equals: y ^x=y").
				method("foo ^self foo: 7 equals: 3+4").
				method("bar ^self foo: 7 equals: 1+2").
				build();

		Object fooObject = stClass.newInstance();
		assertEquals(Boolean.TRUE, MethodTools.perform(fooObject, "foo"));
		assertEquals(Boolean.FALSE,  MethodTools.perform(fooObject, "bar"));
	}

	@Test
	public void test_Integer_identityEquals() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_Integer_identityEquals").
				method("foo: x identityEquals: y ^x==y").
				method("foo ^self foo: 7 identityEquals: 3+4").
				method("bar ^self foo: 7 identityEquals: 1+2").
				build();

		Object fooObject = stClass.newInstance();
		assertEquals(Boolean.TRUE, MethodTools.perform(fooObject, "foo"));
		assertEquals(Boolean.FALSE,  MethodTools.perform(fooObject, "bar"));
	}

	@Test
	public void test_Integer_notEquals() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_Integer_notEquals").
				method("foo: x notEquals: y ^x~=y").
				method("foo ^self foo: 7 notEquals: 3+4").
				method("bar ^self foo: 7 notEquals: 1+2").
				build();

		Object fooObject = stClass.newInstance();
		assertEquals(Boolean.FALSE, MethodTools.perform(fooObject, "foo"));
		assertEquals(Boolean.TRUE,  MethodTools.perform(fooObject, "bar"));
	}

	@Test
	public void test_Integer_notIdentityEquals() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_Integer_notIdentityEquals").
				method("foo: x notIdentityEquals: y ^x~~y").
				method("foo ^self foo: 7 notIdentityEquals: 3+4").
				method("bar ^self foo: 7 notIdentityEquals: 1+2").
				build();

		Object fooObject = stClass.newInstance();
		assertEquals(Boolean.FALSE, MethodTools.perform(fooObject, "foo"));
		assertEquals(Boolean.TRUE,  MethodTools.perform(fooObject, "bar"));
	}

	@Test
	public void testBenchmark() throws Throwable {
		String res = (String) MethodTools.perform(0, "tinyBenchmarks");
		System.out.println(res);
	}
}
