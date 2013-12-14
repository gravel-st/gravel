package org.gravel.support.jvm;

import java.lang.reflect.Array;

public class ArrayFactory {

	public static <X> X[] with_(
			X element1) {
		X[] newInstance = (X[]) Array.newInstance(element1.getClass(), 1);
		newInstance[0] = element1;
		return newInstance;
	}

	public static  <X> X[] with_with_(
			X element1, X element2) {
		final Class<? extends Object> class1 = element1.getClass();
		final Class<? extends Object> class2 = element2.getClass();
		X[] newInstance = (X[]) Array.newInstance(commonSuperclass(class1, class2), 2);
		newInstance[0] = element1;
		newInstance[1] = element2;
		return newInstance;
	}

	public static <X> X[] with_with_with_(X element1,
			X element2, X element3) {
		final Class<? extends Object> class1 = element1.getClass();
		final Class<? extends Object> class2 = element2.getClass();
		final Class<? extends Object> class3 = element2.getClass();
		X[] newInstance = (X[]) Array.newInstance(commonSuperclass(class1, commonSuperclass(class2, class3)), 3);
		newInstance[0] = element1;
		newInstance[1] = element2;
		newInstance[2] = element3;
		return newInstance;
	}

	public static Class<?> commonSuperclass(Class<? extends Object> class1,
			Class<? extends Object> class2) {
		if (class1 == class2) return class1;
		Class<? extends Object> cl = class1;
		while (cl != null) {
			if(cl.isAssignableFrom(class2)) return cl;
			cl = cl.getSuperclass();
		}
		return commonSuperclass(class1, class2.getSuperclass());
	}

}
