package st.gravel.support.jvm;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.AbstractClassMapping;
import st.gravel.support.compiler.ast.ClassMapping;
import st.gravel.support.jvm.runtime.ImageBootstrapper;
import st.gravel.support.jvm.runtime.MethodTools;

public class ObjectExtensions {
	public static Method getCloneMethod(Class clazz) {
		try {
			return clazz.getMethod("clone");
		} catch (NoSuchMethodException | SecurityException e) {
			throw new RuntimeException(e);
		}
	}

	public static <X> X assert_(X receiver, boolean test) {
		if (!test) {
			throw new AssertionFailed();
		}
		return receiver;
	}

	public static <X> X deny_(X receiver, boolean test) {
		if (test) {
			throw new AssertionFailed();
		}
		return receiver;
	}

	public static boolean inheritsFrom_(ObjectClass receiver, Object arg) {
		ClassMapping cm = ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(receiver.getClass());
		ClassMapping other = ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(arg.getClass());
		AbstractClassMapping sm = cm;
		while (sm != null) {
			sm = sm.superclassMappingIn_(ImageBootstrapper.systemMapping);
			if (sm == other)
				return true;
		}
		return false;
	}

	public static boolean includesBehavior_(ObjectClass receiver, Object arg) {
		if (receiver == arg)
			return true;
		return inheritsFrom_(receiver, arg);
	}

	public static <X extends Object> X copy(X object) {
		try {
			return (X) getCloneMethod(object.getClass()).invoke(object);
		} catch (IllegalAccessException | IllegalArgumentException
				| InvocationTargetException e) {
			throw new RuntimeException(e);
		}
	}

	public static <X> X halt(X receiver) {
//		receiver.toString();
//		return receiver;
		throw new RuntimeException("Halt encountered on: "
				+ receiver.toString());
	}

	public static boolean equals_(Object receiver, Object other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}

	public static boolean identityEquals_(Object receiver, Object other) {
		return (receiver == null && other == null) || (receiver == other);
	}

	public static String classTitle(ObjectClass receiver) {
		ClassMapping cm = ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(receiver.getClass());
		return cm.reference().nonmeta().toString();
	}

	public static Object perform_(Object receiver, Symbol selector)
			throws Throwable {
		return MethodTools.perform(receiver, selector);
	}

	public static Object perform_with_(Object receiver, Symbol selector,
			Object arg1) throws Throwable {
		return MethodTools.perform(receiver, selector, arg1);
	}

	public static Object perform_with_with_(Object receiver, Symbol selector,
			Object arg1, Object arg2) throws Throwable {
		return MethodTools.perform(receiver, selector, arg1, arg2);
	}

	public static Object perform_with_with_with_(Object receiver,
			Symbol selector, Object arg1, Object arg2, Object arg3)
			throws Throwable {
		return MethodTools.perform(receiver, selector, arg1, arg2, arg3);
	}

	public static Object perform_with_with_with_with_(Object receiver,
			Symbol selector, Object arg1, Object arg2, Object arg3, Object arg4)
			throws Throwable {
		return MethodTools.perform(receiver, selector, arg1, arg2, arg3, arg4);
	}

	public static Object perform_withArguments_(Object receiver,
			Symbol selector, Object[] args)
			throws Throwable {
		return MethodTools.perform_withArguments_(receiver, selector, args);
	}

	public static Object shallowCopy(Object receiver) {
		Class<? extends Object> receiverClass = receiver.getClass();
		try {
			return receiverClass.getMethod("clone").invoke(receiver);
		} catch (IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | SecurityException e) {
			throw new RuntimeException(e);
		} catch (NoSuchMethodException e) {
			if (receiverClass == Object.class) {
				return new Object();
			}
			throw new RuntimeException(e);
		}
	}
	
	public static Object breakpoint(Object receiver) {
		receiver.toString();
		return receiver;
	}
	
	

}
