package org.gravel.support.jvm;

import org.gravel.core.Symbol;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.SourcePosition;

public class MethodMirror {

	private final MethodNode method;
	private final ClassDescriptionMirror mclass;

	public MethodMirror(MethodNode method, ClassDescriptionMirror mclass) {
		this.method = method;
		this.mclass = mclass;
	}

	public String source() {
		SourcePosition sourcePosition = method.sourcePosition();
		if(sourcePosition == null) 
			return method.prettySourceString();
		String contentsOfEntireFile = FilenameExtensions.contentsOfEntireFile(sourcePosition.sourceFile().asFile());
		return contentsOfEntireFile.substring(sourcePosition.start(), sourcePosition.stop());
	}
	public Symbol selector() {
		return Symbol.value(method.selector());
	}
	
	public String protocol() {
		return method.protocol();
	}

	public Symbol packageName() {
		return method.packageName();
	}

	public ClassDescriptionMirror mclass() {
		return mclass;
	}
	
	
}
