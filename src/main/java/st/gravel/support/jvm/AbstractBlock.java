package st.gravel.support.jvm;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public abstract class AbstractBlock<R> {

	@SuppressWarnings("unchecked")
	public Class<R> getResultClass() {
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
		    ParameterizedType parameterizedType = (ParameterizedType) type;
		    Type[] typeArguments = parameterizedType.getActualTypeArguments();
		    return (Class<R>) typeArguments[0];
		}
		throw new RuntimeException("Could not detemine returntype");
	}

}
