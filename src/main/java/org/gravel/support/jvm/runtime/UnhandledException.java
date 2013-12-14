package org.gravel.support.jvm.runtime;

public class UnhandledException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	private Object exception;

	public UnhandledException(Object exception) {
		super(extractMessageText(exception));
		this.exception = exception;
	}

	public static String extractMessageText(Object exception) {
		try {
			return (String) MethodTools.perform(exception, "messageText");
		} catch (Throwable e) {
			return exception.getClass().getSimpleName();
		}
	}

}
