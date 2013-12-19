package st.gravel.support.jvm;

import st.gravel.support.compiler.ast.MetaclassNode;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class MetaclassMirror extends ClassDescriptionMirror {

	protected MetaclassMirror(Reference reference) {
		super(reference);
	}

	public String name() {
		return reference.nonmeta().name().asString() + " class";
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
