package st.gravel.support.jvm;

import java.util.Arrays;

public class ByteArrayExtensions {

	public static byte[] copyWith_(byte[] receiver, byte element) {
		final int N = receiver.length;
		byte[] arr = Arrays.copyOf(receiver, N + 1);
		arr[N] = element;
		return arr;
	}

	public static byte[] copyWith_(byte[] _bytes, Integer integer) {
		return copyWith_(_bytes, ((int) integer));
	}

	public static byte[] copyWith_(byte[] _bytes, int integer) {
		return copyWith_(_bytes, (byte) integer);
	}

	public static boolean equals_(byte[] receiver, byte[] other) {
		if (receiver == null && other == null) return true;
		if (receiver == null || other == null) return false;
		if (receiver.length != other.length ) return false;
		for (int i=0 ; i < receiver.length; i++) {
			if (receiver[i] != other[i]) return false;
		}
		return true;
	}

	public static byte at_(byte[] receiver, int index) {
		return receiver[index - 1];
	}

	public static byte at_put_(byte[] receiver, int index, byte value) {
		return receiver[index - 1] = value;
	}

	public static int size(byte[] receiver) {
		return receiver.length;
	}

}
