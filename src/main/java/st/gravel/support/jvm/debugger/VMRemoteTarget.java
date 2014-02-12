package st.gravel.support.jvm.debugger;

import java.util.ArrayList;
import java.util.List;

import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.IntegerValue;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.BreakpointEvent;
import com.sun.jdi.event.ClassPrepareEvent;
import com.sun.jdi.event.Event;
import com.sun.jdi.event.EventQueue;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.event.ExceptionEvent;
import com.sun.jdi.event.VMDeathEvent;
import com.sun.jdi.event.VMDisconnectEvent;

public class VMRemoteTarget extends VMRemoteInstance implements VMTarget {
	int debugPort;
	private VirtualMachine vm;

	public VMRemoteTarget(Process process, VirtualMachine vm,
			ThreadReference thread, int debugPort)
			throws IncompatibleThreadStateException {
		super(thread.frames().get(0).thisObject());
		this.vm = vm;
		this.process = process;
		this.bootThread = thread;
		this.debugPort = debugPort;
	}

	private Process process;
	ThreadReference bootThread;
	private List<VMRemoteProcess> remoteProcesses = new ArrayList<>();

	private void eventLoop() throws InterruptedException {
		EventQueue eventQueue = vm.eventQueue();
		boolean isRunning = true;
		while (isRunning) {
			EventSet eventSet = eventQueue.remove();
			for (Event event : eventSet) {
				if (event instanceof VMDeathEvent
						|| event instanceof VMDisconnectEvent) {
					isRunning = false;
				} else if (event instanceof ExceptionEvent) {
					ThreadReference thread = ((ExceptionEvent) event).thread();
				}
			}
			eventSet.resume();
		}
	}

	@Override
	public int add(int x, int y) throws Throwable {
		Value resultMirror = invokeMethod("add", vm.mirrorOf(x), vm.mirrorOf(y));
		return ((IntegerValue) resultMirror).intValue();
	}

	public void ping() throws Throwable {
		invokeMethod("ping");
	}

	@Override
	public VMProcess evaluateForked(String source) throws Throwable {
		ObjectReference localProcess = (ObjectReference) invokeMethod("evaluateForked", vm.mirrorOf(source));
		return newRemoteProcess(localProcess);
	}

	private VMRemoteProcess newRemoteProcess(ObjectReference localProcess) throws Throwable {
		ThreadReference thread = (ThreadReference) invokeMethod(localProcess, "thread");
		VMRemoteProcess vmRemoteProcess = new VMRemoteProcess(this, thread, localProcess);
		remoteProcesses.add(vmRemoteProcess);
		return vmRemoteProcess;
	}

	@Override
	protected int debugPort() {
		return debugPort;
	}

	@Override
	protected ThreadReference bootThread() {
		return bootThread;
	}

	@Override
	protected VirtualMachine vm() {
		return vm;
	}
}