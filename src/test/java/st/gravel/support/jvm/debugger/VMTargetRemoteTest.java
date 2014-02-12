package st.gravel.support.jvm.debugger;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.sun.jdi.IntegerValue;
import com.sun.jdi.ObjectReference;

public class VMTargetRemoteTest {
	
	private static final VMRemoteTarget remote = VMTargetStarter.newRemote();

	@Before
	public void setUp() throws Throwable{
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
		VMProcess evaluator = remote.evaluateForked("3+4");
		ObjectReference result = (ObjectReference) evaluator.getValue();
		IntegerValue intValue = (IntegerValue) remote.invokeMethod(result, "intValue");
		assertEquals(7, intValue.intValue());
	}

//	@Test
//	public void testDNU() throws Throwable {
//		ObjectReference result = (ObjectReference) remote.evaluateForked("3 fromage");
//		IntegerValue intValue = (IntegerValue) remote.invokeMethod(result, "intValue");
//		assertEquals(7, intValue.intValue());
//	}
}
