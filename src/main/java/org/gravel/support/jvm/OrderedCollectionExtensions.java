package org.gravel.support.jvm;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class OrderedCollectionExtensions {
	public static final Factory factory = new Factory();

	public static class Factory extends SmalltalkFactory {
		public Object basicNew() {
			return new ArrayList();
		}
	}

	public static Object r_class(Object receiver) {
		return factory;
	}

	public static ArrayList new_(Object receiver, int size) {
		return new ArrayList(size);
	}

	public static ArrayList withSize_(Object receiver, int size) {
		ArrayList arrayList = new ArrayList(size);
		for (int i = 0; i < size; i++) {
			arrayList.add(null);
		}
		return arrayList;
	}

	public static Object removeIndex_(ArrayList receiver, int index) {
		return receiver.remove(index - 1);
	}

	public static Object at_(ArrayList receiver, int index) {
		return receiver.get(index - 1);
	}

	public static Object at_put_(ArrayList receiver, int index, Object value) {
		receiver.set(index - 1, value);
		return value;
	}

	public static Object insert_before_(ArrayList receiver, Object element,
			int index) {
		receiver.add(index - 1, element);
		return element;
	}

	public static <R, E> List<R> collect_(List<E> receiver, Block1<R, E> aBlock) {
		ArrayList<R> result = new ArrayList<R>();
		for (E element : receiver) {
			result.add(aBlock.value_(element));
		}
		return result;
	}

	public static <R, E> R[] collectAsArray_(ArrayList<E> receiver,
			Block1<R, E> aBlock) {
		R[] result = (R[]) Array.newInstance(aBlock.getResultClass(),
				receiver.size());
		int size = receiver.size();
		for (int i = 0; i < size; i++) {
			result[i] = aBlock.value_(receiver.get(i));
		}
		return result;
	}

	public static <E> List<E> copyWithAll_(List<E> receiver, List<E> other) {
		ArrayList<E> arrayList = new ArrayList<>(receiver);
		arrayList.addAll(other);
		return arrayList;
	}

	public static boolean equals_(List receiver, List other) {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	public static Object do_(ArrayList receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (Object element : receiver) {
			bl.value_(element);
		}
		return receiver;
	}

	public static <E> boolean anySatisfy_(List<E> receiver,
			Predicate1<E> predicate) {
		for (E element : receiver) {
			if (predicate.value_(element))
				return true;
		}
		return false;
	}
}
