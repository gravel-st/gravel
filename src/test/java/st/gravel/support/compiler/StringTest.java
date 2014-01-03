package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class StringTest {

	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void test_String_equals() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			InstantiationException {

		Class stClass = new ClassBuilder("FooObject_String_equals").
				method("foo: x equals: y ^x=y").
				method("foo ^self foo: 'abc' equals: 'ab','c'").
				build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		assertEquals(Boolean.TRUE, method.invoke(fooObject));
	}

}
