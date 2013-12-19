package org.gravel.support.jvm;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.ast.ClassNode;
import org.gravel.support.compiler.ast.Reference;
import org.gravel.support.jvm.runtime.ImageBootstrapper;

public class ClassMirror extends ClassDescriptionMirror {

	protected ClassMirror(Reference reference) {
		super(reference);
	}

	public Symbol name() {
		return reference.nonmeta().name();
	}

	public ClassNode definitionClassNode() {
		return (ClassNode) ImageBootstrapper.systemMapping
				.definitionOrObsoleteClassNodeAt_(reference);
	}

	public boolean isMeta() {
		return false;
	}

	public ClassDescriptionMirror meta() {
		Reference metaReference = definitionClassNode().reference().meta();
		return ClassDescriptionMirror.forReference(metaReference);
	}

}
