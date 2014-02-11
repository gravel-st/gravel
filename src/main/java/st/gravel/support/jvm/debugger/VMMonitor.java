package st.gravel.support.jvm.debugger;

import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import st.gravel.tools.StartJetty;

import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.ClassPrepareEvent;
import com.sun.jdi.event.Event;
import com.sun.jdi.event.EventQueue;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.event.VMDeathEvent;
import com.sun.jdi.event.VMDisconnectEvent;
import com.sun.jdi.request.ClassPrepareRequest;

public class VMMonitor {
	
	private static Process targetJVM;
	private static final ScheduledExecutorService terminator = 
			  Executors.newSingleThreadScheduledExecutor();
	private static final int debugPort = 8000;

	public static Process startSecondJVM(Class<?> mainClassToStart) throws IOException {
		String separator = System.getProperty("file.separator");
		String classpath = System.getProperty("java.class.path");
		String path = System.getProperty("java.home")
	                + separator + "bin" + separator + "java";
		
		ProcessBuilder processBuilder = 
	                new ProcessBuilder(path, "-Xdebug", "-Xrunjdwp:transport=dt_socket,address="+debugPort+",server=y", "-cp", 
	                classpath, 
	                mainClassToStart.getName());
		return processBuilder.start();
		
	}

	public static void main(String[] args) throws IOException,
			InterruptedException {
		
        targetJVM = startSecondJVM(StartJetty.class);
        
        terminator.schedule(new Runnable() {
            public void run() {
            	System.out.println("Destroying JVM");
            	targetJVM.destroy();
            	System.out.println("Destroying JVM. Done.");
            	
            }
          }, 15, TimeUnit.SECONDS);

        // connect
		VirtualMachine vm = new VMAcquirer().connect(debugPort);
		System.out.println("canAddMethod:" + vm.canAddMethod());
		System.out.println("canBeModified:" + vm.canBeModified());
		System.out.println("canForceEarlyReturn:" + vm.canForceEarlyReturn());
		System.out.println("canGetBytecodes:" + vm.canGetBytecodes());
		System.out.println("canUnrestrictedlyRedefineClasses:" + vm.canUnrestrictedlyRedefineClasses());
		// resume the vm
		vm.resume();
		ClassPrepareRequest createClassPrepareRequest = vm
				.eventRequestManager().createClassPrepareRequest();
		createClassPrepareRequest.addClassFilter("st.*");
		createClassPrepareRequest.enable();
		// process events
		EventQueue eventQueue = vm.eventQueue();
		while (true) {
			EventSet eventSet = eventQueue.remove();
			for (Event event : eventSet) {
				
				System.out.println(event.toString());
				if (event instanceof ClassPrepareEvent) {
					System.out.println("referenceType: "+((ClassPrepareEvent)event).referenceType());
				}
				if (event instanceof VMDeathEvent
						|| event instanceof VMDisconnectEvent) {
					// exit
					terminator.shutdown();
					return;
				}
				eventSet.resume();
			}
		}

		// /** Watch all classes of name "Test" */
		// private static void addClassWatch(VirtualMachine vm) {
		// EventRequestManager erm = vm.eventRequestManager();
		// ClassPrepareRequest classPrepareRequest = erm
		// .createClassPrepareRequest();
		// classPrepareRequest.addClassFilter(CLASS_NAME);
		// classPrepareRequest.setEnabled(true);
		// }
		//
		// /** Watch field of name "foo" */
		// private static void addFieldWatch(VirtualMachine vm,
		// ReferenceType refType) {
		// EventRequestManager erm = vm.eventRequestManager();
		// Field field = refType.fieldByName(FIELD_NAME);
		// ModificationWatchpointRequest modificationWatchpointRequest = erm
		// .createModificationWatchpointRequest(field);
		// modificationWatchpointRequest.setEnabled(true);
		// }

	}
}