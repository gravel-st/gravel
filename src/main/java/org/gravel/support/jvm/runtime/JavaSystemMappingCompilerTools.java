package org.gravel.support.jvm.runtime;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;

import org.gravel.core.Symbol;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaType;
import org.gravel.support.compiler.BytecodeBlockGenerator.JavaVarDecl;
import org.gravel.support.compiler.BytecodeClassGenerator;
import org.gravel.support.compiler.BytecodeFunctionGenerator;
import org.gravel.support.compiler.LiteralBlockInlinePrecondition;
import org.gravel.support.compiler.SourceIndex;
import org.gravel.support.jvm.ArrayExtensions;
import org.gravel.support.jvm.Block0;
import org.gravel.support.jvm.Block1;
import org.gravel.support.jvm.ObjectClass;
import org.gravel.support.parser.AbsoluteReference;
import org.gravel.support.parser.BoundVariableDeclarationNode;
import org.gravel.support.parser.ClassMapping;
import org.gravel.support.parser.Expression;
import org.gravel.support.parser.MethodNode;
import org.gravel.support.parser.NilLiteralNode;
import org.gravel.support.parser.Node;
import org.gravel.support.parser.PragmaNode;
import org.gravel.support.parser.Reference;
import org.gravel.support.parser.ReturnNode;
import org.gravel.support.parser.SequenceNode;
import org.gravel.support.parser.SourceFile;
import org.gravel.support.parser.SystemMapping;
import org.gravel.support.parser.SystemMappingCompilerTools;
import org.gravel.support.parser.UnaryMethodNode;
import org.gravel.support.parser.VariableAccessToFieldAccessConverter;

final class JavaSystemMappingCompilerTools extends SystemMappingCompilerTools {

	private int classCounter = 1;
	private int nlrMarkers = 1;

	@Override
	public Class compileExtensionJavaClass_prefix_methods_identityClass_instVars_allInstVars_instVarOwners_sourceFile_(
			Reference _reference, String _namePrefix, MethodNode[] _methods,
			Class _identityClass, BoundVariableDeclarationNode[] _instVars,
			BoundVariableDeclarationNode[] _allInstVars,
			Map<Reference, Class> _instVarOwners, SourceFile _sourceFile) {

		final String dottedName = _namePrefix + "$ExtensionClass"
				+ (classCounter++);
		JavaType identityType = _identityClass == null ? JavaType
				.fromDotted(dottedName) : JavaType.getType(_identityClass);
		JavaVarDecl[] instVars = nodesToDecls(_instVars, _instVarOwners,
				identityType);
		JavaVarDecl[] allInstVars = nodesToDecls(_allInstVars, _instVarOwners,
				identityType);
		Class javaClass = new BytecodeClassGenerator(_reference, dottedName,
				identityType, _methods, true, instVars, Object.class,
				getSourceIndex(_sourceFile)).createInstanceClass();
		return javaClass;
	}

	@Override
	public Class compileJavaClass_name_superclass_methods_instVars_allInstVars_instVarOwners_sourceFile_(
			Reference _reference, String _aName, Class _aJavaClass,
			MethodNode[] _methods, BoundVariableDeclarationNode[] _instVars,
			BoundVariableDeclarationNode[] _allInstVars,
			Map<Reference, Class> _instVarOwners, SourceFile _sourceFile) {

		final JavaType identityType = JavaType.fromDotted(_aName);
		JavaVarDecl[] instVars = nodesToDecls(_instVars, _instVarOwners,
				identityType);
		JavaVarDecl[] allInstVars = nodesToDecls(_allInstVars, _instVarOwners,
				identityType);
		return new BytecodeClassGenerator(_reference, _aName, identityType,
				_methods, false, instVars, _aJavaClass,
				getSourceIndex(_sourceFile)).createInstanceClass();
	}

	public JavaVarDecl[] nodesToDecls(BoundVariableDeclarationNode[] _instVars,
			final Map<Reference, Class> _instVarOwners,
			final JavaType identityType) {
		if (identityType == null) {
			throw new RuntimeException();
		}
		return ArrayExtensions.collect_(_instVars,
				new Block1<JavaVarDecl, BoundVariableDeclarationNode>() {

					@Override
					public JavaVarDecl value_(BoundVariableDeclarationNode node) {
						Class ownerClass = _instVarOwners.get(node.ownerType());
						JavaType ownerType;
						if (ownerClass == null) {
							ownerType = identityType;
						} else {
							ownerType = identityType;

							// JavaType.getType(ownerClass);
						}
						return new JavaVarDecl(node.name(), JavaType
								.getType(Object.class), ownerType);
					}
				});
	}

	private SourceIndex getSourceIndex(SourceFile sourceFile) {
		if (sourceFile == null)
			return null;
		return new SourceIndex(sourceFile);
	}

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
			MethodHandles.lookup().unreflect(method).invoke(instance);
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

	@Override
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
	public Object evaluateExpression_reference_(Expression _expression, AbsoluteReference reference) {
		if (_expression == null) return null;
		PragmaNode[] _anArray = new PragmaNode[0];
		String[] _instVarNames = new String[0];
		Expression owner = NilLiteralNode.factory.basicNew();
		UnaryMethodNode method = UnaryMethodNode.factory.returnExpression_(_expression);
		UnaryMethodNode linked = (UnaryMethodNode) VariableAccessToFieldAccessConverter.factory
				.instVarNames_owner_ownerReference_(_instVarNames, owner,
						reference).visit_(method);
		BytecodeFunctionGenerator bytecodeFunctionGenerator = new BytecodeFunctionGenerator(
				linked, LiteralBlockInlinePrecondition
						.deny(), reference);
		Class<?> createInstanceClass = bytecodeFunctionGenerator
				.createInstanceClass();
		try {
			Object function = createInstanceClass.getConstructor()
					.newInstance();
			Object value = createInstanceClass.getMethod("value").invoke(
					function);
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
}