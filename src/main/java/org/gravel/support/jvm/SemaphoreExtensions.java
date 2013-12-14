package org.gravel.support.jvm;

import java.util.concurrent.Semaphore;

public class SemaphoreExtensions {

	public static Object newInstance(Object receiver) {
		return new Semaphore(0, true);
	}

}
