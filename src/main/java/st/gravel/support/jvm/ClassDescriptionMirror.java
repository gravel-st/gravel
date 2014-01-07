package st.gravel.support.jvm;

import java.util.HashSet;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.ClassDescriptionNode;
import st.gravel.support.compiler.ast.ClassMapping;
import st.gravel.support.compiler.ast.ClassNode;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.PackageNode;
import st.gravel.support.compiler.ast.Parser;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.ast.SystemDefinitionNode;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public abstract class ClassDescriptionMirror {
	public static ClassDescriptionMirror forReference(Reference reference) {
		return reference.isMeta() ? new MetaclassMirror(reference)
				: new ClassMirror(reference);
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
		Symbol targetPackageName = current == null ? definitionClassNode()
				.packageName() : current.packageName();
		if (targetPackageName == null) {
			targetPackageName = definitionClassNode().packageName();
			if (targetPackageName == null) {
				targetPackageName = current.packageName();
			}
		}
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

	public ClassDescriptionNode runtimeClassNode() {
		return ImageBootstrapper.systemMapping.classMappingAtReference_(
				reference).classNode();
	}

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

	public HashSet<Symbol> flattenedSelectors() {
		final HashSet<Symbol> set = new HashSet<Symbol>();
		runtimeClassNode().selectorsDo_(new Block1<Object, String>() {

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
		MethodNode method = getMethodNode(selector);
		if (method == null) {
			return null;
		}
		return new MethodMirror(method, this);
	}

	private MethodNode getMethodNode(Symbol selector) {
		MethodNode method = runtimeClassNode().methodOrNilAt_(
				selector.asString());
		return method;
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
		ImageBootstrapper.systemMapping.subclassMappingsFor_do_(reference,
				new Block1<Object, ClassMapping>() {

					@Override
					public Object value_(ClassMapping arg1) {
						set.add(ClassDescriptionMirror.forReference(arg1
								.reference()));
						return null;
					}
				});
		return set;
	}

	public ClassDescriptionMirror superclass() {
		Reference superclassReference = ImageBootstrapper.systemMapping
				.classMappingAtReference_(reference).superclassReference();
		if (superclassReference == null)
			return null;
		return ClassDescriptionMirror.forReference(superclassReference);
	}

	public boolean canUnderstand_(Symbol selector) {
		return getMethodNode(selector) != null;
	}

}
