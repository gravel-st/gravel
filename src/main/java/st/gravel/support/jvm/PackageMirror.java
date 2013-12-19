package st.gravel.support.jvm;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.ClassNode;
import st.gravel.support.compiler.ast.PackageNode;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class PackageMirror {

	public PackageMirror(Symbol name) {
		super();
		this.name = name;
	}

	private final Symbol name;

	public Symbol name() {
		return name;
	}

	private PackageNode packageNode() {
		return ArrayExtensions.detect_ifNone_(ImageBootstrapper.systemMapping
				.systemDefinitionNode().packageNodes(),
				new Predicate1<PackageNode>() {

					@Override
					public boolean value_(PackageNode arg1) {
						return arg1.name() == name;
					}
				}, new Block0<PackageNode>() {

					@Override
					public PackageNode value() {
						throw new RuntimeException("Not found");
					}
				});

	}

	private ClassDescriptionMirror[] definedMirrors(final boolean isTrait) {
		return ArrayExtensions.collect_(ArrayExtensions.select_(packageNode()
				.classes(), new Predicate1<ClassNode>() {

			@Override
			public boolean value_(ClassNode arg1) {
				return arg1.isTrait() == isTrait;
			}
		}), new Block1<ClassDescriptionMirror, ClassNode>() {

			@Override
			public ClassDescriptionMirror value_(ClassNode node) {
				return ClassDescriptionMirror.forReference(node.reference());
			}
		});
	}

	public ClassDescriptionMirror[] definedTraits() {
		return definedMirrors(true);
	}

	public ClassDescriptionMirror[] definedClasses() {
		return definedMirrors(false);
	}

}
