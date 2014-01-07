package st.gravel.support.jvm;

import java.nio.CharBuffer;

public class ReadStreamExtensions {

	public static boolean atEnd(CharBuffer receiver) {
		return receiver.remaining() == 0;
	}

	public static Character next(CharBuffer receiver) {
		if (atEnd(receiver))
			return null;
		return receiver.get();
	}

	public static boolean peekFor_(CharBuffer receiver, char ch) {
		if (atEnd(receiver))
			return false;
		receiver.mark();
		if (receiver.get() == ch) {
			return true;
		}
		receiver.reset();
		return false;
	}

	public static Character peek(CharBuffer receiver) {
		if (atEnd(receiver))
			return null;
		return receiver.get(receiver.position());
	}

	public static Object skip_(CharBuffer receiver, int size) {
		receiver.position(receiver.position() + size);
		return receiver;
	}

	public static String next_(CharBuffer receiver, int count) {
		StringBuilder builder = new StringBuilder();
		for (int i = 0; i < count; i++) {
			builder.append(receiver.get());
		}
		return builder.toString();
	}

	public static String upTo_(CharBuffer receiver, char c) {
		final StringBuilder builder = new StringBuilder();
		while (!atEnd(receiver)) {
			final Character next = next(receiver);
			if (c == next) return builder.toString();
			builder.append(next);
		}
		return builder.toString();
	}

	public static String upToEnd(CharBuffer receiver) {
		final StringBuilder builder = new StringBuilder();
		while (!atEnd(receiver)) {
			final Character next = next(receiver);
			builder.append(next);
		}
		return builder.toString();
	}

	public static int position(CharBuffer receiver) {
		return receiver.position();
	}

	public static CharBuffer position_(CharBuffer receiver, int newPosition) {
		receiver.position(newPosition);
		return receiver;
	}

	public static CharBuffer setToEnd(CharBuffer receiver) {
		receiver.position(receiver.limit());
		return receiver;
	}

	public static String contents(CharBuffer receiver) {
		int oldPos = receiver.position();
		receiver.rewind();
		String string = receiver.toString();
		receiver.position(oldPos);
		return string;
	}

	public static CharBuffer reset(CharBuffer receiver) {
		receiver.rewind();
		return receiver;
	}

}
