package org.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.ASMClassWriter;
import org.gravel.support.compiler.ast.AbsoluteReference;
import org.gravel.support.compiler.ast.ClassMapping;
import org.gravel.support.compiler.ast.Reference;
import org.gravel.support.compiler.ast.SystemMapping;
import org.gravel.support.compiler.ast.SystemMappingCompilerTools;
import org.gravel.support.compiler.jvm.Invoke;
import org.gravel.support.compiler.jvm.InvokeInterface;
import org.gravel.support.compiler.jvm.InvokeStatic;
import org.gravel.support.compiler.jvm.InvokeVirtual;
import org.gravel.support.compiler.jvm.JVMArrayType;
import org.gravel.support.compiler.jvm.JVMBooleanType;
import org.gravel.support.compiler.jvm.JVMByteType;
import org.gravel.support.compiler.jvm.JVMCharType;
import org.gravel.support.compiler.jvm.JVMClass;
import org.gravel.support.compiler.jvm.JVMDefinedObjectType;
import org.gravel.support.compiler.jvm.JVMIntType;
import org.gravel.support.compiler.jvm.JVMLongType;
import org.gravel.support.compiler.jvm.JVMMethodType;
import org.gravel.support.compiler.jvm.JVMType;
import org.gravel.support.compiler.jvm.JVMVoidType;
import org.gravel.support.jvm.ArrayExtensions;
import org.gravel.support.jvm.Block0;
import org.gravel.support.jvm.Block1;
import org.gravel.support.jvm.ObjectClass;

public final class JavaSystemMappingCompilerTools extends
		SystemMappingCompilerTools {

	private int classCounter = 1;
	private int nlrMarkers = 1;

	@Override
	public Class findJavaClass_(Symbol[] path) {
		try {
			return Class
					.forName(referenceAsClassName_(AbsoluteReference.factory
							.path_(path)));
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
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
	public String referenceAsClassName_(Reference reference) {
		if (reference.isMeta()) {
			return reference.nonmeta().toString() + "$Factory";
		}
		return reference.toString();
	}

	@Override
	public SystemMappingCompilerTools linkInNamespace_systemMapping_(
			ClassMapping classMapping, SystemMapping systemMapping) {
		if (!classMapping.classNode().isMeta())
			return this;
		final Class identityClass = classMapping.identityClass();
		systemMapping.singletonAtReference_ifAbsentPut_(classMapping
				.reference().nonmeta(), new Block0<Object>() {

			@Override
			public Object value() {
				return createSingletonForClass(identityClass);
			}
		});
		return this;
	}

	public Object createSingletonForClass(Class identityClass) {
		try {
			return identityClass.getConstructor().newInstance();
		} catch (InstantiationException | IllegalAccessException
				| IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Class javaClassSuperclass() {
		return ObjectClass.class;
	}

	@Override
	public Class superclassOf_(Class _aClass) {
		return _aClass.getSuperclass();
	}

	@Override
	public SystemMappingCompilerTools methodNamesIn_do_(Class javaClass,
			Block1<Object, String> block) {
		for (Method m : javaClass.getMethods()) {
			if (!Modifier.isStatic(m.getModifiers())
					&& m.getDeclaringClass() == javaClass)
				block.value_(m.getName());
		}
		return this;
	}

	@Override
	public boolean isAssignable_from_(Class _aClass, Class _bClass) {
		return _aClass != null && _bClass != null
				&& _aClass.isAssignableFrom(_bClass);
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
			unreflect.invoke(instance);
			System.out.println("Initializing " + identityClass);
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

	public MethodHandle bindMethodHandle_to_(MethodHandle _methodHandle,
			Object _object) {
		return _methodHandle.bindTo(_object);
	}

	@Override
	public SystemMappingCompilerTools resetCallsites() {
		BaseCallSite.resetAll();
		return this;
	}

	@Override
	public String nextNlrMarker() {
		return "__NonLocalReturn" + nlrMarkers++;
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
	public AlmostFinalValue newSingletonHolder_value_(
			AbsoluteReference _reference, Object _value) {
		AlmostFinalValue almostFinalValue = new AlmostFinalValue();
		almostFinalValue.setValue(_value);
		return almostFinalValue;
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
	public String nextExtensionPostfix() {
		return "Extension" + classCounter++;
	}

	@Override
	public Class writeClass_(JVMClass jvmClass) {
		return new ASMClassWriter(jvmClass).createClass();
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
	public Invoke createInvokeInstruction_name_numArgs_(
			JVMDefinedObjectType _type, String _name, int _numArgs) {
		Class<?> receiverClass;
		try {
			receiverClass = Class.forName(_type.dottedClassName());
		} catch (ClassNotFoundException e) {
			return null;
		}
		Method method = MethodTools.searchForMethod(receiverClass, _name,
				_numArgs + 1, true);
		if (method == null) {
			method = MethodTools.searchForMethod(receiverClass, _name,
					_numArgs, false);

			if (method == null) {
				return null;
			}
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
			if (receiverClass.isInterface()) {
				return InvokeInterface.factory.ownerType_name_signature_(_type,
						_name, _aJVMMethodType);
			} else {
				return InvokeVirtual.factory.ownerType_name_signature_(_type,
						_name, _aJVMMethodType);
			}

		} else {
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
			return InvokeStatic.factory.ownerType_name_signature_(_type, _name,
					_aJVMMethodType);
		}
	}
}