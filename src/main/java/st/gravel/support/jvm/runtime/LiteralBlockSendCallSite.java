package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.lang.invoke.MethodHandles.Lookup;

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
		throw new RuntimeException("niy");
	}

	@Override
	protected MethodHandle findMethod(Class receiverClass) {
		throw new RuntimeException("niy");
	}

}
