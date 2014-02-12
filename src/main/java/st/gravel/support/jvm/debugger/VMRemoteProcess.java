package st.gravel.support.jvm.debugger;

import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.VirtualMachine;

public class VMRemoteProcess extends VMRemoteInstance implements VMProcess {

	private ThreadReference thread;
	private VMRemoteTarget target;

	public VMRemoteProcess(VMRemoteTarget target, ThreadReference thread,
			ObjectReference localProcess) {
		super(localProcess);
		this.target = target;
		this.thread = thread;
	}

	@Override
	public boolean isFinished() {
		throw new RuntimeException("niy");
	}

	@Override
	public Object getValue() throws Throwable {
		throw new RuntimeException("niy");
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

}
