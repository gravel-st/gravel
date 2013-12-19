package st.gravel.support.jvm;

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;

import org.junit.Test;

import st.gravel.support.jvm.ArrayExtensions;
import st.gravel.support.jvm.Block1;
import st.gravel.support.jvm.Block2;
import st.gravel.support.jvm.Predicate2;

public class ArrayExtensionsTest {

	@Test
	public void testCopyWithAll1() {
		Integer[] x = new Integer[] {};
		Integer[] y = new Integer[] { 4, 5, 6 };

		Integer[] z = ArrayExtensions.copyWithAll_(x, y);

		assertTrue(ArrayExtensions.isSameAs_(z, new Integer[] { 4, 5, 6 }));

	}

	@Test
	public void testCopyWithAll2() {
		Integer[] x = new Integer[] { 1, 2, 3 };
		Integer[] y = new Integer[] {};

		Integer[] z = ArrayExtensions.copyWithAll_(x, y);

		assertTrue(ArrayExtensions.isSameAs_(z, new Integer[] { 1, 2, 3 }));

	}

	@Test
	public void testCopyWithAll3() {
		Integer[] x = new Integer[] { 1, 2, 3 };
		Integer[] y = new Integer[] { 4, 5, 6 };

		Integer[] z = ArrayExtensions.copyWithAll_(x, y);

		assertTrue(ArrayExtensions.isSameAs_(z, new Integer[] { 1, 2, 3, 4, 5,
				6 }));

	}

	@Test
	public void testSyncWith() {
		final Integer[] x = new Integer[] { 1, 2, 3 };
		final String[] y = new String[] { "1", "2", "4" };
		final ArrayList<String> results = new ArrayList<>();

		ArrayExtensions.syncWith(x, y, new Predicate2<Integer, String>() {

			@Override
			public boolean value_value_(Integer o, String n) {
				return o.toString().equals(n);
			}
		}, new Block2<Object, Integer, String>() {

			@Override
			public Object value_value_(Integer o, String n) {
				results.add("Then old:" + o + " new: " + n);
				return null;
			}
		}

		, new Block1<Object, String>() {

			@Override
			public Object value_(String n) {
				results.add("New: " + n);
				return null;
			}
		}, new Block1<Object, Integer>() {

			@Override
			public Object value_(Integer o) {
				results.add("Old: " + o);
				return null;
			}
		});
		String[] resultArray = results.toArray(new String[results.size()]);
		assertTrue(ArrayExtensions.isSameAs_(resultArray, new String[] {
				"Then old:1 new: 1", "Then old:2 new: 2", "Old: 3", "New: 4"
				
		}));
	}

}
