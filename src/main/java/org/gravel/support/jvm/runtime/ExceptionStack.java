package org.gravel.support.jvm.runtime;

import org.gravel.support.jvm.NonLocalReturn;

public class ExceptionStack {
	public static ExceptionHandler addHandler(Object exceptionSelector,
			Object exBlock, Object marker) {
		return currentStack.get().pvtAddHandler(exceptionSelector, exBlock,
				marker);
	}

	public static void handle(Object exception) throws Throwable {
		currentStack.get().pvtHandle(exception);
	}

	public static void handlePass(Object exception) throws Throwable {
		currentStack.get().pvtHandlePass(exception);
	}

	public static Object handleReturn(Object exception, Object value) {
		return currentStack.get().pvtHandleReturn(exception, value);
	}

	public static void removeHandler(ExceptionHandler handler) {
		currentStack.get().pvtRemoveHandler(handler);
	}

	private static final ThreadLocal<ExceptionStack> currentStack = new ThreadLocal<ExceptionStack>() {
		@Override
		protected ExceptionStack initialValue() {
			return new ExceptionStack();
		}
	};

	public static class ExceptionHandler {

		private final Object exceptionSelector;
		private final Object exBlock;
		private final ExceptionHandler previous;
		private final Object marker;

		public ExceptionHandler(Object exceptionSelector, Object exBlock,
				ExceptionHandler previous, Object marker) {
			this.exceptionSelector = exceptionSelector;
			this.exBlock = exBlock;
			this.previous = previous;
			this.marker = marker;
		}

		public boolean handles(Object exception) throws Throwable {
			Object res = MethodTools.perform(exceptionSelector, "handles:",
					exception);
			return res == Boolean.TRUE;
		}

		public void handle(Object exception) throws Throwable {
			MethodTools.perform(exception, "currentHandler:", this);
			Object value = MethodTools.perform(exBlock, "value:", exception);
			boolean resume = MethodTools.perform(exception, "resume") == Boolean.TRUE;
			if (!resume) {
				throw new NonLocalReturn(value, marker);
			}
		}

		public ExceptionHandler previous() {
			return previous;
		}

		public Object marker() {
			return marker;
		}

	}

	private ExceptionHandler current;

	private ExceptionHandler pvtAddHandler(Object exceptionSelector,
			Object exBlock, Object marker) {
		current = new ExceptionHandler(exceptionSelector, exBlock, current,
				marker);
		return current;
	}

	private void pvtHandle(Object exception) throws Throwable {
		ExceptionHandler handler = current;
		if (current == null) {
			throw new UnhandledException(exception);
		}
		current = current.previous();
		handleFrom(exception, handler);
		current = handler;
	}

	public void handleFrom(Object exception, ExceptionHandler handler)
			throws Throwable {
		while (handler != null) {
			if (handler.handles(exception)) {
				handler.handle(exception);
				return;
			}
			handler = handler.previous();
		}
		throw new UnhandledException(exception);
	}

	private void pvtHandlePass(Object exception) throws Throwable {
		handleFrom(exception, currentHandler(exception).previous());
	}

	private Object pvtHandleReturn(Object exception, Object value) {
		throw new NonLocalReturn(value, currentHandler(exception).marker());
	}

	private ExceptionHandler currentHandler(Object exception) {
		return (ExceptionHandler) MethodTools.safePerform(exception, "currentHandler");
	}

	private void pvtRemoveHandler(ExceptionHandler handler) {
		if (current == handler) {
			current = handler.previous();
		}
	}

}
