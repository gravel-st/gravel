package st.gravel.support.jvm;

public class CharacterExtensions {
	private static final boolean[] VOWEL_MAP = new boolean[] { false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			true, false, false, false, true, false, false, false, true, false,
			false, false, false, false, true, false, false, false, false,
			false, true, false, false, false, false, false, false, false,
			false, false, false, false, true, false, false, false, true, false,
			false, false, true, false, false, false, false, false, true, false,
			false, false, false, false, true, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, true, true, true,
			true, true, true, false, false, true, true, true, true, true, true,
			true, true, false, false, true, true, true, true, true, false,
			true, true, true, true, true, false, false, false, true, true,
			true, true, true, true, false, false, true, true, true, true, true,
			true, true, true, false, false, true, true, true, true, true,
			false, true, true, true, true, true, false, false, false, true,
			true, true, true, true, true, false, false, false, false, false,
			false, false, false, false, false, false, false, true, true, true,
			true, true, true, true, true, true, true, false, false, false,
			false, false, false, false, false, false, false, false, false,
			true, true, true, true, true, true, true, true, true, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, true, true, true,
			true, true, true, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, true, true, true, true,
			true, true, true, true, true, true, true, true, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, true, false, false,
			false, false, false, false, false, true, true, true, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, true, true, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, false, false, false, false, false,
			false, false, false, false, true, true, true, true, true, true,
			true, true, true, true, true, true, true, true, true, true, false,
			true, true, true, true, false, false, false, false, false, false,
			false, false, true, true, true, true };
	
	public static Character asUppercase(Character receiver) {
		return Character.toUpperCase(receiver);
	}

	public static Integer asInteger(Character receiver) {
		return Integer.valueOf(receiver.charValue());
	}

	public static Character newInstance(Object receiver, int value) {
		return (char)value;
	}

	public static boolean isVowel(Character receiver) {
		if (receiver == null)
			return false;
		return isVowel((char) receiver);
	}

	public static boolean isSmallerThan_(Character receiver, Character other) {
		return receiver.compareTo(other) < 0;
	}

	public static boolean isVowel(char receiver) {
		if (receiver > VOWEL_MAP.length)
			return false;
		return VOWEL_MAP[receiver];
	}

	public static boolean isLetter(Character receiver) {
		if (receiver == null)
			return false;
		return isLetter((char) receiver);
	}

	public static boolean isLetter(char receiver) {
		return receiver >= 'A' && receiver <= 'Z' || receiver >= 'a'
				&& receiver <= 'z';
	}

	public static boolean isWhitespace(Character receiver) {
		if (receiver == null)
			return false;
		return isWhitespace((char) receiver);
	}

	public static boolean isWhitespace(char receiver) {
		return receiver == ' ' || receiver == '\n' || receiver == '\t'
				|| receiver == '\r';
	}

	public static boolean isDigit(final Character receiver) {
		if (receiver == null)
			return false;
		return isDigit((char) receiver);
	}

	public static boolean isDigit(final char receiver) {
		return (receiver >= '0') && (receiver <= '9');
	}

	public static int digitValue(final Character receiver) {
		if (receiver == null)
			return -1;
		return digitValue((char) receiver);
	}

	public static int digitValue(final char receiver) {
		int value = receiver - '0';
		if (value >= 0 && value <= 9)
			return value;
		value = receiver - 'A';
		if (value >= 0 && value <= 26)
			return value + 10;
		value = receiver - 'a';
		if (value >= 0 && value <= 26)
			return value + 10;

		return -1;
	}

	public static boolean equals_(char receiver, char other) {
		return receiver == other;
	}

	public static boolean equals_(Character receiver, char other) {
		return receiver != null && receiver.charValue() == other;
	}

	public static boolean equals_(char receiver, Character other) {
		return other != null && other.charValue() == receiver;
	}

	public static boolean equals_(Character receiver, Character other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}

}
