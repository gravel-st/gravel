package st.gravel.support.jvm.debugger;

import java.util.Arrays;
import java.util.List;

import st.gravel.support.jvm.ArrayExtensions;
import st.gravel.support.jvm.Block1;

import com.sun.jdi.ClassNotLoadedException;
import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.IntegerValue;
import com.sun.jdi.InvalidTypeException;
import com.sun.jdi.InvocationException;
import com.sun.jdi.Method;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ReferenceType;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;
import com.sun.jdi.VirtualMachine;

public class VMTargetRemote implements VMTarget {
	private int debugPort;

	public VMTargetRemote(Process process, VirtualMachine vm,
			ThreadReference thread, int debugPort)
			throws IncompatibleThreadStateException {
		this.process = process;
		this.vm = vm;
		this.thread = thread;
		this.debugPort = debugPort;
		this.thisObject = thread.frames().get(0).thisObject();
	}

	private Process process;
	private VirtualMachine vm;
	private ThreadReference thread;
	private ObjectReference thisObject;

	private Value invokeMethod(String methodName, Value... arguments)
			throws InvalidTypeException, ClassNotLoadedException,
			IncompatibleThreadStateException, InvocationException {
		String args = ArrayExtensions.join_with_(arguments,
				new Block1<String, Value>() {

					@Override
					public String value_(Value arg) {
						return arg.toString();
					}
				}, ", ");
		System.out.print("" + debugPort + " Invoking " + methodName + "("
				+ args + ")");
		Method method = getMethod(methodName);
		Value result = thisObject.invokeMethod(thread, method,
				Arrays.asList(arguments), 0);
		System.out.println(" -> "+result);
		return result;
	}

	private Method getMethod(String methodName) {
		return getMethod(VMTarget.class, methodName);
	}

	private Method getMethod(Class<?> class1, String methodName) {
		List<ReferenceType> targetClasses = vm.classesByName(class1.getName());
		ReferenceType classRef = targetClasses.get(0);
		return classRef.methodsByName(methodName).get(0);
	}

	@Override
	public int add(int x, int y) throws Throwable {
		Value resultMirror = invokeMethod("add", vm.mirrorOf(x), vm.mirrorOf(y));
		return ((IntegerValue) resultMirror).intValue();
	}

	public void ping() throws InvalidTypeException, ClassNotLoadedException,
			IncompatibleThreadStateException, InvocationException {
		invokeMethod("ping");
	}
}