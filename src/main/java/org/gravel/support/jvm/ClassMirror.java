package org.gravel.support.jvm;


import org.gravel.core.Symbol;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.ClassNode;
import org.gravel.support.parser.Reference;

public class ClassMirror extends ClassDescriptionMirror {

	protected ClassMirror(Reference reference) {
		super(reference);
	}

	public Symbol name() {
		return (definitionClassNode()).name();
	}
	
	public ClassNode definitionClassNode() {
		return (ClassNode) ImageBootstrapper.systemMapping.definitionClassNodeAt_(reference);
	}
	
	public boolean isMeta() {
		return false;
	}

	public ClassDescriptionMirror meta() {
		Reference metaReference = definitionClassNode()
				.reference().meta();
		return ClassDescriptionMirror.forReference(metaReference);
	}

}
