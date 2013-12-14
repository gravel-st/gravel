package org.gravel.support.compiler;

import java.util.HashSet;

import org.gravel.support.parser.Expression;
import org.gravel.support.parser.MessageNode;

public abstract class LiteralBlockInlinePrecondition {

	private static class LiteralBlockInlinePreconditionDefault extends
			LiteralBlockInlinePrecondition {
		@Override
		public boolean canInline(MessageNode messageNode) {
			return hasLiteralBlockArguments(messageNode);
		}

		public LiteralBlockInlinePrecondition denySelector(String selector) {
//			HashSet<String> set = new HashSet<String>();
//			set.add(selector);
//			return new LiteralBlockInlinePreconditionWithoutSelectors(set);
			return this;
		}

	}

	private static class LiteralBlockInlinePreconditionWithoutSelectors extends
			LiteralBlockInlinePrecondition {
		private final HashSet<String> disallowedSelectors;

		public LiteralBlockInlinePreconditionWithoutSelectors(
				HashSet<String> set) {
			this.disallowedSelectors = set;
		}

		@Override
		public boolean canInline(MessageNode messageNode) {
			if ((disallowedSelectors.contains(messageNode.selector())))
				return false;
			return hasLiteralBlockArguments(messageNode);
		}

		@Override
		public LiteralBlockInlinePrecondition denySelector(String selector) {
			HashSet<String> set = new HashSet<String>(disallowedSelectors);
			set.add(selector);
			return new LiteralBlockInlinePreconditionWithoutSelectors(set);
		}
	}

	private static class LiteralBlockInlinePreconditionDeny extends
			LiteralBlockInlinePrecondition {
		@Override
		public boolean canInline(MessageNode messageNode) {
			return false;
		}

		@Override
		public LiteralBlockInlinePrecondition denySelector(String selector) {
			return this;
		}

	}

	public static LiteralBlockInlinePrecondition getDefault() {
//		return deny();
		return new LiteralBlockInlinePreconditionDefault();
	}

	public abstract boolean canInline(MessageNode messageNode);

	private static boolean hasLiteralBlockArguments(MessageNode messageNode) {
		for (Expression arg : messageNode.arguments()) {
			if (arg.isBlockNode())
				return true;
		}
		return false;
	}

	public static LiteralBlockInlinePrecondition deny() {
		return new LiteralBlockInlinePreconditionDeny();
	}

	public abstract LiteralBlockInlinePrecondition denySelector(String selector);
}
