package st.gravel.support.compiler.ast;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import org.junit.Test;
import static org.junit.Assert.*;
import st.gravel.support.compiler.ast.NonLocalTempWritesToHolderConverter;
import st.gravel.support.compiler.ast.IntermediateNodeRewriter;
import st.gravel.support.compiler.ast.Parser;

public class IntermediateNodeRewriterTest {

	@Test
	public void initialize() {
	}

	@Test
	public void testParseIdentityEquals() {
		NonLocalTempWritesToHolderConverter.factory.visit_(IntermediateNodeRewriter.factory.visit_(Parser.factory.parseMethod_("foo: a bar: b ^a == b")));
	}
}
