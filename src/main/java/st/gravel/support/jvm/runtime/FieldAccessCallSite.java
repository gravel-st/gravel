package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

public abstract class FieldAccessCallSite extends BaseCallSite {

	protected FieldAccessCallSite(Lookup lookup, MethodType type,
			String selector) {
		super(lookup, type, selector);
	}

	@Override
	protected void resetCache() {
	}

	@Override
	protected void addTargetToCache(Object receiver) {
		setTarget(findFieldAccess(receiver.getClass()));
	}

	protected MethodHandle findFieldAccess(Class receiverClass) {
		MethodHandle access = findAccessOrNil(receiverClass);
		if (access == null)
			throw new RuntimeException("Access not found");
		return access.asType(type);
	}

	protected MethodHandle findAccessOrNil(Class receiverClass) {
		// Try to find the highest defined access
		MethodHandle found = null;
		Class cl = receiverClass;
		while (cl != null) {
			MethodHandle sFound = localFindAccessOrNil(cl);
			if (sFound != null)
				found = sFound;
			cl = cl.getSuperclass();
		}
		return found;
	}

	protected MethodHandle localFindAccessOrNil(Class receiverClass) {
		if (receiverClass == null)
			return null;
		try {
			return findAccess(receiverClass);
		} catch (NoSuchFieldException e) {
			return null;
		} catch (IllegalAccessException e) {
			return null;
		}
	}

	protected abstract MethodHandle findAccess(Class receiverClass) throws NoSuchFieldException, IllegalAccessException;
}
