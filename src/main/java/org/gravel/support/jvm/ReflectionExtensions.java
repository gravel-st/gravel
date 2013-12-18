package org.gravel.support.jvm;

import org.gravel.support.compiler.ast.ClassMapping;
import org.gravel.support.compiler.ast.PackageNode;
import org.gravel.support.jvm.runtime.ImageBootstrapper;

public class ReflectionExtensions {

	public static ObjectMirror reflect_(Object receiver, Object object) {
		return new ObjectMirror(object);
	}

	public static Object packages(Object receiver) {
		return ArrayExtensions.collect_(ImageBootstrapper.systemMapping.systemDefinitionNode().packageNodes(), new Block1<PackageMirror, PackageNode>() {
			
			@Override
			public PackageMirror value_(PackageNode packageNode) {
				return new PackageMirror(packageNode.name());
			}
		} );
	}

	public static ClassDescriptionMirror getClassMirror(
			Class<? extends Object> aClass) {
		ClassMapping classMapping = ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(aClass);
		return ClassDescriptionMirror.forReference(classMapping.reference());
	}

	public static ClassDescriptionMirror getNilClassMirror() {
		ClassMapping classMapping = ImageBootstrapper.systemMapping
				.nilClassMapping();
		return ClassDescriptionMirror.forReference(classMapping.reference());
	}
}
