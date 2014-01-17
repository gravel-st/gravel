package st.gravel.support.compiler.ast;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import java.math.BigInteger;
import st.gravel.support.jvm.NonLocalReturn;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.jvm.BlockSendArgument;
import st.gravel.support.compiler.ast.SystemMapping;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;
import st.gravel.support.compiler.ast.Reference;
import java.util.Map;
import st.gravel.support.compiler.ast.VariableDeclarationNode;
import st.gravel.support.compiler.ast.KeywordMethodNode;
import st.gravel.support.compiler.ast.VariableNodeReplacer;
import st.gravel.support.compiler.ast.LiteralSendInliner;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import st.gravel.support.compiler.ast.SelfNode;
import st.gravel.support.compiler.ast.SystemMappingUpdater;
import st.gravel.support.compiler.ast.BoundVariableDeclarationNode;
import st.gravel.support.compiler.ast.Node;
import st.gravel.support.compiler.ast.BlockNode;
import st.gravel.support.compiler.jvm.JVMVariable;
import st.gravel.support.compiler.ast.VariableRenamer;
import st.gravel.support.compiler.ast.HolderDeclarationNode;

public class BlockInliner extends Object implements Cloneable {

	public static BlockInliner_Factory factory = new BlockInliner_Factory();

	BlockSendArgument[] _astConstants;

	Map<String, String> _copiedArgRenames;

	String[] _copiedArgumentNames;

	MethodNode _methodNode;

	Reference _receiverReference;

	JVMDefinedObjectType _selfType;

	SystemMapping _systemMapping;

	public static class BlockInliner_Factory extends st.gravel.support.jvm.SmalltalkFactory {

		public BlockInliner basicNew() {
			BlockInliner newInstance = new BlockInliner();
			newInstance.initialize();
			return newInstance;
		}

		public BlockInliner methodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(final MethodNode _methodNode, final BlockSendArgument[] _astConstants, final SystemMapping _systemMapping, final String[] _copiedArgumentNames, final JVMDefinedObjectType _selfType, final Reference _receiverReference) {
			return this.basicNew().initializeMethodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(_methodNode, _astConstants, _systemMapping, _copiedArgumentNames, _selfType, _receiverReference);
		}
	}

	static public BlockInliner _methodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(Object receiver, final MethodNode _methodNode, final BlockSendArgument[] _astConstants, final SystemMapping _systemMapping, final String[] _copiedArgumentNames, final JVMDefinedObjectType _selfType, final Reference _receiverReference) {
		return factory.methodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(_methodNode, _astConstants, _systemMapping, _copiedArgumentNames, _selfType, _receiverReference);
	}

	public BlockSendArgument[] astConstants() {
		return _astConstants;
	}

	public java.lang.invoke.MethodHandle build() {
		final MethodNode[] _node;
		final MethodNode _inlined;
		final VariableDeclarationNode[] _arguments;
		_node = new MethodNode[1];
		_node[0] = this.link_(_methodNode);
		for (final String _each : _copiedArgumentNames) {
			final String _newTempName;
			_newTempName = BlockInliner.this.newTempName_for_(_each, _node[0]);
			_copiedArgRenames.put(_each, _newTempName);
			_node[0] = ((MethodNode) BlockInliner.this.renameVariable_from_to_(_node[0], _each, _newTempName));
		}
		_arguments = this.buildMethodNodeArguments_(_node[0]);
		_node[0] = KeywordMethodNode.factory.selector_arguments_body_(_systemMapping.selectorConverter().selectorForNumArgs_(_arguments.length), _arguments, _node[0].body());
		st.gravel.support.jvm.ArrayExtensions.with_do_(_astConstants, _methodNode.arguments(), new st.gravel.support.jvm.Block2<Object, BlockSendArgument, VariableDeclarationNode>() {

			@Override
			public Object value_value_(final BlockSendArgument _astConstant, final VariableDeclarationNode _arg) {
				if (_astConstant != null) {
					return _node[0] = ((MethodNode) VariableNodeReplacer.factory.in_replace_with_(_node[0], _arg.name(), BlockInliner.this.renamedBlockNodeFor_(_astConstant)));
				}
				return BlockInliner.this;
			}
		});
		_inlined = LiteralSendInliner.factory.inline_(_node[0]);
		return this.compileMethodNode_(_inlined);
	}

	public VariableDeclarationNode[] buildMethodNodeArguments_(final MethodNode _node) {
		final List<VariableDeclarationNode>[] _arguments;
		_arguments = new List[1];
		_arguments[0] = new java.util.ArrayList();
		st.gravel.support.jvm.ArrayExtensions.with_do_(_astConstants, _node.arguments(), new st.gravel.support.jvm.Block2<Object, BlockSendArgument, VariableDeclarationNode>() {

			@Override
			public Object value_value_(final BlockSendArgument _astConstant, final VariableDeclarationNode _arg) {
				if (_astConstant == null) {
					return _arguments[0].add(_arg);
				}
				return BlockInliner.this;
			}
		});
		for (final String _each : _copiedArgumentNames) {
			_arguments[0].add(BlockInliner.this.variableDeclarationNodeFor_(_each));
		}
		return _arguments[0].toArray(new VariableDeclarationNode[_arguments[0].size()]);
	}

	public java.lang.invoke.MethodHandle compileMethodNode_(final MethodNode _inlinedMethodNode) {
		final Class _javaClass;
		_javaClass = _systemMapping.compileInlinedMethod_selfType_(_inlinedMethodNode, _selfType);
		return _systemMapping.compilerTools().methodHandleAt_numArgs_in_identityClass_isStatic_(_systemMapping.selectorConverter().selectorAsFunctionName_(st.gravel.core.Symbol.value(_inlinedMethodNode.selector())), _inlinedMethodNode.numArgs(), _javaClass, _javaClass, true);
	}

	public BlockInliner copy() {
		try {
			BlockInliner _temp1 = (BlockInliner) this.clone();
			_temp1.postCopy();
			return _temp1;
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
	}

	public BlockInliner_Factory factory() {
		return factory;
	}

	public BlockInliner initialize() {
		_copiedArgRenames = new java.util.HashMap<String, String>();
		return this;
	}

	public BlockInliner initializeMethodNode_astConstants_systemMapping_copiedArgumentNames_selfType_receiverReference_(final MethodNode _aMethodNode, final BlockSendArgument[] _anArray, final SystemMapping _anObject, final String[] _anObject1, final JVMDefinedObjectType _anObject2, final Reference _anObject3) {
		_methodNode = _aMethodNode;
		_astConstants = _anArray;
		_systemMapping = _anObject;
		_copiedArgumentNames = _anObject1;
		_selfType = _anObject2;
		_receiverReference = _anObject3;
		this.initialize();
		return this;
	}

	public MethodNode link_(final MethodNode _aMethodNode) {
		final SelfNode _owner;
		final SystemMappingUpdater _updater;
		final BoundVariableDeclarationNode[] _instVars;
		_owner = SelfNode.factory.basicNew();
		_updater = _systemMapping.newSystemMappingUpdater();
		_instVars = _updater.allInstVarsForReference_(_receiverReference);
		return ((MethodNode) _updater.localLink_instVars_ownerReference_owner_(_aMethodNode, _instVars, _receiverReference, _owner));
	}

	public MethodNode methodNode() {
		return _methodNode;
	}

	public String newTempName_for_(final String _argName, final Node _node) {
		final LiteralSendInliner _lsi;
		_lsi = LiteralSendInliner.factory.basicNew();
		_lsi.initializeRoot_(_node);
		return _lsi.newTempName_(_argName);
	}

	public BlockInliner postCopy() {
		return this;
	}

	public BlockNode renamedBlockNodeFor_(final BlockSendArgument _astConstant) {
		final BlockNode[] _blockNode;
		_blockNode = new BlockNode[1];
		_blockNode[0] = _astConstant.blockNode();
		for (final JVMVariable _cv : _astConstant.copiedVariables()) {
			_blockNode[0] = ((BlockNode) BlockInliner.this.renameVariable_from_to_(_blockNode[0], _cv.varName(), _copiedArgRenames.get(_cv.varName())));
		}
		return _blockNode[0];
	}

	public Node renameVariable_from_to_(final Node _node, final String _oldName, final String _newName) {
		return VariableRenamer.factory.oldName_newName_(_oldName, _newName).visit_(_node);
	}

	public Node renameVariable_in_(final String _argName, final Node _node) {
		return this.renameVariable_from_to_(_node, _argName, this.newTempName_for_(_argName, _node));
	}

	public VariableDeclarationNode variableDeclarationNodeFor_(final String _varName) {
		for (final BlockSendArgument _astConstant : _astConstants) {
			if (_astConstant != null) {
				for (final JVMVariable _each : _astConstant.copiedVariables()) {
					if (st.gravel.support.jvm.StringExtensions.equals_(_each.varName(), _varName)) {
						return _each.type().isArrayType() ? HolderDeclarationNode.factory.name_(_copiedArgRenames.get(_each.varName())) : VariableDeclarationNode.factory.name_(_copiedArgRenames.get(_each.varName()));
					}
				}
			}
		}
		throw new RuntimeException("cannot find varName: " + _varName);
	}
}
