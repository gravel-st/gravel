package st.gravel.support.compiler;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import st.gravel.support.compiler.testtools.TestBootstrap;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class DynamicParserTest {
	@Before
	public void setUp() {
		TestBootstrap.getSingleton();
	}

	@Test
	public void testAssignmentExpression() throws Throwable {
		Object appClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("st.gravel.support.compiler.ast.Parser");
		Object result = MethodTools.perform(appClass, "parseExpression:", "3 + 4");
		String prettySourceString = (String) MethodTools.perform(result, "prettySourceString");
		assertEquals("3 + 4", prettySourceString);
	}

	@Test
	public void testStringLiteralExpression() throws Throwable {
		Object appClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("st.gravel.support.compiler.ast.Parser");
		Object result = MethodTools.perform(appClass, "parseExpression:", "'fromage'");
		String prettySourceString = (String) MethodTools.perform(result, "prettySourceString");
		assertEquals("'fromage'", prettySourceString);
	}
}
