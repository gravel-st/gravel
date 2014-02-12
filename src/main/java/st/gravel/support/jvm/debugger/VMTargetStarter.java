package st.gravel.support.jvm.debugger;

import java.io.IOException;
import java.util.List;

import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.Method;
import com.sun.jdi.ReferenceType;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.BreakpointEvent;
import com.sun.jdi.event.ClassPrepareEvent;
import com.sun.jdi.event.Event;
import com.sun.jdi.event.EventQueue;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.event.VMDeathEvent;
import com.sun.jdi.event.VMDisconnectEvent;
import com.sun.jdi.request.BreakpointRequest;
import com.sun.jdi.request.ClassPrepareRequest;

public class VMTargetStarter {
	private static int nextPort = 8000;
	private VMTargetStarter(int debugPort) {
		super();
		this.debugPort = debugPort;
	}

	private final int debugPort;

	public Process startSecondJVM(Class<?> mainClassToStart) throws IOException {
		String separator = System.getProperty("file.separator");
		String classpath = System.getProperty("java.class.path");
		String path = System.getProperty("java.home") + separator + "bin"
				+ separator + "java";

		ProcessBuilder processBuilder = new ProcessBuilder(path, "-Xdebug",
				"-Xrunjdwp:transport=dt_socket,address=" + debugPort
						+ ",server=y,suspend=y", "-cp", classpath,
				mainClassToStart.getCanonicalName());
		final Process process = processBuilder.start();
		Thread closeChildThread = new Thread() {
			public void run() {
				process.destroy();
			}
		};
		Runtime.getRuntime().addShutdownHook(closeChildThread);
		return process;

	}

	private static void sleep(int millis) {
		try {
			Thread.sleep(millis);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}

	public VMTargetRemote createJVM() throws IOException, InterruptedException,
			IncompatibleThreadStateException {
		Process process = startSecondJVM(VMTargetLocal.class);
		sleep(90);
		// connect
		VirtualMachine vm = new VMAcquirer().connect(debugPort);

		ClassPrepareRequest createClassPrepareRequest = vm
				.eventRequestManager().createClassPrepareRequest();
		createClassPrepareRequest.addClassFilter(VMTargetLocal.class.getName());
		createClassPrepareRequest.enable();
		vm.resume();

		// process events
		EventQueue eventQueue = vm.eventQueue();
		while (true) {
			EventSet eventSet = eventQueue.remove();
			for (Event event : eventSet) {
				if (event instanceof ClassPrepareEvent) {
					installHaltPoint(vm);
				}
				if (event instanceof VMDeathEvent
						|| event instanceof VMDisconnectEvent) {
					return null;
				}
				if (event instanceof BreakpointEvent) {
					ThreadReference thread = ((BreakpointEvent) event).thread();
					return new VMTargetRemote(process, vm, thread, debugPort);
				}
			}
			eventSet.resume();
		}
	}

	private void installHaltPoint(VirtualMachine vm) {
		List<ReferenceType> targetClasses = vm
				.classesByName(VMTargetLocal.class.getName());
		ReferenceType classRef = targetClasses.get(0);
		Method meth = classRef.methodsByName("haltPoint").get(0);
		BreakpointRequest req = vm.eventRequestManager()
				.createBreakpointRequest(meth.location());
		// req.setSuspendPolicy(BreakpointRequest.SUSPEND_EVENT_THREAD);
		req.enable();
	}

	public static VMTargetRemote newRemote(int port) {
		try {
			return new VMTargetStarter(port).createJVM();
		} catch (IOException | InterruptedException
				| IncompatibleThreadStateException e) {
			throw new RuntimeException(e);
		}
	}

	public static VMTargetRemote newRemote() {
		return newRemote(nextPort++);
	}

}
