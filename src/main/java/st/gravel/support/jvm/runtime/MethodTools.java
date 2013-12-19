package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.SelectorConverter;

public class MethodTools {
	private static final SelectorConverter selectorConverter = (SelectorConverter) SelectorConverter.factory
			.r_new();

	public static java.lang.reflect.Method searchForMethod(Class type,
			String name, int numArgs, boolean isStatic) {
		java.lang.reflect.Method[] methods = type.getMethods();
		Method best = null;
		for (int i = 0; i < methods.length; i++) {
			// Has to be named the same of course.
			if (!(methods[i].getName().equals(name)))
				continue;
			if (!(Modifier.isStatic(methods[i].getModifiers()) == isStatic))
				continue;

			Class[] types = methods[i].getParameterTypes();

			// Does it have the same number of arguments that we're looking for.
			if (types.length != numArgs)
				continue;

			// Check for type compatibility
			if (best == null) {
				best = methods[i];

			} else {
				if (areTypesCompatible(methods[i].getParameterTypes(),
						best.getParameterTypes())) {
					best = methods[i];
				}
			}
		}
		return best;
	}

	// Following from:
	// http://code.google.com/p/tuprolog/source/browse/2p/branches/TRY-ManninoClassLoading/src/alice/util/InspectionUtils.java?spec=svn639&r=639
	//
	public static java.lang.reflect.Method searchForMethod(Class type,
			String name, Class[] parms, boolean isStatic) {
		java.lang.reflect.Method[] methods = type.getMethods();
		Method best = null;
		for (int i = 0; i < methods.length; i++) {
			// Has to be named the same of course.
			if (!(methods[i].getName().equals(name)))
				continue;
			if (!(Modifier.isStatic(methods[i].getModifiers()) == isStatic))
				continue;

			Class[] types = methods[i].getParameterTypes();

			// Does it have the same number of arguments that we're looking for.
			if (types.length != parms.length)
				continue;

			// Check for type compatibility
			if (areTypesCompatible(types, parms))
				if (best == null) {
					best = methods[i];

				} else {
					if (methods[i].getDeclaringClass() != best
							.getDeclaringClass()) {
						best = methods[i].getDeclaringClass().isAssignableFrom(
								best.getDeclaringClass()) ? best : methods[i];
					} else {
						throw new RuntimeException("TODO: Multiple matches");
					}
				}
		}
		return best;
	}

	public static boolean areTypesCompatible(Class<?>[] targets,
			Class<?>[] sources) {
		if (targets.length != sources.length)
			return (false);

		for (int i = 0; i < targets.length; i++) {
			if (sources[i] == null)
				continue;

			if (targets[i].isInterface()) {
				Class<?>[] interfaces = sources[i].getInterfaces();
				for (Class<?> in : interfaces) {
					if (targets[i].equals(in))
						return true;
				}
			}

			if (!translateFromPrimitive(targets[i]).isAssignableFrom(
					translateFromPrimitive(sources[i])))
				return false;
		}
		return true;
	}

	public static Class<?> translateFromPrimitive(Class<?> primitive) {
		if (!primitive.isPrimitive())
			return (primitive);

		if (Boolean.TYPE.equals(primitive))
			return (Boolean.class);
		if (Character.TYPE.equals(primitive))
			return (Character.class);
		if (Byte.TYPE.equals(primitive))
			return (Byte.class);
		if (Short.TYPE.equals(primitive))
			return (Short.class);
		if (Integer.TYPE.equals(primitive))
			return (Integer.class);
		if (Long.TYPE.equals(primitive))
			return (Long.class);
		if (Float.TYPE.equals(primitive))
			return (Float.class);
		if (Double.TYPE.equals(primitive))
			return (Double.class);

		throw new RuntimeException("Error translating type:" + primitive);
	}

	public static MethodType asMethodType(Method method) {
		return MethodType.methodType(method.getReturnType(),
				method.getParameterTypes());
	}

	public static MethodHandle getHandle(Object receiver, String selectorString) {
		return getHandle(receiver, Symbol.value(selectorString));
	}

	public static MethodHandle getHandle(Object receiver, Symbol selector) {
		MethodHandle methodHandle;
		String methodName = selectorConverter.selectorAsFunctionName_(selector);

		if (receiver == null) {
			methodHandle = ImageBootstrapper.systemMapping
					.methodHandleForNil_(methodName);

		} else {
			Class receiverClass = receiver.getClass();
			methodHandle = ImageBootstrapper.systemMapping
					.methodHandleFor_methodName_(receiverClass, methodName);
		}

		return methodHandle;
	}

	public static Object perform(Object receiver, Symbol selector)
			throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver);
	}

	public static Object perform(Object receiver, Symbol selector, Object arg1)
			throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver, arg1);
	}

	public static Object perform(Object receiver, Symbol selector, Object arg1,
			Object arg2) throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver, arg1, arg2);
	}

	public static Object perform(Object receiver, Symbol selector, Object arg1,
			Object arg2, Object arg3) throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver, arg1, arg2, arg3);
	}

	public static Object perform(Object receiver, Symbol selector, Object arg1,
			Object arg2, Object arg3, Object arg4) throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver, arg1, arg2, arg3, arg4);
	}

	public static Object perform_withArguments_(Object receiver,
			Symbol selector, Object[] arguments) throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.bindTo(receiver).invokeWithArguments(arguments);
	}

	public static Object perform(Object receiver, String selector)
			throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver);
	}

	public static Object perform(Object receiver, String selector, Object arg1)
			throws Throwable {
		MethodHandle handle = getHandle(receiver, selector);
		return handle.invoke(receiver, arg1);
	}

	public static Object safePerform(Object receiver, String selector) {
		try {
			return perform(receiver, selector);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

	public static Object safePerform(Object receiver, String selector,
			Object arg1) {
		try {
			return perform(receiver, selector, arg1);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

}
