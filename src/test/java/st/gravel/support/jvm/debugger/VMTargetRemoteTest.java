package st.gravel.support.jvm.debugger;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class VMTargetRemoteTest {
	
	private static final VMTargetRemote remote  = VMTargetStarter.newRemote();

	@Before
	public void setUp(){
		
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
}
