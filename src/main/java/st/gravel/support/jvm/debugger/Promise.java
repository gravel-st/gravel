package st.gravel.support.jvm.debugger;

public abstract class Promise implements Runnable {
	private Object result;
	private final Thread thread;
	private Throwable throwable;
	private boolean isFinished = false;

	public Promise() {
		thread = new Thread(this, "Promise");
	}

	@Override
	public void run() {
		try {
			result = evaluate();
		} catch (Throwable e) {
			System.out.println("caught "+e);
			throwable = e;
		} finally {
			isFinished = true;
		}
	}

	public abstract Object evaluate();

	public boolean isFinished() {
		return isFinished;
	}

	public Thread thread() {
		return thread;
	}

	public Object result() {
		return result;
	}

	public Throwable throwable() {
		return throwable;
	}
}