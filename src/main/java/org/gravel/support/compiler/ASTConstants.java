package org.gravel.support.compiler;

import java.lang.invoke.MethodType;
import java.util.HashMap;

import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.parser.BlockNode;

public class ASTConstants {
	public abstract static class ASTConstant {

		public abstract void linkIn(StClassLoader loader);

	}

	public static class LBIPreconditionConstant extends ASTConstant {

		private final LiteralBlockInlinePrecondition precondition;

		public LBIPreconditionConstant(
				LiteralBlockInlinePrecondition precondition) {
			this.precondition = precondition;
		}

		@Override
		public void linkIn(StClassLoader loader) {
		}

		public LiteralBlockInlinePrecondition precondition() {
			return precondition;
		}
	}

	public static class BoundASTBlockConstant extends ASTConstant {

		private final BlockNode blockNode;

		private final JavaVarDecl[] copiedVariables;

		public BoundASTBlockConstant(BlockNode blockNode,
				JavaVarDecl[] copiedVariables) {
			this.blockNode = blockNode;
			this.copiedVariables = copiedVariables;
		}

		public BlockNode blockNode() {
			return blockNode;
		}

		public JavaVarDecl[] copiedVariables() {
			return copiedVariables;
		}

		@Override
		public void linkIn(StClassLoader loader) {
		}
	}

	private final HashMap<String, ASTConstant> constants = new HashMap<>();

	private String addConstant(ASTConstant astConstant) {
		final String label = "_AST_" + constants.size();
		constants.put(label, astConstant);
		return label;
	}

	public ASTConstant constantAt(String key) {
		return constants.get(key);
	}

	public HashMap<String, ASTConstant> constants() {
		return constants;
	}

	public String labelForBlock(BlockNode blockNode,
			JavaVarDecl[] copiedVariables) {
		return addConstant(new BoundASTBlockConstant(blockNode,
				copiedVariables));
	}

	public String labelForLbiPrecondition(
			LiteralBlockInlinePrecondition precondition) {
		return addConstant(new LBIPreconditionConstant(precondition));
	}

}
