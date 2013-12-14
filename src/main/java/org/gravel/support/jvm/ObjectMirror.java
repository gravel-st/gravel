package org.gravel.support.jvm;


public class ObjectMirror {
	public ObjectMirror(Object object) {
		this.object = object;
	}

	private final Object object;

	public ClassDescriptionMirror getClassMirror() {
		if(object == null) return ReflectionExtensions.getNilClassMirror();
		Class<? extends Object> aClass = object.getClass();
		return ReflectionExtensions.getClassMirror(aClass);
	}

}
