package org.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.ASTConstants.ASTConstant;
import org.gravel.support.compiler.ASTConstants.BoundASTBlockConstant;
import org.gravel.support.compiler.ASTConstants.LBIPreconditionConstant;
import org.gravel.support.compiler.LiteralBlockInlinePrecondition;
import org.gravel.support.compiler.LiteralBlockInliner;
import org.gravel.support.jvm.StringExtensions;
import org.gravel.support.parser.MethodMapping;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.SelectorConverter;

public class LiteralBlockCallSite extends PolymorphicCallSite {

	private static final SelectorConverter selectorConverter = SelectorConverter.factory
			.basicNew();
	private ASTConstant[] parameters;
	private LiteralBlockInlinePrecondition lbiPrecondition;

	private LiteralBlockCallSite(Lookup lookup, MethodType type,
			String selector, String paramSources, String lbiPrec) {
		super(lookup, type, selector);
		loadASTConstants(lookup,
				StringExtensions.tokensBasedOn_(paramSources, ' '));
		this.lbiPrecondition = ((LBIPreconditionConstant) loadASTConstant(
				lookup, lbiPrec)).precondition();
	}

	public void loadASTConstants(Lookup lookup, final String[] params) {
		parameters = new ASTConstant[params.length];
		for (int i = 0; i < params.length; i++) {
			String param = params[i];
			parameters[i] = loadASTConstant(lookup, param);
		}
	}

	private ASTConstant loadASTConstant(Lookup lookup, String param) {
		try {
			return param.equals("nil") ? null : (ASTConstant) lookup
					.lookupClass().getDeclaredField(param)
					.get(lookup.lookupClass());
		} catch (IllegalArgumentException | IllegalAccessException
				| NoSuchFieldException | SecurityException e) {
			throw new RuntimeException(e);
		}
	}

	public static LiteralBlockCallSite newInstance(Lookup lookup,
			MethodType type, String selector, String paramSources,
			String lbiPrec) {
		LiteralBlockCallSite callsite = new LiteralBlockCallSite(lookup, type,
				selector, paramSources, lbiPrec);
		BaseCallSite.register(callsite);
		return callsite;
	}

	@Override
	protected MethodHandle findMethodForNil() {
		MethodMapping methodMapping = ImageBootstrapper.systemMapping
				.methodMappingForNil_(selector);
		return createHandle(methodMapping, null);
	}

	@Override
	protected MethodHandle findMethod(Class receiverClass) {
		MethodMapping methodMapping = ImageBootstrapper.systemMapping
				.methodMappingFor_methodName_(receiverClass, selector);
		return createHandle(methodMapping, receiverClass);
	}

	public MethodHandle createHandle(MethodMapping methodMapping,
			Class receiverClass) {
		if (methodMapping == null || !isOptimizable(methodMapping.methodNode()))
			return createNonOptimized(
					selectorConverter.functionNameAsSelector_(selector))
					.asType(type);
		return createOptimized(methodMapping, receiverClass).asType(type);
	}

	public boolean isOptimizable(MethodNode methodNode) {
		if (methodNode.primitivePragma() != null)
			return false;
		// if (methodNode.nlrMarker() != null)
		// return false;
		if (methodNode.hasSuperSend())
			return false;
		for (ASTConstant parameter : parameters) {
			final BoundASTBlockConstant boundASTBlock = (BoundASTBlockConstant) parameter;
			if (boundASTBlock != null
					&& boundASTBlock.blockNode().hasSuperSend())
				return false;
		}
		return true;
	}

	private MethodHandle createOptimized(MethodMapping methodMapping,
			Class receiverClass) {
		final LiteralBlockInliner literalBlockInliner = new LiteralBlockInliner(
				methodMapping.methodNode(), receiverClass, parameters,
				lbiPrecondition);
		return findFunctionMethod(literalBlockInliner.createOptimized());
	}

	private MethodHandle createNonOptimized(Symbol selector) {
		final int parameterCount = type.parameterCount();
		final LiteralBlockInliner literalBlockInliner = new LiteralBlockInliner(
				parameters);
		return findFunctionMethod(literalBlockInliner.createNonOptimized(
				selector, parameterCount));

	}

	private MethodHandle findFunctionMethod(Class<?> createInstanceClass) {
		try {
			Method method = null;
			for (Method m : createInstanceClass.getMethods()) {
				if (m.getName().equals("value"))
					method = m;
			}
			if (method == null) {
				throw new RuntimeException("Method not found");
			}
			return lookup.unreflect(method);
		} catch (SecurityException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

}
