package st.gravel.support.jvm;

import st.gravel.support.jvm.runtime.ExceptionStack;
import st.gravel.support.jvm.runtime.MethodTools;
import st.gravel.support.jvm.runtime.UnhandledException;
import st.gravel.support.jvm.runtime.ExceptionStack.ExceptionHandler;

public class ExceptionExtensions {

	public static Object on_do_(Block0<Object> receiver,
			Object exceptionSelector, Object exBlock) {
		Object marker = new Object();
		ExceptionHandler handler = ExceptionStack.addHandler(exceptionSelector,
				exBlock, marker);
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

	public static Object raise(Object exception) throws Throwable {
		ExceptionStack.handle(exception);
		return exception;
	}

	public static Object pass(Object exception) throws Throwable {
		ExceptionStack.handlePass(exception);
		return exception;
	}

	public static Object return_(Object exception, Object value)
			throws Throwable {
		return ExceptionStack.handleReturn(exception, value);
	}

}
