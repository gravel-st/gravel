package org.gravel.support.compiler;

import static org.junit.Assert.*;

import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;
import org.junit.Before;
import org.junit.Test;

public class DynamicParserTest {
	@Before
	public void setUp() {
		ImageBootstrapper.bootstrap();
	}

	@Test
	public void testAssignmentExpression() throws Throwable {
		Object appClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.parser.Parser");
		Object result = MethodTools.perform(appClass, "parseExpression:", "3 + 4");
		String prettySourceString = (String) MethodTools.perform(result, "prettySourceString");
		assertEquals("3 + 4", prettySourceString);
	}
}
