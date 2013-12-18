package org.gravel.core;

import java.lang.reflect.Array;

import org.gravel.support.jvm.Block1;

public class Interval {

	private final int start;
	private final int stop;

	public Interval(int start, int stop) {
		this.start = start;
		this.stop = stop;
	}

	@SuppressWarnings("unchecked")
	public <R> R[] collect_(Block1<R, Integer> aBlock) {
		R[] result = (R[]) Array.newInstance(aBlock.getResultClass(),
				(stop - start) + 1);
		for (int i = start; i <= stop; i++) {
			result[i - 1] = aBlock.value_((Integer) i);
		}
		return result;
	}

	public String join_(Block1<String, Integer> aBlock) {
		StringBuilder str = new StringBuilder();
		for (int i = start; i <= stop; i++) {
			str.append(aBlock.value_((Integer) i));
		}
		return str.toString();
	}

}
