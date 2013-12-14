package org.gravel.support.jvm;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;

import org.gravel.support.parser.ClassDescriptionNode;
import org.gravel.support.parser.Reference;

public class DictionaryExtensions {
	public static final Factory factory = new Factory();

	public static class Factory extends SmalltalkFactory {
		public Object basicNew() {
			return new HashMap();
		}

	}

	public static <K, V> K keyAtValue_(HashMap<K, V> receiver, V value) {
		for (Map.Entry<K, V> entry : receiver.entrySet()) {
			if (entry.getValue().equals(value))
				return entry.getKey();
		}
		throw new RuntimeException("Not found: key for :" + value);
	}

	public static Object do_(HashMap receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (Object element : receiver.values()) {
			bl.value_(element);
		}
		return receiver;
	}

	public static Object keysDo_(HashMap receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (Object element : receiver.keySet()) {
			bl.value_(element);
		}
		return receiver;
	}

	public static Object keys(HashMap receiver) {
		return new HashSet(receiver.keySet());
	}

	public static Object keysAndValuesDo_(
			HashMap<? extends Object, ? extends Object> receiver, Object aBlock) {
		Block2 bl = (Block2) aBlock;
		for (Entry element : receiver.entrySet()) {
			bl.value_value_(element.getKey(), element.getValue());
		}
		return receiver;
	}

	public static <K, V> Map<K, V> copyAt_put_(Map<K, V> receiver, K key,
			V value) {
		HashMap<K, V> copy = new HashMap<K, V>(receiver);
		copy.put(key, value);
		return copy;
	}

	public static boolean includesKey_(Map receiver, Object key) {
		return receiver.containsKey(key);
	}

	public static <K, V> V at_put_(Map<K, V> receiver, K key, V value) {
		receiver.put(key, value);
		return value;
	}

	public static <K, V> V at_ifAbsent_(Map<K, V> receiver, K key,
			Block0<V> absentBlock) {
		if (receiver.containsKey(key))
			return receiver.get(key);
		return absentBlock.value();
	}

	public static <K, V> Map<K, V> copy(Map<K, V> receiver) {
		return new HashMap<K, V>(receiver);
	}

	public static <K, O, N> void syncWith(Map<K, O> receiver, Map<K, N> other,
			Block2<Object, O, N> thenBlock, Block1<Object, N> ifNewBlock,
			Block1<Object, O> ifAbsentBlock) {
		final HashSet<K> oKeys = new HashSet<K>(receiver.keySet());
		final HashSet<K> nKeys = new HashSet<K>(other.keySet());
		for (K oKey : oKeys) {
			if (nKeys.remove(oKey)) {
				thenBlock.value_value_(receiver.get(oKey), other.get(oKey));
			} else {
				ifAbsentBlock.value_(receiver.get(oKey));
			}
		}
		for (K nKey : nKeys) {
			ifNewBlock.value_(other.get(nKey));
		}
	}

	public static boolean equals_(Map receiver, Map other) {
		if (receiver == other)
			return true;
		if (receiver.size() != other.size())
			return false;
		for (Object key : receiver.keySet()) {
			if (!ObjectExtensions.equals_(receiver.get(key), other.get(key)))
				return false;
		}
		return true;
	}

	public static <K, V> Map<K, V> copyAt_ifAbsentPut_(Map<K, V> receiver,
			K key, Block0<V> absentBlock) {
		if (receiver.containsKey(key))
			return receiver;
		return copyAt_put_(receiver, key, absentBlock.value());
	}

	public static String asJSON(Map<String, ? extends Object> _dict) {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	public static <K, V> Map<K, V> copyRemoveKey_ifAbsent_(Map<K, V> receiver,
			K key, Block0<Object> absentBlock) {
		if (!receiver.containsKey(key)) {
			absentBlock.value();
			return receiver;
		}
		HashMap<K, V> copy = new HashMap<K, V>(receiver);
		copy.remove(key);
		return copy;
	}

	public static <K, V> Map<K, V> reject_(Map<K, V> receiver,
			Predicate1<V> predicate) {
		HashMap<K, V> hashMap = new HashMap<>();
		for (Entry<K, V> element : receiver.entrySet()) {
			if (!predicate.value_(element.getValue())) {
				hashMap.put(element.getKey(), element.getValue());
			}
		}
		return hashMap;
	}

	public static <K, V> Map<K, V> select_(Map<K, V> receiver,
			Predicate1<V> predicate) {
		HashMap<K, V> hashMap = new HashMap<>();
		for (Entry<K, V> element : receiver.entrySet()) {
			if (predicate.value_(element.getValue())) {
				hashMap.put(element.getKey(), element.getValue());
			}
		}
		return hashMap;
	}

	public static <K, O, T> Map<K, T> collect_(Map<K, O> receiver,
			Block1<T, O> aBlock) {
		HashMap<K, T> hashMap = new HashMap<>();
		for (Entry<K, O> element : receiver.entrySet()) {
			hashMap.put(element.getKey(), aBlock.value_(element.getValue()));
		}
		return hashMap;
	}

}
