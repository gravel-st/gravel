package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

public class FieldReadCallSite extends FieldAccessCallSite {

	protected FieldReadCallSite(Lookup lookup, MethodType type, String selector) {
		super(lookup, type, selector);
	}

	public static FieldReadCallSite newInstance(Lookup lookup, MethodType type,
			String selector) {
		FieldReadCallSite callsite = new FieldReadCallSite(lookup, type,
				selector);
		BaseCallSite.register(callsite);
		return callsite;
	}
	
	@Override
	protected MethodHandle findAccess(Class receiverClass)
			throws NoSuchFieldException, IllegalAccessException {
		return lookup.findGetter(receiverClass, selector, Object.class);
	}
}
