package st.gravel.support.jvm.debugger;

public interface VMProcess {

	boolean isFinished() throws Throwable;
	boolean isUnderDebug() throws Throwable;

	Object getValue() throws Throwable;

	Thread thread();
	Object getValueOrDebug() throws Throwable;

}
