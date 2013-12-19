package st.gravel.support.jvm;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.ClassNode;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

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
