package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;

import st.gravel.support.compiler.ast.BlockInliner;
import st.gravel.support.compiler.ast.MethodMapping;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.Node;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.jvm.BlockSendArgument;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;
import st.gravel.support.compiler.jvm.JVMNonPrimitiveType;
import st.gravel.support.jvm.Block1;

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
		MethodMapping methodMapping = ImageBootstrapper.systemMapping
				.methodMappingForNil_(selector);
		if (methodMapping == null) {
			return createDNUHandleForNil();
		}
		MethodNode methodNode = methodMapping.methodNode();
		return inlineBlocks(methodNode, ImageBootstrapper.systemMapping
				.nilClassMapping().reference(), JVMDefinedObjectType.factory.object());
	}

	@Override
	protected MethodHandle findMethod(Class receiverClass) {
		MethodMapping methodMapping = ImageBootstrapper.systemMapping
				.methodMappingFor_methodName_(receiverClass, selector);
		if (methodMapping == null) {
			return createDNUHandle(receiverClass).asType(type);
		}
		MethodNode methodNode = methodMapping
				.methodNode();
		return inlineBlocks(methodNode, ImageBootstrapper.systemMapping
				.classMappingForJavaClass_(receiverClass).reference(), (JVMNonPrimitiveType) ImageBootstrapper.systemMapping.compilerTools().jvmTypeForClass_(receiverClass));
	}

	private MethodHandle createDNUHandleForNil() {
		throw new RuntimeException("niy");
	}

	private MethodHandle createDNUHandle(Class receiverClass) {
		throw new RuntimeException("niy");
	}

	private MethodHandle inlineBlocks(MethodNode methodNode,
			Reference receiverReference, JVMNonPrimitiveType selfType) {
		BlockInliner blockInliner = BlockInliner.factory
				.methodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(
						methodNode, astConstants,
						ImageBootstrapper.systemMapping, copiedArgumentNames,
						selfType , receiverReference);
		if (!isOptimizable(methodNode)) {
			return blockInliner.buildNonOptimized();
		}
		return blockInliner.build();
	}

	private boolean isOptimizable(MethodNode methodNode) {
		Block1<Boolean, Node> _aBlock = new Block1<Boolean, Node>() {
			
			@Override
			public Boolean value_(Node arg1) {
				return arg1.isSuperNode();
			}
		};
		return !(methodNode.allNodesContains_(_aBlock ));
	}

}
