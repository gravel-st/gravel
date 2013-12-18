package org.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;

import org.gravel.support.compiler.ast.AbstractMethodMapping;
import org.gravel.support.compiler.ast.Reference;


public class SuperCallSite extends BaseCallSite {

	public static SuperCallSite newInstance(MethodType type,
			String lookupStart, String selector, Lookup lookup) {
		SuperCallSite callsite = new SuperCallSite(type, lookupStart, selector,
				lookup);
		BaseCallSite.register(callsite);
		return callsite;
	}

	private SuperCallSite(MethodType type, String lookupStart, String selector,
			Lookup lookup) {
		super(lookup, type, selector);
		this.lookupStart = lookupStart;
	}

	private final String lookupStart;

	public MethodHandle lookupMethod(Class receiverClass) {
		return lookupMethod(receiverClass, selector);
	}

	public MethodHandle lookupMethod(Class receiverClass, String selector) {
		Reference reference = Reference.factory.value_(lookupStart);
		AbstractMethodMapping mapping = ImageBootstrapper.systemMapping
				.superMethodMappingFor_methodName_(reference, selector);
		if (mapping == null) {
			if (selector.equals("doesNotUnderstand_"))
				throw new RuntimeException("Can't find DNU method");
			return wrapDNUHandle(lookupMethod(receiverClass,
					"doesNotUnderstand_"));
		}
		MethodHandle methodHandle;
		try {
			Method method = MethodTools.searchForMethod(
					mapping.definingClass(), selector, type.parameterArray(),
					true);

			if (method != null) {
				return mapping.methodHandle().asType(type);
			}
			methodHandle = lookup.findSpecial(mapping.definingClass(),
					selector, type.dropParameterTypes(0, 1), lookup.lookupClass());
		} catch (NoSuchMethodException | IllegalAccessException r) {

			try {
				methodHandle = lookup.findStatic(mapping.definingClass(),
						selector, type);
			} catch (NoSuchMethodException | IllegalAccessException e) {

				throw new RuntimeException(e);
			}
		}
		return methodHandle.asType(type);
	}

	@Override
	protected void addTargetToCache(Object receiver) {
		Class receiverClass = receiver.getClass();
		MethodHandle target = lookupMethod(receiverClass);
		setTarget(target);
	}

	@Override
	protected void resetCache() {
	}

}
