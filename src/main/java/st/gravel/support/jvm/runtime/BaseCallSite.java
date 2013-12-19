package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;
import java.lang.invoke.MutableCallSite;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.SelectorConverter;

public abstract class BaseCallSite extends MutableCallSite {

	private static final SelectorConverter selectorConverter = SelectorConverter.factory
			.basicNew();

	protected BaseCallSite(Lookup lookup, MethodType type, String selector) {
		super(type);
		this.selector = selector;
		this.lookup = lookup;
		this.type = type;
		this.fallback = getFallbackMethod();
		reset();
	}

	protected final String selector;
	protected final MethodHandles.Lookup lookup;
	protected final MethodType type;

	public MethodHandle wrapDNUHandle(MethodHandle dnuHandle) {
		Symbol sym = selectorConverter.functionNameAsSelector_(selector);
		MethodHandle withBoundSymbol = MethodHandles.insertArguments(dnuHandle,
				1, sym);
		MethodHandle message = withBoundSymbol.asCollector(Object[].class,
				numArgs());
		return message;
	}

	int numArgs() {
		return type.parameterCount() - 1;
	}

	private static final Set<BaseCallSite> callsites = Collections
			.newSetFromMap(new WeakHashMap<BaseCallSite, Boolean>());

	public synchronized static void register(BaseCallSite callsite) {
		callsites.add(callsite);
	}

	protected final MethodHandle fallback;

	public synchronized static void resetAll() {
		for (BaseCallSite callsite : callsites) {
			callsite.reset();
		}
		 MutableCallSite.syncAll(callsites.toArray(new MutableCallSite[callsites.size()]));
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver)
			throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3, Object arg4)
			throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3, arg4);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3, Object arg4, Object arg5)
			throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3, arg4, arg5);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3, Object arg4, Object arg5,
			Object arg6) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3, arg4, arg5,
				arg6);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3, Object arg4, Object arg5,
			Object arg6, Object arg7) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3, arg4, arg5,
				arg6, arg7);
	}

	public static Object invocationFallback(BaseCallSite site, Object receiver,
			Object arg1, Object arg2, Object arg3, Object arg4, Object arg5,
			Object arg6, Object arg7, Object arg8) throws Throwable {
		site.addTargetToCache(receiver);
		return site.getTarget().invoke(receiver, arg1, arg2, arg3, arg4, arg5,
				arg6, arg7, arg8);
	}

	private void reset() {
		resetCache();
		setTarget(fallback);
	}

	protected abstract void resetCache();

	private MethodHandle getFallbackMethod() {
		try {
			final MethodType fallbackType = MethodType.genericMethodType(
					type.parameterCount()).insertParameterTypes(0,
					BaseCallSite.class);
			final MethodHandle fallbackHandle = MethodHandles.insertArguments(
					MethodHandles.lookup().findStatic(BaseCallSite.class,
							"invocationFallback", fallbackType), 0, this);
			return fallbackHandle.asType(type);
		} catch (NoSuchMethodException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

	protected abstract void addTargetToCache(Object receiver);
}
