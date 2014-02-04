package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

public class FieldWriteCallSite extends FieldAccessCallSite {

	private FieldWriteCallSite(Lookup lookup, MethodType type, String selector, Class fieldType) {
		super(lookup, type, selector);
	}

	public static FieldWriteCallSite newInstance(Lookup lookup,
			MethodType type, String selector, Class fieldType) {
		FieldWriteCallSite callsite = new FieldWriteCallSite(lookup, type,
				selector, fieldType);
		BaseCallSite.register(callsite);
		return callsite;
	}

	@Override
	protected MethodHandle findAccess(Class receiverClass)
			throws NoSuchFieldException, IllegalAccessException {
		return lookup.findSetter(receiverClass, selector, getFieldType(receiverClass));
	}
}
