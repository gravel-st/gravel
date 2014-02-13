package st.gravel.support.jvm.debugger;

import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.IntegerValue;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ReferenceType;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.Event;
import com.sun.jdi.event.EventQueue;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.event.ExceptionEvent;
import com.sun.jdi.event.VMDeathEvent;
import com.sun.jdi.event.VMDisconnectEvent;

public class VMRemoteTarget extends VMRemoteInstance {
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
		startEventLoop();
	}

	private void startEventLoop() {
//		trapExceptions();
		new Thread(new Runnable() {

			@Override
			public void run() {
				try {
					eventLoop();
				} catch (InterruptedException e) {
					throw new RuntimeException(e);
				}
			}
		}).start();
	}

	private void trapExceptions() {
		ReferenceType referenceType = vm.classesByName("java.lang.Throwable").get(0);
		vm.eventRequestManager().createExceptionRequest(referenceType, true, true).enable();
	}

	private Process process;
	ThreadReference bootThread;

	private void eventLoop() throws InterruptedException {
		System.out.println("eventLoop started");
		EventQueue eventQueue = vm.eventQueue();
		boolean isRunning = true;
		while (isRunning) {
			EventSet eventSet = eventQueue.remove();
			boolean mayResume = true;
			for (Event event : eventSet) {
				System.out.println(event);
				if (event instanceof VMDeathEvent
						|| event instanceof VMDisconnectEvent) {
					isRunning = false;
				} else if (event instanceof ExceptionEvent) {
					mayResume = false;
				}
			}
			if (mayResume) eventSet.resume();
		}
	}

	public int add(int x, int y) throws Throwable {
		Value resultMirror = invokeMethod("add", vm.mirrorOf(x), vm.mirrorOf(y));
		return ((IntegerValue) resultMirror).intValue();
	}

	public void ping() throws Throwable {
		invokeMethod("ping");
	}

	public ObjectReference evaluateForked(String source) throws Throwable {
		return (ObjectReference) invokeMethod("evaluateForked", vm.mirrorOf(source));
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