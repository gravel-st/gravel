package st.gravel.support.jvm.debugger;

import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class VMLocalTarget implements VMTarget {
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

	@Override
	public void ping() {

	}

	@Override
	public VMProcess evaluateForked(final String source) throws Throwable {
		System.out.println("local evaluateForked");
		VMLocalProcess evaluator = new VMLocalProcess(source);
		evaluator.spawn();
		System.out.println("local evaluateForked spawned");
		return evaluator;
	}

}
