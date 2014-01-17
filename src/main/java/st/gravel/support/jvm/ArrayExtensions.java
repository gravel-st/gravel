package st.gravel.support.jvm;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

import st.gravel.support.compiler.ast.SimpleTraitUsageNode;
import st.gravel.support.compiler.jvm.JVMType;

public class ArrayExtensions {

	public static <E> boolean allSatisfy_(E[] receiver, Predicate1<E> predicate) {
		for (E element : receiver) {
			if (!predicate.value_(element))
				return false;
		}
		return true;
	}

	public static <E> boolean anySatisfy_(E[] receiver, Predicate1<E> predicate) {
		for (E element : receiver) {
			if (predicate.value_(element))
				return true;
		}
		return false;
	}

	public static <E> E[] asSortedArray(E[] receiver) {
		E[] arr = receiver.clone();
		Arrays.sort(arr);
		return arr;
	}

	public static <E> E at_(E[] receiver, int index) {
		return receiver[index - 1];
	}

	public static <E> E at_put_(E[] receiver, int index, E value) {
		return receiver[index - 1] = value;
	}

	public static <R, E> R[] collect_(E[] receiver, Block1<R, E> aBlock) {
		R[] result = (R[]) Array.newInstance(aBlock.getResultClass(),
				receiver.length);
		for (int i = 0; i < receiver.length; i++) {
			result[i] = aBlock.value_(receiver[i]);
		}
		return result;
	}

	public static <E> E[] copy(E[] receiver) {
		return receiver.clone();
	}

	public static <E> E[] copyAt_put_(E[] receiver, int index, E value) {
		E[] arr = Arrays.copyOf(receiver, receiver.length);
		arr[index - 1] = value;
		return arr;

	}

	public static <E> E[] copyWith_(E[] receiver, E element) {
		final Class<? extends Object> class1 = receiver.getClass()
				.getComponentType();
		if (element != null) {
			final Class<? extends Object> class2 = element.getClass();
			if (class1 != class2) {
				Class<?> commonSuperclass = ArrayFactory.commonSuperclass(
						class1, class2);
				E[] newInstance = (E[]) Array.newInstance(commonSuperclass,
						receiver.length + 1);
				System.arraycopy(receiver, 0, newInstance, 0, receiver.length);
				newInstance[receiver.length] = element;
				return newInstance;
			}
		}
		final int N = receiver.length;
		E[] arr = Arrays.copyOf(receiver, N + 1);
		arr[N] = element;
		return arr;
	}

	public static <E> E[] copyWithAll_(E[] receiver, E[] other) {
		final int rLen = receiver.length;
		E[] copy = Arrays.copyOf(receiver, rLen + other.length);
		System.arraycopy(other, 0, copy, rLen, other.length);
		return copy;
	}

	public static <E> E[] copyWithFirst_(E[] receiver, E element) {
		final int N = receiver.length;
		int newLength = N + 1;
		Class newType = receiver.getClass();
		E[] copy = (newType == Object[].class) ? (E[]) new Object[newLength]
				: (E[]) Array
						.newInstance(newType.getComponentType(), newLength);
		System.arraycopy(receiver, 0, copy, 1, receiver.length);
		copy[0] = element;
		return copy;
	}

	public static <E> E[] copyWithoutLast(E[] receiver) {
		final int N = receiver.length;
		E[] arr = Arrays.copyOf(receiver, N - 1);
		return arr;
	}

	public static <E> E detect_ifNone_(E[] receiver, Predicate1<E> predicate,
			Block0<E> failBlock) {
		for (E elem : receiver) {
			if (predicate.value_(elem))
				return elem;
		}
		return failBlock.value();
	}

	public static <E> Object do_(E[] receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (Object element : receiver) {
			bl.value_(element);
		}
		return receiver;
	}

	public static boolean equals_(Object[] receiver, Object[] other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && (isSameAs_(receiver,
						other)));
	}

	public static boolean includes_(char[] receiver, Character element) {
		if (element == null)
			return false;
		for (char ch : receiver) {
			if (ch == element)
				return true;
		}
		return false;
	}

	public static <E> boolean includes_(E[] receiver, E element) {
		for (E elem : receiver) {
			if (elem.equals(element))
				return true;
		}
		return false;
	}

	public static <E> int indexOf_(E[] receiver, E element) {
		for (int i = 0; i < receiver.length; i++) {
			if (receiver[i].equals(element))
				return i + 1;
		}
		return 0;
	}

	public static <E> int indexWhere_(E[] receiver, Predicate1<E> predicate) {
		for (int i = 0; i < receiver.length; i++) {
			if (predicate.value_(receiver[i]))
				return i + 1;
		}
		return 0;
	}

	public static <S, E> S inject_into_(E[] receiver, S startSum,
			Block2<S, S, E> block2) {
		S sum = startSum;
		for (E elem : receiver) {
			sum = block2.value_value_(sum, elem);
		}
		return sum;
	}

	public static <Object> boolean isSameAs_(Object[] receiver, Object[] other) {
		if (receiver == other)
			return true;
		if (receiver.length != other.length)
			return false;
		for (int i = 0; i < receiver.length; i++) {
			Object a = receiver[i];
			Object b = other[i];
			if (!((a == null && b == null) | (a != null && b != null && a
					.equals(b))))
				return false;
		}
		return true;
	}

	public static <E> String join_(E[] receiver, Block1<String, E> block) {
		return join_with_(receiver, block, "");
	}

	public static <E> String join_with_(E[] receiver, Block1<String, E> block,
			String sepString) {
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < receiver.length; i++) {
			if (i != 0)
				str.append(sepString);
			E element = receiver[i];
			str.append(block.value_(element));
		}
		return str.toString();
	}

	public static String joinWith_(String[] receiver, String separator) {
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < receiver.length; i++) {
			if (i != 0) {
				str.append(separator);
			}
			str.append(receiver[i]);
		}
		return str.toString();
	}

	public static <R, E> R[] keysAndValuesCollect_(E[] receiver,
			Block2<R, Integer, E> aBlock) {
		R[] result = (R[]) Array.newInstance(aBlock.getResultClass(),
				receiver.length);
		for (int i = 0; i < receiver.length; i++) {
			result[i] = aBlock.value_value_(i + 1, receiver[i]);
		}
		return result;
	}

	public static Object[] newInstance_(Object receiverClass, int size) {
		return new Object[size];
	}

	public static <E> E[] reject_(E[] receiver, Predicate1<E> predicate) {
		ArrayList<E> list = new ArrayList<E>();
		for (E elem : receiver) {
			if (!predicate.value_(elem)) {
				list.add(elem);
			}
		}
		E[] newInstance = (E[]) Array.newInstance(receiver.getClass()
				.getComponentType(), list.size());
		return list.toArray(newInstance);
	}

	public static Object[] replaceFrom_to_with_startingAt_(Object[] receiver,
			int start, int stop, Object[] replacement, int repStart) {
		// Primitive. This destructively replaces elements from start to stop in
		// the receiver starting at index, repStart, in the collection,
		// replacement. Answer the receiver. Range checks are performed in the
		// primitive only. Optional. See Object documentation whatIsAPrimitive.
		int length = (stop - start) + 1;
		System.arraycopy(replacement, repStart - 1, receiver, start - 1, length);
		return receiver;
	}

	public static <E> E[] reverse(E[] receiver) {

		E[] result = receiver.clone();
		int length = receiver.length;
		for (int i = 0; i < length; i++) {
			result[i] = receiver[(length - i) - 1];
		}
		return result;
	}

	public static <E> E[] select_(E[] receiver, Predicate1<E> predicate) {
		ArrayList<E> list = new ArrayList<E>();
		for (E elem : receiver) {
			if (predicate.value_(elem)) {
				list.add(elem);
			}
		}
		E[] newInstance = (E[]) Array.newInstance(receiver.getClass()
				.getComponentType(), list.size());
		return list.toArray(newInstance);
	}

	public static <E> E[] shallowCopy(E[] receiver) {
		return receiver.clone();
	}

	public static <E> Object size(E[] receiver) {
		return receiver.length;
	}

	public static <O, N> void syncWith(O[] receiver, N[] newCollection,
			Predicate2<O, N> selectBlock, Block2<Object, O, N> thenBlock,
			Block1<Object, N> ifNewBlock, Block1<Object, O> ifAbsentBlock) {

		final HashSet<O> oldElems = new HashSet<O>(Arrays.asList(receiver));
		final HashSet<N> newElems = new HashSet<N>(Arrays.asList(newCollection));
		for (O o : oldElems) {
			boolean notFound = true;
			for (N n : newElems) {
				if (selectBlock.value_value_(o, n)) {
					newElems.remove(n);
					thenBlock.value_value_(o, n);
					notFound = false;
					break;
				}
			}
			if (notFound) {
				ifAbsentBlock.value_(o);
			}
		}
		for (N n : newElems) {
			ifNewBlock.value_(n);
		}
	}

	public static <E> E[] tail(E[] receiver) {
		final int N = receiver.length;
		int newLength = N - 1;
		Class newType = receiver.getClass();
		E[] copy = (newType == Object[].class) ? (E[]) new Object[newLength]
				: (E[]) Array
						.newInstance(newType.getComponentType(), newLength);
		System.arraycopy(receiver, 0, copy, 0, newLength);
		return copy;
	}

	public static <X, Y> Object with_do_(X[] receiver, Y[] other,
			Block2<Object, X, Y> doBlock) {
		if (receiver.length != other.length)
			throw new RuntimeException("Arrays are not of same length");
		for (int i = 0; i < receiver.length; i++) {
			X a = receiver[i];
			Y b = other[i];
			doBlock.value_value_(a, b);
		}
		return receiver;
	}

	public static <X, Y> Object with_do_separatedBy_(X[] receiver, Y[] other,
			Block2<Object, X, Y> doBlock, Block0<Object> sepBlock) {
		if (receiver.length != other.length)
			throw new RuntimeException("Arrays are not of same length");
		for (int i = 0; i < receiver.length; i++) {
			X a = receiver[i];
			Y b = other[i];
			if (i != 0) {
				sepBlock.value();
			}
			doBlock.value_value_(a, b);
		}
		return receiver;
	}

	public static <E> E zeroAt_(E[] receiver, int index) {
		return receiver[index];
	}

	public static <E> E zeroAt_put_(E[] receiver, int index, E value) {
		return receiver[index] = value;
	}

}
