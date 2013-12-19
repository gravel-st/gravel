package st.gravel.support.jvm;

public class NonLocalReturn extends RuntimeException {
	private static final long serialVersionUID = 1L;
	public final Object returnValue;
	public final Object marker;

	public NonLocalReturn(Object returnValue, Object marker) {
		super();
		this.returnValue = returnValue;
		this.marker = marker;
	}
}
