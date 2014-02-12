package st.gravel.support.jvm.debugger;

public class VMTargetLocal implements VMTarget {
	public static void main(String[] args) {
		System.out.println("VMTarget Started");
		sleep(100);
		new VMTargetLocal().haltPoint();
		System.out.println("VMTarget post haltPoint; terminating");
	}

	private static void sleep(int millis) {
		try {
			Thread.sleep(millis);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}

	private void haltPoint() {
	}
	
	public int add(int x, int y) {
		return x+y;
	}

	@Override
	public void ping() {
		
	}
}
