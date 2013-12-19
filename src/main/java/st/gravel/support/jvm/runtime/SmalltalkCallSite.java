package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

@SuppressWarnings("rawtypes")
public class SmalltalkCallSite extends PolymorphicCallSite {

	public static BaseCallSite newInstance(Lookup lookup, MethodType type,
			String selector) {
		BaseCallSite callsite = new SmalltalkCallSite(lookup, type,
				selector);
		BaseCallSite.register(callsite);

		return callsite;
	}

	private SmalltalkCallSite(Lookup lookup, MethodType type,
			String selector) {
		super(lookup, type, selector);
	}

	protected MethodHandle findMethodForNil() {
		MethodHandle methodHandle = ImageBootstrapper.systemMapping
				.methodHandleForNil_(selector);
		if (methodHandle == null) {
			return createDNUHandleForNil();
		}
		MethodHandle castHandle = methodHandle.asType(type);
		return castHandle;
	}

	protected MethodHandle findMethod(final Class receiverClass) {
		MethodHandle methodHandle = ImageBootstrapper.systemMapping
				.methodHandleFor_methodName_(receiverClass, selector);
		if (methodHandle == null) {
			methodHandle = createDNUHandle(receiverClass);
		}
		MethodHandle castHandle = methodHandle.asType(type);
		return castHandle;
	}

	public MethodHandle createDNUHandleForNil() {
		MethodHandle dnuHandle = ImageBootstrapper.systemMapping
				.methodHandleForNil_("doesNotUnderstand_arguments_");
		return wrapDNUHandle(dnuHandle);
	}

	public MethodHandle createDNUHandle(final Class receiverClass) {
		MethodHandle dnuHandle = ImageBootstrapper.systemMapping
				.methodHandleFor_methodName_(receiverClass,
						"doesNotUnderstand_arguments_");
		return wrapDNUHandle(dnuHandle);
	}
}
