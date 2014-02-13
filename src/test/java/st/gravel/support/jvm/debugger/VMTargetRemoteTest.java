package st.gravel.support.jvm.debugger;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.sun.jdi.BooleanValue;
import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.IntegerValue;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.StackFrame;
import com.sun.jdi.StringReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.Value;

public class VMTargetRemoteTest {

	private static final VMRemoteTarget remote = VMTargetStarter.newRemote();

	@Before
	public void setUp() throws Throwable {
	}

	private void printThreadState() {
		System.out.println();
		List<ThreadReference> allThreads = remote.vm().allThreads();
		for (ThreadReference threadReference : allThreads) {
			System.out.println(threadReference + " isSuspended: "
					+ threadReference.isSuspended() + " suspendCount: "
					+ threadReference.suspendCount());
		}
	}

	@Test
	public void testPing() throws Throwable {
		remote.ping();
	}

	@Test
	public void testAdd() throws Throwable {
		int result = remote.add(3, 4);
		assertEquals(7, result);
	}

	@Test
	public void testEvaluate() throws Throwable {
		ObjectReference promise = remote.evaluateForked("3+4");
		ThreadReference thread = ((ThreadReference) remote.invokeMethod(
				promise, "thread"));
		Value result1 = remote.invokeMethod(promise, "result");
		Value ex = remote.invokeMethod(promise, "throwable");
		printThreadState();
		VMTargetStarter.sleep(100);
		printThreadState();

		boolean isFinished = ((BooleanValue) remote.invokeMethod(promise,
				"isFinished")).booleanValue();

		assertTrue(isFinished);
		ObjectReference result = (ObjectReference) remote.invokeMethod(promise,
				"result");
		IntegerValue intValue = (IntegerValue) remote.invokeMethod(result,
				"intValue");
		assertEquals(7, intValue.intValue());
	}

	@Test
	public void testDNU() throws Throwable {
		ObjectReference promise = remote.evaluateForked("3 fromage");
		ThreadReference thread = ((ThreadReference) remote.invokeMethod(
				promise, "thread"));
		remote.invokeMethod(thread, "start");
		ObjectReference state = (ObjectReference) remote.invokeMethod(thread, "getState");
		StringReference str = (StringReference) remote.invokeMethod(state, "toString");
		System.out.println(str.value());
		
		printStack(thread);
//		assertFalse(thread.isSuspended());
		printThreadState();
		System.out.println("VMTargetStarter.sleep(1000)");
		VMTargetStarter.sleep(1000);
		printStack(thread);
		printThreadState();

		boolean isFinished = ((BooleanValue) remote.invokeMethod(promise,
				"isFinished")).booleanValue();

		assertFalse(isFinished);
		printThreadState();

		printStack(thread);
		assertTrue(thread.isAtBreakpoint());
	}

	private void printStack(ThreadReference thread)
			throws IncompatibleThreadStateException {
		List<StackFrame> frames = thread.frames();
		for (StackFrame stackFrame : frames) {
			System.out.println("-Stack: "+ stackFrame+" location:  "+stackFrame.location().method());
			
		}
	}
}
