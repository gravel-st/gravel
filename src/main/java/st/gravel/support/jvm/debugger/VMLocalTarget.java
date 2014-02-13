package st.gravel.support.jvm.debugger;

import st.gravel.support.compiler.ast.AbsoluteReference;
import st.gravel.support.compiler.ast.Expression;
import st.gravel.support.compiler.ast.Parser;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class VMLocalTarget {
	private final class StEvaluator extends Promise {
		private final String source;

		private StEvaluator(String source) {
			this.source = source;
		}

		@Override
		public Object evaluate() {
			System.out.println("evaluate started");
			AbsoluteReference _reference = AbsoluteReference.factory
					.object();
			Expression expression = Parser.factory.parseExpression_(source);
			Object value = ImageBootstrapper.systemMapping
					.evaluateExpression_reference_(expression, _reference);
			System.out.println("evaluate done");
			return value;
		}
	}

	public static void main(String[] args) {
		System.out.println("VMTarget Started");
		ImageBootstrapper.bootstrap();
		new VMLocalTarget().haltPoint();
		System.out.println("VMTarget post haltPoint; terminating");
	}

	private void haltPoint() {
	}

	public int add(int x, int y) {
		return x + y;
	}

	public void ping() {

	}

	public Promise evaluateForked(final String source) throws Throwable {
		System.out.println("local evaluateForked");
		Promise promise = new StEvaluator(source);
		return promise;
	}

}
