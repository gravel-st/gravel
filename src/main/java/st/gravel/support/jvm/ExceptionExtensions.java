package st.gravel.support.jvm;

import st.gravel.support.jvm.runtime.ExceptionStack;
import st.gravel.support.jvm.runtime.MethodTools;
import st.gravel.support.jvm.runtime.UnhandledException;
import st.gravel.support.jvm.runtime.ExceptionStack.ExceptionHandler;

public class ExceptionExtensions {

	public static Object on_do_(Block0<Object> receiver,
			Object exceptionSelector, Object exBlock) {
		Object marker = new Object();
		ExceptionHandler handler = ExceptionStack.addHandler(receiver,
				exceptionSelector, exBlock, marker);
		try {
			return receiver.value();
		} catch (NonLocalReturn nlr) {
			if (nlr.marker == marker) {
				return nlr.returnValue;
			} else {
				throw nlr;
			}
		} finally {
			ExceptionStack.removeHandler(handler);
		}
	}

	public static Object warningNoHandler_(Object receiver, Object messageText) {
		System.err.println(messageText);
		return receiver;
	}

	public static Object ifCurtailed_(Block0<Object> receiver,
			Object ifCurtailedBlock) throws Throwable {
		try {
			return receiver.value();
		} catch (NonLocalReturn nlr) {
			MethodTools.perform(ifCurtailedBlock, "value");
			throw nlr;
		} catch (UnhandledException uhe) {
			MethodTools.perform(ifCurtailedBlock, "value");
			throw uhe;
		}
	}

	public static Object ensure_(Block0<Object> receiver, Object arg1)
			throws Throwable {
		try {
			return receiver.value();
		} finally {
			MethodTools.perform(arg1, "value");
		}
	}

	public static boolean isNested(Object exception) throws Throwable {
		return ExceptionStack.isNested(exception);
	}

	public static Object raise(Object exception) throws Throwable {
		Object resumeMarker = new Object();
		try {
			ExceptionStack.handle(exception, resumeMarker);
			return exception;
		} catch (NonLocalReturn r) {
			if (r.marker == resumeMarker) return r.returnValue;
			throw r;
		}
	}

	public static Object pass(Object exception) throws Throwable {
		ExceptionStack.handlePass(exception);
		return exception;
	}

	public static Object resume_(Object exception, Object returnValue) throws Throwable {
		ExceptionStack.handleResume_(exception, returnValue);
		return exception;
	}

	public static Object noHandler(Object exception) {
		throw new UnhandledException(exception);
	}

	public static Object return_(Object exception, Object value)
			throws Throwable {
		return ExceptionStack.handleReturn(exception, value);
	}

	public static Object retryUsing_(Object exception, Object value)
			throws Throwable {
		return ExceptionStack.handleRetryUsing_(exception, value);
	}

	public static Object retry(Object exception)
			throws Throwable {
		return ExceptionStack.handleRetry(exception);
	}

}
