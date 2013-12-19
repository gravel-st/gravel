package st.gravel.support.compiler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.ClassBuilder;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class CollectionsTest {

	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void test_asOrderedCollection() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_test_asOrderedCollection")
				.method("array" +
				"	^#(1 2 3)")
				.method("foo" +
						"	^#(1 2 3) asOrderedCollection")
				.build();

		Object fooObject = stClass.newInstance();
		Object coll = MethodTools.perform(fooObject, "foo");
		Object size = MethodTools.perform(coll, "size");
		assertEquals(3, ((int)size));
	}

	@Test
	public void test_Array_size() throws Throwable {

		Class stClass = new ClassBuilder("FooObject_test_Array_size")
				.method("array" +
				"	^#(1 2 3)")
				.build();

		Object fooObject = stClass.newInstance();
		Object coll = MethodTools.perform(fooObject, "array");
		Object size = MethodTools.perform(coll, "size");
		assertEquals(3, ((int)size));
	}

	@Test
	public void testArrayCollect() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testArrayAdd")
				.method("foo | coll |" +
						"	^#(1 2 3) collect: [:each | each + 4]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(3, ((Object[])result).length);
	}

	@Test
	public void testOrderedCollectionAdd() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testOrderedCollectionAdd")
				.method("foo | coll |" +
						"	coll := OrderedCollection new." +
						"	coll add: 1." +
						"	coll add: 'Fromage'." +
						"	coll add: 2." +
						"	^JavaArrayList withAll: coll")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(3, ((ArrayList)result).size());
	}

	@Test
	public void testOrderedCollectionRemoveFirst() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testOrderedCollectionRemoveFirst")
				.method("foo | coll |" +
						"	coll := OrderedCollection new." +
						"	coll add: 1." +
						"	coll add: 'Fromage'." +
						"	coll add: 2."
						+ "	coll removeFirst." +
						"	^JavaArrayList withAll: coll")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(2, ((ArrayList)result).size());
	}

	@Test
	public void testSetAdd() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testSetAdd")
				.method("foo | set |" +
						"	set := Set new." +
						"	set add: 1." +
						"	set add: 'Fromage'." +
						"	set add: 2." +
						"	^set")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(3, ((Set)result).size());
	}

	@Test
	public void testSetCollect() throws InstantiationException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException {

		Class stClass = new ClassBuilder("FooObject_testSetCollect")
				.method("foo | set |" +
						"	set := Set new." +
						"	set add: 1." +
						"	set add: 2." +
						"	set add: 3." +
						"	^set collect: [:each | each * each]")
				.build();

		Object fooObject = stClass.newInstance();
		Method method = fooObject.getClass().getMethod("foo");
		Object result = method.invoke(fooObject);
		assertEquals(3, ((Set)result).size());
		assertTrue(((Set)result).contains(9));
	}


}
