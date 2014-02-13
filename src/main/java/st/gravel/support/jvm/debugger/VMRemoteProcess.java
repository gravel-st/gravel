package st.gravel.support.jvm.debugger;

import java.util.concurrent.Semaphore;

import com.sun.jdi.BooleanValue;
import com.sun.jdi.Method;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.ExceptionEvent;

public class VMRemoteProcess extends VMRemoteInstance implements VMProcess {

	private ThreadReference thread;
	private VMRemoteTarget target;
	private boolean isUnderDebug;
	private Semaphore debugOrAnswerSema = new Semaphore(0);

	public VMRemoteProcess(VMRemoteTarget target, ThreadReference thread,
			ObjectReference localProcess) {
		super(localProcess);
		this.target = target;
		this.thread = thread;
	}

	@Override
	public boolean isFinished() throws Throwable {
		return ((BooleanValue) invokeMethod("isFinished")).booleanValue();
	}

	@Override
	public Object getValue() throws Throwable {
		return invokeMethod("getValue");
	}

	@Override
	public Thread thread() {
		throw new RuntimeException("niy");
	}

	@Override
	protected int debugPort() {
		return target.debugPort();
	}

	@Override
	protected ThreadReference bootThread() {
		return target.bootThread();
	}

	@Override
	protected VirtualMachine vm() {
		return target.vm();
	}

	@Override
	public boolean isUnderDebug() throws Throwable {
		return isUnderDebug;
	}

	public void processExceptionEvent(ExceptionEvent exEvent) {
		isUnderDebug = true;
		debugOrAnswerSema.release();
	}

	@Override
	public Object getValueOrDebug() throws Throwable {
		final Object[] value = new Object[] { null };

		new Thread(new Runnable() {

			@Override
			public void run() {
				try {
					value[0] = getValue();
					debugOrAnswerSema.release();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}
			}
		}).start();
		debugOrAnswerSema.acquire();
		return value[0];
	}

}
