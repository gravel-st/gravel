package st.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ASMClassWriter;
import st.gravel.support.compiler.ast.AbsoluteReference;
import st.gravel.support.compiler.ast.ClassMapping;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.ast.SystemMapping;
import st.gravel.support.compiler.ast.SystemMappingCompilerTools;
import st.gravel.support.compiler.jvm.Invoke;
import st.gravel.support.compiler.jvm.Invoke.Invoke_Factory;
import st.gravel.support.compiler.jvm.InvokeInterface;
import st.gravel.support.compiler.jvm.InvokeStatic;
import st.gravel.support.compiler.jvm.InvokeStatic.InvokeStatic_Factory;
import st.gravel.support.compiler.jvm.InvokeVirtual;
import st.gravel.support.compiler.jvm.JVMArrayType;
import st.gravel.support.compiler.jvm.JVMBooleanType;
import st.gravel.support.compiler.jvm.JVMByteType;
import st.gravel.support.compiler.jvm.JVMCharType;
import st.gravel.support.compiler.jvm.JVMClass;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;
import st.gravel.support.compiler.jvm.JVMDoubleType;
import st.gravel.support.compiler.jvm.JVMFloatType;
import st.gravel.support.compiler.jvm.JVMIntType;
import st.gravel.support.compiler.jvm.JVMLongType;
import st.gravel.support.compiler.jvm.JVMMethodType;
import st.gravel.support.compiler.jvm.JVMType;
import st.gravel.support.compiler.jvm.JVMVoidType;
import st.gravel.support.jvm.ArrayExtensions;
import st.gravel.support.jvm.Block0;
import st.gravel.support.jvm.Block1;
import st.gravel.support.jvm.Block2;
import st.gravel.support.jvm.ObjectClass;

public final class JavaSystemMappingCompilerTools extends
		SystemMappingCompilerTools {

	private int classCounter = 1;
	private int nlrMarkers = 1;

	private static class CompiledClass {

		private final JVMClass jvmClass;
		private final Class<?> javaClass;

		public CompiledClass(JVMClass jvmClass, Class<?> javaClass) {
			this.jvmClass = jvmClass;
			this.javaClass = javaClass;
		}

	}

	private final HashMap<JVMDefinedObjectType, CompiledClass> jvmClasses = new HashMap<>();

	public MethodHandle bindMethodHandle_to_(MethodHandle _methodHandle,
			Object _object) {
		return _methodHandle.bindTo(_object);
	}

	@Override
	public Invoke createInvokeInstruction_name_numArgs_(
			JVMDefinedObjectType _type, String _name, int _numArgs) {
		Class<?> receiverClass;
		try {
			receiverClass = Class.forName(_type.dottedClassName());
		} catch (ClassNotFoundException e) {
			return null;
		}
		Method method = MethodTools.searchForStaticMethod(receiverClass, _name, _numArgs);
		if (method == null) {
			method = MethodTools.searchForStaticMethod(receiverClass, _name, _numArgs + 1);
		}
		if (method == null) {
			method = MethodTools.searchForMethod(receiverClass, _name, _numArgs, false);

			if (method == null) {
				return null;
			}
			if (receiverClass.isInterface()) {
				return createInvoke(InvokeInterface.factory, _type, _name, method);
			} else {
				return createInvoke(InvokeVirtual.factory, _type, _name, method);
			}

		} else {
			return createInvoke(InvokeStatic.factory, _type, _name, method);
		}
	}

	private Invoke createInvoke(Invoke_Factory invokeFactory,
			JVMDefinedObjectType _type, String _name, Method method) {
		JVMType[] arguments = ArrayExtensions.collect_(
				method.getParameterTypes(),
				new Block1<JVMType, Class<?>>() {

					@Override
					public JVMType value_(Class<?> arg1) {
						return jvmTypeForClass_(arg1);
					}
				});
		JVMMethodType _aJVMMethodType = JVMMethodType.factory
				.returnType_arguments_(
						jvmTypeForClass_(method.getReturnType()), arguments);
		return invokeFactory.ownerType_name_signature_(_type, _name,
				_aJVMMethodType);
	}

	@Override
	public Object createSingletonForClass_(Class _aJavaClass) {
		try {
			return _aJavaClass.getConstructor().newInstance();
		} catch (InstantiationException | IllegalAccessException
				| IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Object evaluateBlock0Class_(Class _aClass) {
		try {
			Object function = _aClass.getConstructor().newInstance();
			Object value = _aClass.getMethod("value").invoke(function);
			return value;
		} catch (InstantiationException | IllegalAccessException
				| IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Class findJavaClass_(Symbol[] path) {
		if ((path.length == 1) && (path[0].asString().equals("byte[]"))) return byte[].class; 
		try {
			return Class
					.forName(referenceAsClassName_(AbsoluteReference.factory
							.path_(path)));
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public SystemMappingCompilerTools initializeClass_systemMapping_(
			ClassMapping _aClassMapping, SystemMapping aSystemMapping) {

		Class identityClass = _aClassMapping.identityClass();

		if (identityClass == null)
			return this;
		try {

			Method method = identityClass.getDeclaredMethod("initialize");
			Object instance = aSystemMapping
					.singletonAtReference_(_aClassMapping.reference().nonmeta());
			final MethodHandle unreflect = MethodHandles.lookup().unreflect(
					method);
			System.out.println("Initializing " + identityClass);
			unreflect.invoke(instance);
			return this;
		} catch (NoSuchMethodException e) {
			return this;
		} catch (SecurityException | IllegalAccessException
				| IllegalArgumentException | InvocationTargetException e) {
			throw new RuntimeException(e);
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public boolean isAssignable_from_(Class _aClass, Class _bClass) {
		return _aClass != null && _bClass != null
				&& _aClass.isAssignableFrom(_bClass);
	}

	@Override
	public Class javaClassSuperclass() {
		return ObjectClass.class;
	}

	@Override
	public JVMClass jvmClassForType_ifAbsent_(
			JVMDefinedObjectType _aJVMDefinedObjectType,
			Block0<JVMClass> _aBlock) {
		return jvmClasses.get(_aJVMDefinedObjectType).jvmClass;
	}

	@Override
	public JVMType jvmTypeForClass_(Class _aClass) {
		if (_aClass.isPrimitive()) {
			if (_aClass == void.class)
				return JVMVoidType.factory.basicNew();
			if (_aClass == char.class)
				return JVMCharType.factory.basicNew();
			if (_aClass == byte.class)
				return JVMByteType.factory.basicNew();
			if (_aClass == int.class)
				return JVMIntType.factory.basicNew();
			if (_aClass == long.class)
				return JVMLongType.factory.basicNew();
			if (_aClass == boolean.class)
				return JVMBooleanType.factory.basicNew();
			if (_aClass == float.class)
				return JVMFloatType.factory.basicNew();
			if (_aClass == double.class)
				return JVMDoubleType.factory.basicNew();
			throw new RuntimeException("niy: " + _aClass);
		}
		if (_aClass.isArray()) {
			return JVMArrayType.factory.elementType_(this
					.jvmTypeForClass_(_aClass.getComponentType()));
		}
		return JVMDefinedObjectType.factory.dottedClassName_(_aClass
				.getCanonicalName());
	}

	@Override
	public MethodHandle methodHandleAt_numArgs_in_identityClass_isStatic_(
			String methodName, int baseNumArgs, Class javaClass,
			Class _identityClass, boolean isStatic) {
		int numArgs = baseNumArgs + (isStatic ? 1 : 0);
		Class[] params = new Class[numArgs];
		for (int i = 0; i < numArgs; i++) {

			params[i] = i == 0 && isStatic ? _identityClass : Object.class;
		}
		Method method = MethodTools.searchForMethod(javaClass, methodName,
				params, isStatic);
		if (method == null) {
			throw new RuntimeException("Method not found: " + methodName
					+ " in: " + javaClass);
		}
		try {
			if (isStatic) {
				return MethodHandles
						.lookup()
						.in(javaClass)
						.findStatic(javaClass, methodName,
								MethodTools.asMethodType(method));
			} else {
				return MethodHandles
						.lookup()
						.in(javaClass)
						.findVirtual(javaClass, methodName,
								MethodTools.asMethodType(method));
			}
		} catch (NoSuchMethodException | IllegalAccessException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public SystemMappingCompilerTools methodNamesIn_do_(Class javaClass,
			Block2<Object, String, Integer> block) {
		for (Method m : javaClass.getMethods()) {
			if (!Modifier.isStatic(m.getModifiers())
					&& m.getDeclaringClass() == javaClass)
				block.value_value_(m.getName(), m.getParameterTypes().length);
		}
		return this;
	}

	@Override
	public AlmostFinalValue newSingletonHolder_value_(
			AbsoluteReference _reference, Object _value) {
		AlmostFinalValue almostFinalValue = new AlmostFinalValue();
		almostFinalValue.setValue(_value);
		return almostFinalValue;
	}

	@Override
	public String nextExtensionPostfix() {
		return "Extension" + classCounter++;
	}

	@Override
	public String nextNlrMarker() {
		return "__NonLocalReturn" + nlrMarkers++;
	}

	@Override
	public String referenceAsClassName_(Reference reference) {
		if (reference.isMeta()) {
			return reference.nonmeta().toString() + "$Factory";
		}
		return reference.toString();
	}

	@Override
	public SystemMappingCompilerTools resetCallsites() {
		BaseCallSite.resetAll();
		return this;
	}

	@Override
	public Class superclassOf_(Class _aClass) {
		return _aClass.getSuperclass();
	}

	@Override
	public Object valueOfSingletonHolder_(AlmostFinalValue _holder) {
		try {
			return _holder.createGetter().invokeExact();
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Class writeClass_(JVMClass jvmClass) {
		JVMDefinedObjectType key = jvmClass.type();
		CompiledClass current = jvmClasses.get(key);
		if (current == null) {
			current = new CompiledClass(jvmClass,
					new ASMClassWriter(jvmClass).createClass());
			jvmClasses.put(key, current);
		}
		return current.javaClass;
	}
}