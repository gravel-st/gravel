package st.gravel.support.jvm.debugger;

import java.util.concurrent.Semaphore;

import st.gravel.support.compiler.ast.AbsoluteReference;
import st.gravel.support.compiler.ast.Expression;
import st.gravel.support.compiler.ast.Parser;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public final class VMLocalProcess implements Runnable, VMProcess {
	private final String source;
	private Object result;
	private final Semaphore sema = new Semaphore(0);
	private Thread thread;
	private Throwable throwable;
	private boolean isFinished = false;

	VMLocalProcess(String source) {
		this.source = source;
	}

	@Override
	public void run() {
		try {
			AbsoluteReference _reference = AbsoluteReference.factory
					.object();
			Expression expression = Parser.factory.parseExpression_(source);
			result = ImageBootstrapper.systemMapping
					.evaluateExpression_reference_(expression, _reference);
		} catch (Throwable e) {
			throwable = e;
		} finally {
			isFinished = true;
			sema.release();
		}
	}

	@Override
	public boolean isFinished() {
		return isFinished;
	}


	@Override
	public Thread thread() {
		return thread;
	}
	@Override
	public synchronized Object getValue() throws Throwable {
		if (!isFinished) {
			try {
				sema.acquire();
			} catch (InterruptedException e) {
				throw new RuntimeException(e);
			}
		}
		if (throwable != null) {
			throw throwable;
		}
		return result;
	}

	public void spawn() {
		thread = new Thread(this);
		thread.start();
	}
}