package st.gravel.support.jvm;

import java.util.Collection;
import java.util.Enumeration;

public class CollectionExtensions {
	public static Boolean isEmpty(Collection receiver) {
		return receiver.isEmpty();
	}

	public static Integer size(Collection receiver) {
		return receiver.size();
	}
	public static Object add_(Collection receiver, Object element) {
		receiver.add(element);
		return element;
	}
	
	public static Object do_(Collection receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (Object element: receiver) {
			bl.value_(element);
		}
		return receiver;
	}
	public static Object enumerationDo_(Enumeration receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		while(receiver.hasMoreElements()) {
			bl.value_(receiver.nextElement());
		}
		return receiver;
	}
}
