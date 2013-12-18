package org.gravel.support.jvm.runtime;

import java.lang.invoke.CallSite;
import java.lang.invoke.ConstantCallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.ast.AbsoluteReference;
import org.gravel.support.compiler.ast.Reference;


public class MethodLinker {

	public static CallSite bootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		BaseCallSite site = SmalltalkCallSite.newInstance(lookup, type,
				selector);
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