package org.gravel.support.jvm;

public class WriteStreamFactory {

	public static Object on_(Object factory, Object anObject) {
		if (anObject instanceof String)  
		return new StringBuilder((String)anObject);
		throw new RuntimeException("Not implemented yet");
	}

	public static StringBuilder on_(String anObject) {
		return new StringBuilder(anObject);
	}

}
