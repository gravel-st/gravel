package org.gravel.support.compiler;

import static org.junit.Assert.assertNotNull;

import org.gravel.core.Symbol;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Test;

public class BrowserApplicationTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testRenderBrowserApplication() {
		
		Object appClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.ide.browser.BrowserApplication");
		Object stServlet = MethodTools.safePerform(appClass, "asServlet");
		Object session = MethodTools.safePerform(stServlet, "sessionOrNewAt:", null);
		String response = (String) MethodTools.safePerform(session, "writeResponseString");
			
		assertNotNull( response);
	}

	@Test
	public void test_BrowserApplicationTest_testRender() {
		
		Object testCaseClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.ide.browser.BrowserApplicationTest");
		Object testCase = MethodTools.safePerform(testCaseClass, "run:", Symbol.value("testRender"));
	}

	@Test
	public void test_BrowserApplicationTest_testSelect() {
		
		Object testCaseClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.ide.browser.BrowserApplicationTest");
		Object testCase = MethodTools.safePerform(testCaseClass, "run:", Symbol.value("testSelect"));
	}
}
