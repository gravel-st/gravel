package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.lang.invoke.MethodHandles.Lookup;

import st.gravel.support.compiler.ast.BlockInliner;
import st.gravel.support.compiler.ast.MethodMapping;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.ast.VariableNodeReplacer;
import st.gravel.support.compiler.jvm.BlockSendArgument;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;

public class LiteralBlockSendCallSite extends PolymorphicCallSite {

	private final BlockSendArgument[] astConstants;
	private final String[] copiedArgumentNames;

	public static BaseCallSite newInstance(Lookup lookup, MethodType type,
			String selector, BlockSendArgument[] astConstants,
			String[] copiedArgumentNames) {
		BaseCallSite callsite = new LiteralBlockSendCallSite(lookup, type,
				selector, astConstants, copiedArgumentNames);
		BaseCallSite.register(callsite);

		return callsite;
	}

	private LiteralBlockSendCallSite(Lookup lookup, MethodType type,
			String selector, BlockSendArgument[] astConstants,
			String[] copiedArgumentNames) {
		super(lookup, type, selector);
		this.astConstants = astConstants;
		this.copiedArgumentNames = copiedArgumentNames;
	}

	@Override
	protected MethodHandle findMethodForNil() {
		MethodNode methodNode = ImageBootstrapper.systemMapping
				.methodMappingForNil_(selector).methodNode();
		return inlineBlocks(methodNode, ImageBootstrapper.systemMapping
				.nilClassMapping().reference(), JVMDefinedObjectType.factory.object());
	}

	@Override
	protected MethodHandle findMethod(Class receiverClass) {
		MethodNode methodNode = ImageBootstrapper.systemMapping
				.methodMappingFor_methodName_(receiverClass, selector)
				.methodNode();
		return inlineBlocks(methodNode, ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(receiverClass).reference(), (JVMDefinedObjectType) ImageBootstrapper.systemMapping.compilerTools().jvmTypeForClass_(receiverClass));
	}

	private MethodHandle inlineBlocks(MethodNode methodNode,
			Reference receiverReference, JVMDefinedObjectType selfType) {
		return BlockInliner.factory
				.methodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(
						methodNode, astConstants,
						ImageBootstrapper.systemMapping, copiedArgumentNames,
						selfType , receiverReference).build();
	}

}
