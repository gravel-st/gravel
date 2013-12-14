package org.gravel.support.compiler;

import java.util.ArrayList;
import java.util.HashSet;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.ASTConstants.ASTConstant;
import org.gravel.support.compiler.ASTConstants.BoundASTBlockConstant;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.parser.BlockNode;
import org.gravel.support.parser.BoundVariableDeclarationNode;
import org.gravel.support.parser.ClassMapping;
import org.gravel.support.parser.Expression;
import org.gravel.support.parser.HolderDeclarationNode;
import org.gravel.support.parser.KeywordMessageNode;
import org.gravel.support.parser.KeywordMethodNode;
import org.gravel.support.parser.LiteralSendInliner;
import org.gravel.support.parser.LocalReadNode;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.Node;
import org.gravel.support.parser.PragmaNode;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.ReturnNode;
import org.gravel.support.parser.SelfNode;
import org.gravel.support.parser.SequenceNode;
import org.gravel.support.parser.SystemMappingUpdater;
import org.gravel.support.parser.VariableDeclarationNode;
import org.gravel.support.parser.VariableNodeReplacer;
import org.gravel.support.parser.VariableRenamer;

public class LiteralBlockInliner {

	public LiteralBlockInliner(MethodNode receiverMethodNode,
			Class receiverClass, ASTConstant[] parameters,
			LiteralBlockInlinePrecondition lbiPrecondition) {
		super();
		this.originalMethodNode = receiverMethodNode;
		this.receiverClass = receiverClass;
		this.parameters = parameters;
		this.arguments = originalMethodNode.arguments();
		this.lbiPrecondition = lbiPrecondition.denySelector(receiverMethodNode
				.selector());
	}

	public LiteralBlockInliner(ASTConstant[] parameters) {
		super();
		this.parameters = parameters;
	}

	private MethodNode originalMethodNode;
	private VariableDeclarationNode[] arguments;
	private Class receiverClass;
	private final ASTConstant[] parameters;
	private MethodNode methodNode;
	private SystemMappingUpdater updater;
	private Reference receiverReference;

	private ArrayList<VariableDeclarationNode> newMethodArgs = new ArrayList<>();
	private LiteralBlockInlinePrecondition lbiPrecondition;

	public Class<?> createOptimized() {
		methodNode = originalMethodNode;
		
		log("Receiver implementation: " + methodNode.sourceString());
		loadUpdater();

		BoundVariableDeclarationNode[] _instVars = updater
				.allInstVarsForReference_(receiverReference);

		SelfNode selfNode = SelfNode.factory.basicNew();
		methodNode = (MethodNode) updater
				.localLink_instVars_ownerReference_owner_(methodNode,
						_instVars, receiverReference, selfNode);

		newMethodArgs.add(newVDN("self", false));

		for (int i = 0; i < parameters.length; i++) {
			final BoundASTBlockConstant boundASTBlock = (BoundASTBlockConstant) parameters[i];
			VariableDeclarationNode methodArg = arguments[i];
			if (boundASTBlock == null) {
				String newTempName = newTempName(methodArg.name(), methodNode);
				methodNode = renameVariable(methodNode, methodArg.name(),
						newTempName);
				newMethodArgs.add(newVDN(newTempName,
						methodArg.isHolderDeclarationNode()));

			} else {
				BlockNode blockNode = boundASTBlock.blockNode();
				log("Literalblock implementation: " + blockNode.sourceString());
				HashSet<String> args = new HashSet<>();
				for (JavaVarDecl decl : boundASTBlock.copiedVariables()) {
					String newTempName = newTempName(decl.name(), methodNode);
					blockNode = renameVariable(blockNode, decl.name(),
							newTempName);
					args.add(newTempName);
					newMethodArgs.add(newVDN(newTempName, decl.isHolder()));
				}
				methodNode = (MethodNode) VariableNodeReplacer.factory
						.in_replace_with_(methodNode, methodArg.name(),
								blockNode);
			}
		}
		MethodNode inlined = (MethodNode) LiteralSendInliner.factory
				.inline_(methodNode);
		VariableDeclarationNode[] argsArray = newMethodArgs
				.toArray(new VariableDeclarationNode[newMethodArgs.size()]);

		MethodNode newMethodNode = newMethodNode(argsArray, inlined.body())
				.withNlrMarker_(methodNode.nlrMarker());
		MethodNode linked = (MethodNode) updater
				.localLink_instVars_ownerReference_owner_(newMethodNode,
						_instVars, receiverReference, selfNode);
		log("Merged implementation: " + linked.sourceString());

		return createFunctionClass(linked, lbiPrecondition);
	}

	private String newTempName(String name, MethodNode node) {
		LiteralSendInliner lsi = LiteralSendInliner.factory.basicNew();
		lsi.initializeRoot_(node);
		return lsi.newTempName_(name);
	}

	private void log(String string) {
//		 System.out.println(string);
	}

	@SuppressWarnings("unchecked")
	private <X extends Node> X renameVariable(X node, final String oldName,
			final String newName) {
		return (X) VariableRenamer.factory.oldName_newName_(oldName, newName)
				.visit_(node);
	}

	private void loadUpdater() {
		updater = SystemMappingUpdater.factory.systemMapping_compilerTools_(
				ImageBootstrapper.systemMapping,
				ImageBootstrapper.systemMapping.compilerTools());
		ClassMapping receiverClassMapping = ImageBootstrapper.systemMapping
				.classMappingAtJavaClass_ifAbsent_(receiverClass, null);
		receiverReference = receiverClassMapping.reference();
	}

	public VariableDeclarationNode newVDN(String name, boolean isHolder) {
		return isHolder ? HolderDeclarationNode.factory.name_(name) :

		VariableDeclarationNode.factory.name_(name);
	}

	public MethodNode newMethodNode(VariableDeclarationNode[] parameters,
			SequenceNode body) {
		return KeywordMethodNode.factory
				.selector_arguments_body_returnType_pragmas_protocol_(Symbol
						.forNumArgs(parameters.length).asString(), parameters,
						body, null, new PragmaNode[0], null);
	}

	private Class<?> createFunctionClass(MethodNode methodNode,
			LiteralBlockInlinePrecondition lbiPrecondition) {
		return new BytecodeFunctionGenerator(methodNode, lbiPrecondition, receiverReference)
				.createInstanceClass();
	}

	public Class<?> createNonOptimized(Symbol selector, int parameterCount) {
		VariableDeclarationNode[] blockParameters = new VariableDeclarationNode[parameterCount];
		Expression[] arguments = new Expression[selector.numArgs()];
		int argCount = 0;
		blockParameters[0] = VariableDeclarationNode.factory.name_("receiver");
		int blockParamCount = 1;
		for (ASTConstant constant : parameters) {
			if (constant == null) {
				String argName = "__arg" + blockParamCount;
				blockParameters[blockParamCount] = newVDN(argName, false);
				blockParamCount++;
				arguments[argCount] = LocalReadNode.factory.name_(argName);
				argCount++;
			} else {
				final BoundASTBlockConstant boundASTBlock = (BoundASTBlockConstant) constant;
				for (JavaVarDecl copiedVar : boundASTBlock.copiedVariables()) {
					blockParameters[blockParamCount] = newVDN(copiedVar.name(),
							copiedVar.isHolder());
					blockParamCount++;
				}
				arguments[argCount] = boundASTBlock.blockNode();
				argCount++;
			}
		}

		SequenceNode body = SequenceNode.factory.statement_(ReturnNode.factory
				.value_(KeywordMessageNode.factory
						.receiver_selector_arguments_(
								LocalReadNode.factory.name_("receiver"),
								selector.asString(), arguments)));
		methodNode = newMethodNode(blockParameters, body);
		return createFunctionClass(methodNode,
				LiteralBlockInlinePrecondition.deny());
	}

}
