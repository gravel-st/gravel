package org.gravel.support.jvm;

public class ProcessExtensions {
	public static Thread forBlock_(Object receiver, final Block0<Object> block) {
		Thread thread = new Thread(new Runnable() {

			@Override
			public void run() {
				block.value();
			}
		});
		return thread;
	}

}
