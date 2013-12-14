package org.gravel.support.jvm.runtime;

import java.lang.invoke.CallSite;
import java.lang.invoke.ConstantCallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;
import java.lang.invoke.SwitchPoint;

import org.gravel.core.Symbol;
import org.gravel.support.parser.AbsoluteReference;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.SingletonHolder;

public class MethodLinker {

	public static CallSite bootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		BaseCallSite site = SmalltalkCallSite.newInstance(lookup, type,
				selector);
		return site;
	}

	public static CallSite blockBootstrap(Lookup lookup, String selector,
			MethodType type, String paramSources, String lbiPrec)
			throws Throwable {
		LiteralBlockCallSite site = LiteralBlockCallSite.newInstance(lookup,
				type, selector, paramSources, lbiPrec);
		return site;
	}

	public static CallSite superBootstrap(Lookup lookup, String selector,
			MethodType type, String lookupStart) throws Throwable {
		SuperCallSite site = SuperCallSite.newInstance(type, lookupStart,
				selector, lookup);
		return site;
	}

	public static CallSite fieldReadBootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		FieldReadCallSite site = FieldReadCallSite.newInstance(lookup, type,
				selector);
		return site;
	}

	public static CallSite fieldWriteBootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		FieldWriteCallSite site = FieldWriteCallSite.newInstance(lookup, type,
				selector);
		return site;
	}

	public static CallSite globalReadBootstrap(Lookup lookup, String selector,
			MethodType type, String namespaceString) throws Throwable {
		AbsoluteReference namespace = (AbsoluteReference) Reference.factory
				.value_(namespaceString);
		AbsoluteReference fullReference = namespace.$slash$(Symbol
				.value(selector));
		final AlmostFinalValue singletonHolder = ImageBootstrapper.systemMapping
				.resolveSingletonHolder_(fullReference);
		return new ConstantCallSite(singletonHolder.createGetter());
	}

	public static CallSite globalWriteBootstrap(Lookup lookup, String selector,
			MethodType type, String namespaceString) throws Throwable {
		AbsoluteReference namespace = (AbsoluteReference) Reference.factory
				.value_(namespaceString);
		AbsoluteReference fullReference = namespace.$slash$(Symbol
				.value(selector));
		final AlmostFinalValue singletonHolder = ImageBootstrapper.systemMapping
				.resolveSingletonHolder_(fullReference);
		final MethodHandle target = lookup.findVirtual(
				AlmostFinalValue.class,
				"setValue",
				MethodType.methodType(Object.class, Object.class)).bindTo(singletonHolder);
		return new ConstantCallSite(target);
	}

}