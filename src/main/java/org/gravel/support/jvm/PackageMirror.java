package org.gravel.support.jvm;

import java.util.HashSet;

import org.gravel.core.Symbol;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.ClassNode;
import org.gravel.support.parser.PackageNode;

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