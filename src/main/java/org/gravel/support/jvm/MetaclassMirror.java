package org.gravel.support.jvm;

import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.ClassNode;
import org.gravel.support.parser.MetaclassNode;
import org.gravel.support.parser.Reference;

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
				.definitionClassNodeAt_(reference);

	}

}
