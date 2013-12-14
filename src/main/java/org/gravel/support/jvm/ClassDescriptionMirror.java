package org.gravel.support.jvm;

import java.util.HashSet;

import org.gravel.core.Symbol;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.ClassDescriptionNode;
import org.gravel.support.parser.ClassMapping;
import org.gravel.support.parser.ClassNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.PackageNode;
import org.gravel.support.parser.Parser;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.SystemDefinitionNode;
import org.gravel.support.parser.SystemNode;

public abstract class ClassDescriptionMirror {
	public static ClassDescriptionMirror forReference(
			Reference reference) {
		return reference.isMeta() ? new MetaclassMirror(reference) : new ClassMirror(reference);
	}
	
	protected final Reference reference;

	protected ClassDescriptionMirror(Reference reference) {
		super();
		this.reference = reference;
	}

	public Object compile_classified_(String source, String protocol) {
		final MethodNode method = Parser.factory.parseMethod_(source)
				.withProtocol_(protocol);

		ClassDescriptionNode currentClassNode = definitionClassNode();
		final MethodNode current = currentClassNode.methodOrNilAt_(method
				.selector());
		Symbol targetPackageName = current == null ? definitionClassNode().packageName()
				: current.packageName();
		SystemDefinitionNode newSystem = ImageBootstrapper.systemMapping
				.systemDefinitionNode().copyUpdatePackage_do_(
						targetPackageName,
						new Block1<PackageNode, PackageNode>() {

							@Override
							public PackageNode value_(PackageNode packageNode) {
								return packageNode.copyUpdateClassNode_do_(
										definitionClassNode().reference(),
										new Block1<ClassNode, ClassNode>() {

											@Override
											public ClassNode value_(
													ClassNode classNode) {

												return current == null ? classNode
														.withMethodNode_(method)
														: classNode
																.copyReplaceMethodNode_(method);
											}
										});
							}
						});
		ImageBootstrapper.systemMapping.updateTo_(newSystem);
		return getMethodMirror(Symbol.value(method.selector()));
	}

	public abstract ClassDescriptionNode definitionClassNode();

	public HashSet<Symbol> definitionSelectors() {
		final HashSet<Symbol> set = new HashSet<Symbol>();
		definitionClassNode().selectorsDo_(new Block1<Object, String>() {

			@Override
			public Object value_(String selectorString) {
				set.add(Symbol.value(selectorString));
				return null;
			}
		});
		return set;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClassDescriptionMirror other = (ClassDescriptionMirror) obj;
		if (reference == null) {
			if (other.reference != null)
				return false;
		} else if (!reference.equals(other.reference))
			return false;
		return true;
	}

	public MethodMirror getMethodMirror(Object selObject) {
		if (!(selObject instanceof Symbol))
			return null;
		Symbol selector = (Symbol) selObject;
		MethodNode method = definitionClassNode().methodOrNilAt_(selector.asString());
		if (method == null) {
			return null;
		}
		return new MethodMirror(method, this);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((reference == null) ? 0 : reference.hashCode());
		return result;
	}

	public boolean includesBehavior_(Object classOrMirror) {
		if (classOrMirror instanceof ClassDescriptionMirror)
			return ObjectExtensions.includesBehavior_(instance(),
					((ClassDescriptionMirror) classOrMirror).instance());
		return ObjectExtensions.includesBehavior_(instance(), classOrMirror);
	}

	public ObjectClass instance() {
		Object singleton = ImageBootstrapper.systemMapping
				.singletonAtReference_(reference.nonmeta());
		return (ObjectClass) singleton;
	}

	public Symbol packageName() {
		return definitionClassNode().packageName();
	}

	public boolean isTrait() {
		return definitionClassNode().isTrait();
	}

	public Reference reference() {
		return reference;
	}
	
	public HashSet<ClassDescriptionMirror> subclasses() {
		final HashSet<ClassDescriptionMirror> set = new HashSet<>();
		ImageBootstrapper.systemMapping.subclassMappingsFor_do_(reference, new Block1<Object, ClassMapping>() {
	
			@Override
			public Object value_(ClassMapping arg1) {
				set.add(ClassDescriptionMirror.forReference(arg1.reference()));
				return null;
			}});
		return set;
	}

	public ClassDescriptionMirror superclass() {
		Reference superclassReference = ImageBootstrapper.systemMapping.classMappingAtReference_(reference).superclassReference();
		if (superclassReference == null) return null;
		return ClassDescriptionMirror.forReference(superclassReference);
	}

}
