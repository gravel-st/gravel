package st.gravel.support.jvm.debugger;

public interface VMProcess {

	boolean isFinished();

	Object getValue() throws Throwable;

	Thread thread();

}
