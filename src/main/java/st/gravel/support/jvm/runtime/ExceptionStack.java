package st.gravel.support.jvm.runtime;

import st.gravel.support.jvm.NonLocalReturn;

public class ExceptionStack {
	public static class ExceptionHandler {

		private final Object exceptionSelector;
		private final Object exBlock;
		private final ExceptionHandler previous;
		private final Object marker;
		private final Object protectedBlock;

		public ExceptionHandler(Object protectedBlock,
				Object exceptionSelector, Object exBlock,
				ExceptionHandler previous, Object marker) {
			this.protectedBlock = protectedBlock;
			this.exceptionSelector = exceptionSelector;
			this.exBlock = exBlock;
			this.previous = previous;
			this.marker = marker;
		}

		public void handle(Object exception) throws Throwable {
			setCurrentHandler(exception, this);
			Object value = MethodTools.perform(exBlock, "value:", exception);
			boolean resume = MethodTools.perform(exception, "resume") == Boolean.TRUE;
			if (!resume) {
				throw new NonLocalReturn(value, marker);
			}
		}

		public boolean handles(Object exception) throws Throwable {
			Object res = MethodTools.perform(exceptionSelector, "handles:",
					exception);
			return res == Boolean.TRUE;
		}

		public Object marker() {
			return marker;
		}

		public ExceptionHandler previous() {
			return previous;
		}

	}

	private static final ThreadLocal<ExceptionStack> currentStack = new ThreadLocal<ExceptionStack>() {
		@Override
		protected ExceptionStack initialValue() {
			return new ExceptionStack();
		}
	};

	public static ExceptionHandler addHandler(Object protectedBlock,
			Object exceptionSelector, Object exBlock, Object marker) {
		return currentStack.get().pvtAddHandler(protectedBlock,
				exceptionSelector, exBlock, marker);
	}

	private static ExceptionHandler currentHandler(Object exception) {
		return (ExceptionHandler) MethodTools.safePerform(exception,
				"currentHandler");
	}

	public static void handle(Object exception, Object resumeMarker)
			throws Throwable {
		currentStack.get().pvtHandle(exception, resumeMarker);
	}

	public static void handlePass(Object exception) throws Throwable {
		currentStack.get().pvtHandlePass(exception);
	}

	public static void handleResume_(Object exception, Object returnValue) {
		currentStack.get().pvtHandleResume(exception, returnValue);
	}

	public static Object handleRetry(Object exception) throws Throwable {
		return currentStack.get().pvtHandleRetry(exception);
	}

	public static Object handleRetryUsing_(Object exception, Object value) throws Throwable {
		return currentStack.get().pvtHandleRetryUsing_(exception, value);
	}

	public static Object handleReturn(Object exception, Object value) {
		return currentStack.get().pvtHandleReturn(exception, value);
	}

	private static ExceptionHandler initialHandler(Object exception) {
		return (ExceptionHandler) MethodTools.safePerform(exception,
				"initialHandler");
	}

	public static boolean isNested(Object exception) throws Throwable {
		return currentStack.get().pvtIsNested(exception);
	}

	public static void removeHandler(ExceptionHandler handler) {
		currentStack.get().pvtRemoveHandler(handler);
	}

	private static void setCurrentHandler(Object exception,
			ExceptionHandler value) {
		MethodTools.safePerform(exception, "currentHandler:", value);
	}

	private static void setInitialHandler(Object exception,
			ExceptionHandler value) {
		MethodTools.safePerform(exception, "initialHandler:", value);
	}

	private ExceptionHandler current;

	private void executeDefaultAction(Object exception) {
		MethodTools.safePerform(exception, "defaultAction");
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
		executeDefaultAction(exception);
	}

	private ExceptionHandler pvtAddHandler(Object protectedBlock,
			Object exceptionSelector, Object exBlock, Object marker) {
		current = new ExceptionHandler(protectedBlock, exceptionSelector,
				exBlock, current, marker);
		return current;
	}

	private void pvtHandle(Object exception, Object resumeMarker)
			throws Throwable {
		setResumeMarker(exception, resumeMarker);
		ExceptionHandler handler = initialHandler(exception);
		if (handler == null)
			handler = current;
		if (handler == null) {
			executeDefaultAction(exception);
			return;
		}
		setInitialHandler(exception, handler);
		current = handler.previous();
		handleFrom(exception, handler);
		current = handler;
	}

	private void pvtHandlePass(Object exception) throws Throwable {
		handleFrom(exception, currentHandler(exception).previous());
	}

	private void pvtHandleResume(Object exception, Object returnValue) {
		Object resumeMarker = resumeMarker(exception);
		throw new NonLocalReturn(returnValue, resumeMarker);
	}

	private Object pvtHandleRetry(Object exception) throws Throwable {
		ExceptionHandler handler = currentHandler(exception);
		return pvtHandleRetryUsing_(exception, handler.protectedBlock);
	}

	private Object pvtHandleRetryUsing_(Object exception, Object value) throws Throwable {
		Object result = MethodTools.perform(value, "value");
		return pvtHandleReturn(exception, result);
	}

	private Object pvtHandleReturn(Object exception, Object value) {
		throw new NonLocalReturn(value, currentHandler(exception).marker());
	}

	private boolean pvtIsNested(Object exception) throws Throwable {
		ExceptionHandler handler = initialHandler(exception);
		if (handler == null)
			return false;
		while (handler != null) {
			if (handler.handles(exception)) {
				return true;
			}
			handler = handler.previous();
		}
		return false;
	}

	private void pvtRemoveHandler(ExceptionHandler handler) {
		if (current == handler) {
			current = handler.previous();
		}
	}

	private Object resumeMarker(Object exception) {
		return MethodTools.safePerform(exception, "resumeMarker");
	}

	private void setResumeMarker(Object exception, Object resumeMarker) {
		MethodTools.safePerform(exception, "resumeMarker:", resumeMarker);
	}

}
