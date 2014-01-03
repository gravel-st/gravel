package st.gravel.support.jvm;

import st.gravel.core.Symbol;


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
	public boolean instanceRespondsTo_(Symbol selector) {
		return getClassMirror().canUnderstand_(selector);
	}

	
	
}
