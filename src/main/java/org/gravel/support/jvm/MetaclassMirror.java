package org.gravel.support.jvm;

import org.gravel.support.compiler.ast.MetaclassNode;
import org.gravel.support.compiler.ast.Reference;
import org.gravel.support.jvm.runtime.ImageBootstrapper;

public class MetaclassMirror extends ClassDescriptionMirror {

	protected MetaclassMirror(Reference reference) {
		super(reference);
	}

	public String name() {
		return definitionClassNode().classNode().name().asString() + " class";
	}

	public boolean isMeta() {
		return true;
	}

	public ClassDescriptionMirror nonmeta() {
		return ClassDescriptionMirror.forReference(reference.nonmeta());
	}

	@Override
	public MetaclassNode definitionClassNode() {
		return (MetaclassNode) ImageBootstrapper.systemMapping
				.definitionOrObsoleteClassNodeAt_(reference);

	}

}
