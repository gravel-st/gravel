package st.gravel.support.jvm;

import java.nio.CharBuffer;

public class ReadStreamFactory {

	public static CharBuffer on_(Object receiver, String string) {
		return on_(string);
	}

	public static CharBuffer on_(String string) {
		return CharBuffer.wrap(string);
	}

}
