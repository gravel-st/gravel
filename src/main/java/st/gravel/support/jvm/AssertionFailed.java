package st.gravel.support.jvm;

public class AssertionFailed extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public AssertionFailed() {
		super();
	}

	public AssertionFailed(String message, Throwable cause) {
		super(message, cause);
	}

	public AssertionFailed(String message) {
		super(message);
	}

	public AssertionFailed(Throwable cause) {
		super(cause);
	}

}
