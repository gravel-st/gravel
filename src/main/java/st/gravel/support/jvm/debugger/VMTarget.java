package st.gravel.support.jvm.debugger;

public interface VMTarget {
	
	public void ping() throws Throwable;
	public int add(int x, int y) throws Throwable;

}
