package st.gravel.support.jvm.debugger;

import java.util.Arrays;
import java.util.List;

import st.gravel.support.jvm.ArrayExtensions;
import st.gravel.support.jvm.Block1;
import st.gravel.support.jvm.OrderedCollectionExtensions;
import st.gravel.support.jvm.Predicate1;
import sun.misc.VM;

import com.sun.jdi.ClassNotLoadedException;
import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.InvalidTypeException;
import com.sun.jdi.InvocationException;
import com.sun.jdi.Method;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ReferenceType;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import com.sun.jdi.VirtualMachine;

public abstract class VMRemoteInstance {

	private ObjectReference receiver;

	public VMRemoteInstance(ObjectReference receiver) {
		this.receiver = receiver;
	}

	protected Value invokeMethod(String methodName, Value... arguments)
			throws InvalidTypeException, ClassNotLoadedException,
			IncompatibleThreadStateException, InvocationException {
		return invoke(receiver, getMethod(methodName), arguments);
	}

	private Value invoke(ObjectReference receiver, Method method,
			Value... arguments) throws InvalidTypeException,
			ClassNotLoadedException, IncompatibleThreadStateException,
			InvocationException {
		String args = ArrayExtensions.join_with_(arguments,
				new Block1<String, Value>() {

					@Override
					public String value_(Value arg) {
						return arg.toString();
					}
				}, ", ");
		System.out.print("" + debugPort() + " Invoking " + receiver + ">>"
				+ method.name() + "(" + args + ")");
		List<ThreadReference> suspendedThreads = OrderedCollectionExtensions.select_(receiver.virtualMachine().allThreads(), new Predicate1<ThreadReference>() {
			
			@Override
			public boolean value_(ThreadReference arg1) {
				return arg1.isSuspended();
					
			}
		});
		Value result = receiver.invokeMethod(bootThread(), method,
				Arrays.asList(arguments), 0);
		System.out.println(" -> " + result);
		List<ThreadReference> allThreads = receiver.virtualMachine().allThreads();
		for (ThreadReference threadReference : allThreads) {
			if (suspendedThreads.contains(threadReference)) {
				System.out.println("- Keep suspended: "+ threadReference + " suspendCount: "+ threadReference.suspendCount());
			} else {
				System.out.println("--------- Resume: "+ threadReference + " suspendCount: "+ threadReference.suspendCount());
				threadReference.resume();
			}
		}
		return result;
	}

	protected abstract int debugPort();

	protected abstract ThreadReference bootThread();

	protected abstract VirtualMachine vm();

	protected Method getMethod(String methodName) {
		List<Method> methodsByName = receiver.referenceType().methodsByName(
				methodName);
		if (methodsByName.isEmpty()) {
			throw new RuntimeException("Receiver: " + receiver + " dnu: "
					+ methodName);
		}
		return methodsByName.get(0);
	}

	protected Method getMethod(Class<?> class1, String methodName) {
		List<ReferenceType> targetClasses = vm()
				.classesByName(class1.getName());
		ReferenceType classRef = targetClasses.get(0);
		return classRef.methodsByName(methodName).get(0);
	}

	public Value invokeMethod(ObjectReference receiver, String methodName,
			Value... arguments) throws Throwable {
		Method method = receiver.referenceType().methodsByName(methodName)
				.get(0);
		return invoke(receiver, method, arguments);
	}

}
