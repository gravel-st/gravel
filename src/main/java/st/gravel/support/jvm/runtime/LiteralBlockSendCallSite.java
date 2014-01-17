package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.lang.invoke.MethodHandles.Lookup;

import st.gravel.support.compiler.ast.BlockInliner;
import st.gravel.support.compiler.ast.MethodMapping;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.VariableNodeReplacer;
import st.gravel.support.compiler.jvm.BlockSendArgument;

public class LiteralBlockSendCallSite extends PolymorphicCallSite {

	private final BlockSendArgument[] astConstants;

	public static BaseCallSite newInstance(Lookup lookup, MethodType type,
			String selector, BlockSendArgument[] astConstants) {
		BaseCallSite callsite = new LiteralBlockSendCallSite(lookup, type,
				selector, astConstants);
		BaseCallSite.register(callsite);

		return callsite;
	}

	private LiteralBlockSendCallSite(Lookup lookup, MethodType type,
			String selector, BlockSendArgument[] astConstants) {
		super(lookup, type, selector);
		this.astConstants = astConstants;
	}

	@Override
	protected MethodHandle findMethodForNil() {
		MethodNode methodNode = ImageBootstrapper.systemMapping
				.methodMappingForNil_(selector).methodNode();
		return inlineBlocks(methodNode);
	}

	@Override
	protected MethodHandle findMethod(Class receiverClass) {
		MethodNode methodNode = ImageBootstrapper.systemMapping
				.methodMappingFor_methodName_(receiverClass, selector).methodNode();
		return inlineBlocks(methodNode);
	}

	private MethodHandle inlineBlocks(MethodNode methodNode) {
		return BlockInliner.factory.methodNode_astConstants_(methodNode, astConstants).build();
	}

}
