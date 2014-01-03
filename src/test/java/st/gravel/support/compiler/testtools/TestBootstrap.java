package st.gravel.support.compiler.testtools;

import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class TestBootstrap {
	private static TestBootstrap singleton;

	public static TestBootstrap getSingleton() {
		if (singleton == null) {
			singleton = new TestBootstrap();
		}
		return singleton;
	}

	private TestBootstrap() {
		ImageBootstrapper.bootstrap();
	}
}
