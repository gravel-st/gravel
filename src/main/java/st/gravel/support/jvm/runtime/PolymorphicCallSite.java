package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

import st.gravel.support.jvm.ArrayExtensions;

public abstract class PolymorphicCallSite extends BaseCallSite {

	private static final MethodHandle TYPE_TEST_METHOD_HANDLE = getTypeTestMethodHandle();
	private static final MethodHandle NIL_TEST_METHOD_HANDLE = getNilTestMethodHandle();

	public static boolean typeTest(Object receiver,
			Class testClass) {
		return receiver != null && receiver.getClass() == testClass;
	}

	public static boolean nilTest(Object receiver) {
		return receiver == null;
	}

	protected static MethodHandle getTypeTestMethodHandle() {
		try {
			return MethodHandles.lookup().findStatic(
					PolymorphicCallSite.class,
					"typeTest",
					MethodType.methodType(boolean.class, Object.class,
							Class.class));
		} catch (NoSuchMethodException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

	protected static MethodHandle getNilTestMethodHandle() {
		try {
			return MethodHandles.lookup()
					.findStatic(
							PolymorphicCallSite.class,
							"nilTest",
							MethodType.methodType(boolean.class, Object.class));
		} catch (NoSuchMethodException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

	protected CacheEntry[] cache;

	public static class CacheEntry {
		public CacheEntry(Class<? extends Object> receiverClass,
				MethodHandle methodHandle) {
			super();
			this.receiverClass = receiverClass;
			this.methodHandle = methodHandle;
		}

		public final Class<? extends Object> receiverClass;
		public final MethodHandle methodHandle;
	}

	public PolymorphicCallSite(Lookup lookup, MethodType type, String selector) {
		super(lookup, type, selector);
	}

	@Override
	protected synchronized void resetCache() {
		this.cache = new CacheEntry[0];
	}

	private MethodHandle lookupMethodForNil() {
		MethodHandle castHandle = findMethodForNil();
		addCacheEntry(null, castHandle);
		return castHandle;
	}

	private MethodHandle lookupMethod(final Class receiverClass) {
		MethodHandle castHandle = findMethod(receiverClass);
		addCacheEntry(receiverClass, castHandle);
		return castHandle;
	}

	protected abstract MethodHandle findMethodForNil();

	protected abstract MethodHandle findMethod(Class receiverClass);

	@Override
	protected synchronized void addTargetToCache(Object receiver) {
		if (receiver == null) {
			if (cacheIncludesReceiverClass(null))
				return;
			lookupMethodForNil();
		} else {
			Class<? extends Object> receiverClass = receiver.getClass();
			if (cacheIncludesReceiverClass(receiverClass))
				return;
			lookupMethod(receiverClass);
		}
		setTargetFromCache();
	}

	private boolean cacheIncludesReceiverClass(
			Class<? extends Object> receiverClass) {
		for (CacheEntry entry : cache) {
			if (entry.receiverClass == receiverClass)
				return true;
		}
		return false;
	}

	private MethodHandle getGuardedMethod(CacheEntry entry,
			MethodHandle fallback) {
		MethodHandle test = entry.receiverClass == null ? NIL_TEST_METHOD_HANDLE
				 : MethodHandles.insertArguments(
				TYPE_TEST_METHOD_HANDLE, 1, entry.receiverClass);
		Class[] tail = ArrayExtensions.tail(type.parameterArray());
		test = MethodHandles.dropArguments(test, 1, tail);
		test = test.asType(MethodType.methodType(Boolean.TYPE,
				type.parameterArray()));
		MethodHandle guard1 = MethodHandles.guardWithTest(test,
				entry.methodHandle, fallback);
		return guard1;
	}

	private void addCacheEntry(final Class receiverClass,
			MethodHandle castHandle) {
//		if (cache.length == 0 && receiverClass != null) {
//			cache = ArrayExtensions.copyWith_(cache, new CacheEntry(null,
//					findMethodForNil()));
//		}
		cache = ArrayExtensions.copyWith_(cache, new CacheEntry(receiverClass,
				castHandle));
	}

	private void setTargetFromCache() {
		MethodHandle sum = fallback;
		for (int i = cache.length - 1; i >= 0; i--) {
			CacheEntry entry = cache[i];
			sum = getGuardedMethod(entry, sum);
		}
		setTarget(sum);
	}
	
}