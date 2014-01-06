package st.gravel.support.compiler.ast;

/*
	This file is automatically generated from typed smalltalk source. Do not edit by hand.
	(C) AG5.com
*/

import java.math.BigInteger;
import st.gravel.support.jvm.NonLocalReturn;
import st.gravel.support.compiler.ast.AbstractMapping;
import st.gravel.support.compiler.ast.AbstractMapping.AbstractMapping_Factory;
import st.gravel.support.compiler.ast.SystemNode;
import st.gravel.support.compiler.ast.SystemMappingCompilerTools;
import java.util.Map;
import st.gravel.support.compiler.ast.ClassMapping;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.ast.AbsoluteReference;
import st.gravel.support.compiler.ast.SelectorConverter;
import st.gravel.support.compiler.ast.SystemDefinitionNode;
import st.gravel.support.compiler.ast.SystemDiff;
import st.gravel.support.compiler.ast.SystemMappingUpdater;
import st.gravel.support.compiler.ast.ClassDiff;
import st.gravel.support.compiler.ast.SharedDeclarationNode;
import st.gravel.support.compiler.ast.Node;
import st.gravel.support.compiler.jvm.JVMClass;
import st.gravel.support.compiler.jvm.JVMDefinedObjectType;
import st.gravel.support.compiler.ast.BlockNode;
import st.gravel.support.compiler.jvm.BlockInnerClass;
import st.gravel.support.compiler.jvm.JVMClassCompiler;
import st.gravel.support.compiler.ast.IntermediateNodeRewriter;
import st.gravel.support.compiler.ast.NonLocalTempWritesToHolderConverter;
import st.gravel.support.compiler.ast.VariableAccessToFieldAccessConverter;
import st.gravel.support.compiler.ast.NilLiteralNode;
import st.gravel.support.compiler.jvm.JVMVariable;
import st.gravel.support.compiler.ast.Parser;
import st.gravel.support.compiler.ast.ClassDescriptionNode;
import st.gravel.support.compiler.ast.ClassNode;
import st.gravel.support.compiler.ast.Expression;
import java.util.HashMap;
import java.util.Date;
import st.gravel.support.compiler.ast.AbstractMethodMapping;
import st.gravel.support.compiler.ast.MethodMapping;
import st.gravel.support.compiler.ast.NamespaceNode;
import java.util.Map;
import java.util.Map.*;
import java.util.Set;
import st.gravel.support.compiler.ast.AnonymousMethodMapping;
import st.gravel.support.compiler.ast.VariableDeclarationNode;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.EmptyTraitUsageNode;
import st.gravel.support.compiler.ast.IdentityClassPartMapping;
import st.gravel.support.compiler.ast.ExtensionClassPartMapping;
import st.gravel.support.compiler.ast.InstVarMapping;
import st.gravel.support.compiler.ast.PackageNodeMerger;

public class SystemMapping extends AbstractMapping implements Cloneable {

	public static SystemMapping_Factory factory = new SystemMapping_Factory();

	Map<Class, ClassMapping> _classMappingsByJavaClass;

	Map<Reference, ClassMapping> _classMappingsByReference;

	SystemMappingCompilerTools _compilerTools;

	ClassMapping _nilClassMapping;

	SelectorConverter _selectorConverter;

	Map<AbsoluteReference, st.gravel.support.jvm.runtime.AlmostFinalValue> _singletonHolders;

	SystemDefinitionNode _systemDefinitionNode;

	SystemNode _systemNode;

	public static class SystemMapping_Factory extends AbstractMapping_Factory {

		public SystemMapping basicNew() {
			SystemMapping newInstance = new SystemMapping();
			newInstance.initialize();
			return newInstance;
		}

		public SystemMapping systemNode_compilerTools_(final SystemNode _aSystemNode, final SystemMappingCompilerTools _aMockSystemMappingCompilerTools) {
			return ((SystemMapping) this.basicNew().initializeSystemNode_compilerTools_(_aSystemNode, _aMockSystemMappingCompilerTools));
		}
	}

	static public SystemMapping _systemNode_compilerTools_(Object receiver, final SystemNode _aSystemNode, final SystemMappingCompilerTools _aMockSystemMappingCompilerTools) {
		return factory.systemNode_compilerTools_(_aSystemNode, _aMockSystemMappingCompilerTools);
	}

	public SystemMapping addClassMapping_(final ClassMapping _aClassMapping) {
		final Class _identityClass;
		_identityClass = _aClassMapping.identityClass();
		if (_identityClass == null) {
			_nilClassMapping = _aClassMapping;
		} else {
			_classMappingsByJavaClass.put(_identityClass, _aClassMapping);
		}
		_classMappingsByReference.put(_aClassMapping.classNode().reference(), _aClassMapping);
		_systemNode = _systemNode.withClassDescriptionNode_(_aClassMapping.classNode());
		return this;
	}

	public SystemMapping applyDiff_(final SystemDiff _aSystemDiff) {
		final SystemMappingUpdater[] _updater;
		_updater = new SystemMappingUpdater[1];
		_updater[0] = this.newSystemMappingUpdater();
		for (final ClassDiff _each : _aSystemDiff.classDiffs()) {
			_updater[0].visit_(_each);
		}
		_updater[0].setNamespaceNodes_(_aSystemDiff.namespaces());
		_updater[0].link();
		return this;
	}

	public ClassMapping bestClassMappingFor_(final Class _receiverClass) {
		final ClassMapping[] _best;
		_best = new ClassMapping[1];
		_best[0] = null;
		for (final ClassMapping _cm : _classMappingsByReference.values()) {
			if (_compilerTools.isAssignable_from_(_cm.identityClass(), _receiverClass)) {
				if ((_best[0]) == null) {
					_best[0] = _cm;
				} else {
					if (_compilerTools.isAssignable_from_(_best[0].identityClass(), _cm.identityClass())) {
						_best[0] = _cm;
					}
				}
			}
		}
		return _best[0];
	}

	public ClassMapping classMappingAtJavaClass_ifAbsent_(final Class _aClass, final st.gravel.support.jvm.Block0<ClassMapping> _absentBlock) {
		if (_aClass == null) {
			return _nilClassMapping;
		}
		return st.gravel.support.jvm.DictionaryExtensions.at_ifAbsent_(_classMappingsByJavaClass, _aClass, _absentBlock);
	}

	public ClassMapping classMappingAtReference_(final Reference _aReference) {
		return this.classMappingAtReference_ifAbsent_(_aReference, ((st.gravel.support.jvm.Block0<ClassMapping>) (new st.gravel.support.jvm.Block0<ClassMapping>() {

			@Override
			public ClassMapping value() {
				throw new RuntimeException("Cannot find: " + _aReference.toString());
			}
		})));
	}

	public ClassMapping classMappingAtReference_ifAbsent_(final Reference _aReference, final st.gravel.support.jvm.Block0<ClassMapping> _absentBlock) {
		return st.gravel.support.jvm.DictionaryExtensions.at_ifAbsent_(_classMappingsByReference, _aReference, _absentBlock);
	}

	public ClassMapping classMappingAt_(final String _aString) {
		return this.classMappingAt_ifAbsent_(_aString, ((st.gravel.support.jvm.Block0<ClassMapping>) (new st.gravel.support.jvm.Block0<ClassMapping>() {

			@Override
			public ClassMapping value() {
				throw new RuntimeException("Cannot find: " + _aString);
			}
		})));
	}

	public ClassMapping classMappingAt_ifAbsent_(final String _aString, final st.gravel.support.jvm.Block0<ClassMapping> _absentBlock) {
		return this.classMappingAtReference_ifAbsent_(AbsoluteReference.factory.path_(st.gravel.support.jvm.ArrayExtensions.collect_(st.gravel.support.jvm.StringExtensions.tokensBasedOn_(_aString, '.'), ((st.gravel.support.jvm.Block1<st.gravel.core.Symbol, String>) (new st.gravel.support.jvm.Block1<st.gravel.core.Symbol, String>() {

			@Override
			public st.gravel.core.Symbol value_(final String _each) {
				return (st.gravel.core.Symbol) st.gravel.core.Symbol.value(_each);
			}
		})))), _absentBlock);
	}

	public ClassMapping classMappingForJavaClass_(final Class _receiverClass) {
		return this.classMappingAtJavaClass_ifAbsent_(_receiverClass, ((st.gravel.support.jvm.Block0<ClassMapping>) (new st.gravel.support.jvm.Block0<ClassMapping>() {

			@Override
			public ClassMapping value() {
				final ClassMapping _newClassMapping;
				_newClassMapping = SystemMapping.this.newClassMappingForJavaClass_(_receiverClass);
				_classMappingsByJavaClass.put(_receiverClass, _newClassMapping);
				return (ClassMapping) _newClassMapping;
			}
		})));
	}

	public SystemMapping classMappingsDo_(final st.gravel.support.jvm.Block1<Object, ClassMapping> _aBlock) {
		for (final ClassMapping _temp1 : _classMappingsByReference.values()) {
			_aBlock.value_(_temp1);
		}
		return this;
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue classSharedSingletonHolderAtReference_ifAbsent_(final AbsoluteReference _reference, final st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue> _aBlock) {
		final Object _temp2 = new Object();
		try {
			st.gravel.support.jvm.runtime.AlmostFinalValue _temp1 = _singletonHolders.get(_reference);
			if (_temp1 == null) {
				_temp1 = ((st.gravel.support.jvm.runtime.AlmostFinalValue) st.gravel.support.jvm.DictionaryExtensions.at_ifAbsent_(_singletonHolders, _reference.namespace().namespace().$slash$(_reference.name()), ((st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>) (new st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>() {

					@Override
					public st.gravel.support.jvm.runtime.AlmostFinalValue value() {
						final ClassMapping _cm;
						final AbsoluteReference _superclassReference;
						final SharedDeclarationNode _sharedVariable;
						_cm = ((ClassMapping) st.gravel.support.jvm.DictionaryExtensions.at_ifAbsent_(_classMappingsByReference, _reference.namespace(), ((st.gravel.support.jvm.Block0<ClassMapping>) (new st.gravel.support.jvm.Block0<ClassMapping>() {

							@Override
							public ClassMapping value() {
								throw new NonLocalReturn(_aBlock.value(), _temp2);
							}
						}))));
						_sharedVariable = _cm.classNode().meta().sharedVariableAt_ifAbsent_(_reference.name().asString(), new st.gravel.support.jvm.Block0<SharedDeclarationNode>() {

							@Override
							public SharedDeclarationNode value() {
								return (SharedDeclarationNode) null;
							}
						});
						if (_sharedVariable != null) {
							throw new RuntimeException("Shared not initialized: " + _reference.toString());
						}
						_superclassReference = ((AbsoluteReference) _cm.superclassReference());
						if (_superclassReference == null) {
							throw new NonLocalReturn(_aBlock.value(), _temp2);
						}
						return (st.gravel.support.jvm.runtime.AlmostFinalValue) SystemMapping.this.classSharedSingletonHolderAtReference_ifAbsent_(_superclassReference.$slash$(_reference.name()), _aBlock);
					}
				}))));
			}
			return ((st.gravel.support.jvm.runtime.AlmostFinalValue) _temp1);
		} catch (NonLocalReturn nlr) {
			if (nlr.marker == _temp2) {
				return (st.gravel.support.jvm.runtime.AlmostFinalValue) nlr.returnValue;
			} else {
				throw nlr;
			}
		}
	}

	public Class compileAndWriteExpression_reference_(final Node _anExpression, final Reference _aReference) {
		final JVMClass[] _jvmClasses;
		final Class[] _last;
		_last = new Class[1];
		_jvmClasses = this.compileExpression_reference_(_anExpression, _aReference);
		_last[0] = null;
		for (final JVMClass _jvmClass : _jvmClasses) {
			_last[0] = _compilerTools.writeClass_(_jvmClass);
		}
		return _last[0];
	}

	public JVMClass[] compileExpressionSource_(final String _source) {
		return this.compileExpression_reference_(Parser.factory.parseExpression_(_source), Reference.factory.value_("st.gravel.lang.UndefinedObject"));
	}

	public JVMClass[] compileExpression_reference_(final Node _anExpression, final Reference _aReference) {
		final JVMDefinedObjectType _ownerType;
		final BlockNode _fieldAccessed;
		final BlockInnerClass _aBlockInnerClass;
		final BlockNode _intermediate;
		final BlockNode _holderized;
		final JVMClassCompiler _jvmClassCompiler;
		final JVMClass _blockClass;
		_intermediate = ((BlockNode) IntermediateNodeRewriter.factory.visit_(BlockNode.factory.expression_(_anExpression)));
		_holderized = ((BlockNode) NonLocalTempWritesToHolderConverter.factory.visit_(_intermediate));
		_fieldAccessed = ((BlockNode) VariableAccessToFieldAccessConverter.factory.instVarNames_owner_ownerReference_(new String[] {}, NilLiteralNode.factory.basicNew(), _aReference).visit_(_holderized));
		_ownerType = JVMDefinedObjectType.factory.dottedClassName_("Expression$" + _compilerTools.nextExtensionPostfix());
		_aBlockInnerClass = BlockInnerClass.factory.ownerType_blockNode_copiedVariables_(_ownerType, _fieldAccessed, new JVMVariable[] {});
		_jvmClassCompiler = JVMClassCompiler.factory.classDescriptionNode_systemNode_systemMappingUpdater_isStatic_(null, _systemNode, this.newSystemMappingUpdater(), false);
		_jvmClassCompiler.ownerType_(JVMDefinedObjectType.factory.dottedClassName_("ExpressionContainer$" + _compilerTools.nextExtensionPostfix()));
		_blockClass = _jvmClassCompiler.compileBlockNoAdd_(_aBlockInnerClass);
		if (!_jvmClassCompiler.hasConstantsOrFieldsOrExtraClasses()) {
			return st.gravel.support.jvm.ArrayFactory.with_(_blockClass);
		}
		return st.gravel.support.jvm.ArrayExtensions.copyWithAll_(_jvmClassCompiler.extraClasses(), st.gravel.support.jvm.ArrayFactory.with_with_(_jvmClassCompiler.createContainerClass(), _blockClass));
	}

	public SystemMappingCompilerTools compilerTools() {
		return _compilerTools;
	}

	public SystemMapping copy() {
		try {
			SystemMapping _temp1 = (SystemMapping) this.clone();
			_temp1.postCopy();
			return _temp1;
		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e);
		}
	}

	public ClassDescriptionNode definitionClassNodeAt_(final Reference _reference) {
		return this.definitionClassNodeAt_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<ClassDescriptionNode>) (new st.gravel.support.jvm.Block0<ClassDescriptionNode>() {

			@Override
			public ClassDescriptionNode value() {
				throw new RuntimeException("Cannot find: " + _reference.toString());
			}
		})));
	}

	public ClassDescriptionNode definitionClassNodeAt_ifAbsent_(final Reference _reference, final st.gravel.support.jvm.Block0<ClassDescriptionNode> _aBlock) {
		final Object _temp1 = new Object();
		try {
			if (_reference.isMeta()) {
				return ((ClassNode) SystemMapping.this.definitionClassNodeAt_ifAbsent_(_reference.nonmeta(), ((st.gravel.support.jvm.Block0<ClassDescriptionNode>) (new st.gravel.support.jvm.Block0<ClassDescriptionNode>() {

					@Override
					public ClassDescriptionNode value() {
						throw new NonLocalReturn(_aBlock.value(), _temp1);
					}
				})))).metaclassNode();
			}
			return _systemDefinitionNode.classNodeAt_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<ClassNode>) (new st.gravel.support.jvm.Block0<ClassNode>() {

				@Override
				public ClassNode value() {
					throw new NonLocalReturn(_aBlock.value(), _temp1);
				}
			})));
		} catch (NonLocalReturn nlr) {
			if (nlr.marker == _temp1) {
				return (ClassDescriptionNode) nlr.returnValue;
			} else {
				throw nlr;
			}
		}
	}

	public ClassDescriptionNode definitionOrObsoleteClassNodeAt_(final Reference _reference) {
		return this.definitionOrObsoleteClassNodeAt_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<ClassDescriptionNode>) (new st.gravel.support.jvm.Block0<ClassDescriptionNode>() {

			@Override
			public ClassDescriptionNode value() {
				throw new RuntimeException("Cannot find: " + _reference.toString());
			}
		})));
	}

	public ClassDescriptionNode definitionOrObsoleteClassNodeAt_ifAbsent_(final Reference _reference, final st.gravel.support.jvm.Block0<ClassDescriptionNode> _aBlock) {
		return this.definitionClassNodeAt_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<ClassDescriptionNode>) (new st.gravel.support.jvm.Block0<ClassDescriptionNode>() {

			@Override
			public ClassDescriptionNode value() {
				return (ClassDescriptionNode) SystemMapping.this.obsoleteClassNodeAt_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<ClassDescriptionNode>) (new st.gravel.support.jvm.Block0<ClassDescriptionNode>() {

					@Override
					public ClassDescriptionNode value() {
						throw new RuntimeException("Cannot find: " + _reference.toString());
					}
				})));
			}
		})));
	}

	public Object evaluateExpression_reference_(final Expression _anExpression, final AbsoluteReference _aReference) {
		final Class _cl;
		_cl = this.compileAndWriteExpression_reference_(_anExpression, _aReference);
		return _compilerTools.evaluateBlock0Class_(_cl);
	}

	public SystemMapping_Factory factory() {
		return factory;
	}

	@Override
	public SystemMapping initialize() {
		_classMappingsByJavaClass = new java.util.HashMap<Class, ClassMapping>();
		_classMappingsByReference = new java.util.HashMap<Reference, ClassMapping>();
		_singletonHolders = new java.util.HashMap<AbsoluteReference, st.gravel.support.jvm.runtime.AlmostFinalValue>();
		_selectorConverter = SelectorConverter.factory.basicNew();
		return this;
	}

	public SystemMapping initializeSystemNode_compilerTools_(final SystemNode _aSystemNode, final SystemMappingCompilerTools _aMockSystemMappingCompilerTools) {
		_systemNode = _aSystemNode;
		_compilerTools = _aMockSystemMappingCompilerTools;
		this.initialize();
		return this;
	}

	public SystemMapping log_(final String _aString) {
		return this;
	}

	public SystemMapping log_while_(final String _aString, final st.gravel.support.jvm.Block0<Object> _aBlock) {
		final int _ms;
		this.log_(_aString + "...");
		long _temp1 = new Date().getTime();
		_aBlock.value();
		long _temp2 = new Date().getTime();
		_ms = (int) (_temp2 - _temp1);
		this.log_(_aString + " Done in " + "" + _ms + " ms");
		return this;
	}

	public java.lang.invoke.MethodHandle methodHandleForNil_(final String _methodName) {
		final st.gravel.core.Symbol _sel;
		final ClassMapping _classMapping;
		_classMapping = this.nilClassMapping();
		_sel = _selectorConverter.functionNameAsSelector_(_methodName);
		return this.methodHandleFrom_selector_(_classMapping, _sel);
	}

	public java.lang.invoke.MethodHandle methodHandleFor_methodName_(final Class _receiverClass, final String _methodName) {
		final st.gravel.core.Symbol _sel;
		final ClassMapping _classMapping;
		_classMapping = this.classMappingForJavaClass_(_receiverClass);
		_sel = _selectorConverter.functionNameAsSelector_(_methodName);
		return this.methodHandleFrom_selector_(_classMapping, _sel);
	}

	public java.lang.invoke.MethodHandle methodHandleFrom_selector_(final ClassMapping _classMapping, final st.gravel.core.Symbol _sel) {
		final AbstractMethodMapping _methodMapping;
		_methodMapping = this.methodMappingFrom_selector_(_classMapping, _sel);
		if (_methodMapping == null) {
			return null;
		}
		return _methodMapping.methodHandle();
	}

	public MethodMapping methodMappingForNil_(final String _methodName) {
		final st.gravel.core.Symbol _sel;
		final ClassMapping _classMapping;
		_classMapping = this.nilClassMapping();
		_sel = _selectorConverter.functionNameAsSelector_(_methodName);
		return ((MethodMapping) this.methodMappingFrom_selector_(_classMapping, _sel));
	}

	public MethodMapping methodMappingFor_methodName_(final Class _receiverClass, final String _methodName) {
		final st.gravel.core.Symbol _sel;
		final ClassMapping _classMapping;
		_classMapping = this.classMappingForJavaClass_(_receiverClass);
		_sel = _selectorConverter.functionNameAsSelector_(_methodName);
		return ((MethodMapping) this.methodMappingFrom_selector_(_classMapping, _sel));
	}

	public AbstractMethodMapping methodMappingFrom_selector_(final ClassMapping _classMapping, final st.gravel.core.Symbol _sel) {
		return _classMapping.methodMappingAt_ifAbsent_(_sel, ((st.gravel.support.jvm.Block0<AbstractMethodMapping>) (new st.gravel.support.jvm.Block0<AbstractMethodMapping>() {

			@Override
			public AbstractMethodMapping value() {
				final Reference _superclassReference;
				AbstractMethodMapping _mapping;
				_superclassReference = _classMapping.superclassReferenceForMethodLookup();
				if (_superclassReference == null) {
					_mapping = null;
				} else {
					_mapping = SystemMapping.this.methodMappingFrom_selector_(SystemMapping.this.classMappingAtReference_(_superclassReference), _sel);
				}
				return (AbstractMethodMapping) _mapping;
			}
		})));
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue namespacedSingletonHolderAtReference_ifAbsent_(final AbsoluteReference _reference, final st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue> _aBlock) {
		final Object _temp1 = new Object();
		try {
			final NamespaceNode _nsNode;
			_nsNode = _systemNode.namespaceNodeAt_ifAbsent_(_reference.namespace().namespace(), ((st.gravel.support.jvm.Block0<NamespaceNode>) (new st.gravel.support.jvm.Block0<NamespaceNode>() {

				@Override
				public NamespaceNode value() {
					return (NamespaceNode) null;
				}
			})));
			if (_nsNode != null) {
				_nsNode.allImportsIn_do_(_systemNode, new st.gravel.support.jvm.Block1<Object, NamespaceNode>() {

					@Override
					public Object value_(final NamespaceNode _importNS) {
						final st.gravel.support.jvm.runtime.AlmostFinalValue _sh;
						final SharedDeclarationNode _shared;
						_shared = _importNS.sharedVariableAt_ifAbsent_(_reference.name().asString(), ((st.gravel.support.jvm.Block0<SharedDeclarationNode>) (new st.gravel.support.jvm.Block0<SharedDeclarationNode>() {

							@Override
							public SharedDeclarationNode value() {
								return (SharedDeclarationNode) null;
							}
						})));
						if (_shared != null) {
							throw new NonLocalReturn(SystemMapping.this.singletonAtReference_initialize_(_importNS.reference().$slash$(_reference.name()), _shared), _temp1);
						}
						st.gravel.support.jvm.runtime.AlmostFinalValue _temp2 = _singletonHolders.get(_importNS.reference().$slash$(_reference.name()));
						_sh = ((st.gravel.support.jvm.runtime.AlmostFinalValue) _temp2);
						if (_sh != null) {
							throw new NonLocalReturn(_sh, _temp1);
						}
						return SystemMapping.this;
					}
				});
			}
			return _aBlock.value();
		} catch (NonLocalReturn nlr) {
			if (nlr.marker == _temp1) {
				return (st.gravel.support.jvm.runtime.AlmostFinalValue) nlr.returnValue;
			} else {
				throw nlr;
			}
		}
	}

	public SystemMapping namespaceGlobalsAndInitializersDo_(final st.gravel.support.jvm.Block2<Object, AbsoluteReference, SharedDeclarationNode> _aBlock) {
		for (final Map.Entry<Reference, NamespaceNode> _temp1 : _systemNode.namespaceNodes().entrySet()) {
			Reference _reference = _temp1.getKey();
			NamespaceNode _namespaceNode = _temp1.getValue();
			for (final SharedDeclarationNode _sharedVariable : _namespaceNode.sharedVariables()) {
				_aBlock.value_value_(((AbsoluteReference) _reference).$slash$(st.gravel.core.Symbol.value(_sharedVariable.name())), _sharedVariable);
			}
		}
		return this;
	}

	public ClassMapping newClassMappingForJavaClass_(final Class _receiverClass) {
		final Map<st.gravel.core.Symbol, AbstractMethodMapping>[] _methodMappings;
		final ClassNode _classNode;
		final ClassMapping _superMapping;
		final java.util.Set<st.gravel.core.Symbol>[] _allSelectors;
		_allSelectors = new java.util.Set[1];
		_methodMappings = new Map[1];
		_superMapping = this.bestClassMappingFor_(_receiverClass);
		_allSelectors[0] = _superMapping.allSelectorsIn_(this);
		_methodMappings[0] = new java.util.HashMap<st.gravel.core.Symbol, AbstractMethodMapping>();
		_compilerTools.methodNamesIn_do_(_receiverClass, new st.gravel.support.jvm.Block2<Object, String, Integer>() {

			@Override
			public Object value_value_(final String _methodName, final Integer _numArgs) {
				final st.gravel.core.Symbol _sel;
				java.lang.invoke.MethodHandle _methodHandle;
				_sel = _selectorConverter.functionNameAsSelector_(_methodName);
				if (st.gravel.support.jvm.IntegerExtensions.equals_(_sel.numArgs(), _numArgs) && _allSelectors[0].contains(_sel)) {
					_methodHandle = _compilerTools.methodHandleAt_numArgs_in_identityClass_isStatic_(_methodName, _sel.numArgs(), _receiverClass, _receiverClass, false);
					return _methodMappings[0].put(_sel, AnonymousMethodMapping.factory.methodHandle_definingClass_(_methodHandle, _receiverClass));
				}
				return SystemMapping.this;
			}
		});
		_classNode = ClassNode.factory.name_superclassPath_properties_instVars_classInstVars_sharedVariables_methods_classMethods_namespace_isExtension_isTrait_traitUsage_classTraitUsage_(_superMapping.classNode().name(), _superMapping.reference().toString(), new java.util.HashMap<String, String>(), new VariableDeclarationNode[] {}, new VariableDeclarationNode[] {}, new SharedDeclarationNode[] {}, new MethodNode[] {}, new MethodNode[] {}, _superMapping.classNode().namespace(), false, false, EmptyTraitUsageNode.factory.basicNew(), EmptyTraitUsageNode.factory.basicNew());
		return ClassMapping.factory.identityMapping_extensions_instVarMappings_classNode_(IdentityClassPartMapping.factory.javaClass_isGenerated_(_receiverClass, false).withMethodMappings_(_methodMappings[0]), new ExtensionClassPartMapping[] {}, new java.util.HashMap<String, InstVarMapping>(), _classNode);
	}

	public SystemMappingUpdater newSystemMappingUpdater() {
		return SystemMappingUpdater.factory.systemMapping_compilerTools_(this, _compilerTools);
	}

	public ClassMapping nilClassMapping() {
		return _nilClassMapping;
	}

	public ClassDescriptionNode obsoleteClassNodeAt_ifAbsent_(final Reference _aReference, final st.gravel.support.jvm.Block0<ClassDescriptionNode> _absentBlock) {
		final Object _temp1 = new Object();
		try {
			return this.classMappingAtReference_ifAbsent_(_aReference, ((st.gravel.support.jvm.Block0<ClassMapping>) (new st.gravel.support.jvm.Block0<ClassMapping>() {

				@Override
				public ClassMapping value() {
					throw new NonLocalReturn(_absentBlock.value(), _temp1);
				}
			}))).classNode();
		} catch (NonLocalReturn nlr) {
			if (nlr.marker == _temp1) {
				return (ClassDescriptionNode) nlr.returnValue;
			} else {
				throw nlr;
			}
		}
	}

	public st.gravel.core.Symbol[] packageNames() {
		return _systemDefinitionNode.packageNames();
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue resolveSingletonHolder_(final AbsoluteReference _reference) {
		return this.resolveSingletonHolder_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>) (new st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>() {

			@Override
			public st.gravel.support.jvm.runtime.AlmostFinalValue value() {
				throw new RuntimeException("Singleton not found:" + _reference.toString());
			}
		})));
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue resolveSingletonHolder_ifAbsent_(final AbsoluteReference _reference, final st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue> _aBlock) {
		return this.namespacedSingletonHolderAtReference_ifAbsent_(_reference, ((st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>) (new st.gravel.support.jvm.Block0<st.gravel.support.jvm.runtime.AlmostFinalValue>() {

			@Override
			public st.gravel.support.jvm.runtime.AlmostFinalValue value() {
				return (st.gravel.support.jvm.runtime.AlmostFinalValue) SystemMapping.this.classSharedSingletonHolderAtReference_ifAbsent_(_reference, _aBlock);
			}
		})));
	}

	public SelectorConverter selectorConverter() {
		return _selectorConverter;
	}

	public SystemMapping setNamespaceNodes_(final Map<Reference, NamespaceNode> _aDictionary) {
		final Map<Reference, NamespaceNode>[] _dict;
		_dict = new Map[1];
		_dict[0] = new java.util.HashMap<Reference, NamespaceNode>();
		st.gravel.support.jvm.DictionaryExtensions.syncWith(_systemNode.namespaceNodes(), _aDictionary, new st.gravel.support.jvm.Block2<Object, NamespaceNode, NamespaceNode>() {

			@Override
			public Object value_value_(final NamespaceNode _old, final NamespaceNode _new) {
				return _dict[0].put(_new.reference(), _old.mergeWith_(_new));
			}
		}, new st.gravel.support.jvm.Block1<Object, NamespaceNode>() {

			@Override
			public Object value_(final NamespaceNode _nsNode) {
				return _dict[0].put(_nsNode.reference(), _nsNode);
			}
		}, new st.gravel.support.jvm.Block1<Object, NamespaceNode>() {

			@Override
			public Object value_(final NamespaceNode _nsNode) {
				return _dict[0].put(_nsNode.reference(), _nsNode);
			}
		});
		_systemNode = _systemNode.withNamespaceNodes_(_dict[0]);
		return this;
	}

	public Object singletonAtReferenceString_(final String _aString) {
		return this.singletonAtReference_(((AbsoluteReference) Reference.factory.value_(_aString)));
	}

	public Object singletonAtReference_(final AbsoluteReference _reference) {
		final st.gravel.support.jvm.runtime.AlmostFinalValue _holder;
		st.gravel.support.jvm.runtime.AlmostFinalValue _temp1 = _singletonHolders.get(_reference);
		if (_temp1 == null) {
			throw new RuntimeException("Singleton not found:" + _reference.toString());
		}
		_holder = ((st.gravel.support.jvm.runtime.AlmostFinalValue) _temp1);
		return _compilerTools.valueOfSingletonHolder_(_holder);
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue singletonAtReference_ifAbsentPut_(final AbsoluteReference _reference, final st.gravel.support.jvm.Block0<Object> _aBlock) {
		st.gravel.support.jvm.runtime.AlmostFinalValue _temp1 = _singletonHolders.get(_reference);
		if (_temp1 == null) {
			st.gravel.support.jvm.runtime.AlmostFinalValue _temp2 = _compilerTools.newSingletonHolder_value_(_reference, _aBlock.value());
			_singletonHolders.put(_reference, _temp2);
			_temp1 = _temp2;
		}
		return _temp1;
	}

	public st.gravel.support.jvm.runtime.AlmostFinalValue singletonAtReference_initialize_(final AbsoluteReference _reference, final SharedDeclarationNode _sharedVariable) {
		return this.singletonAtReference_ifAbsentPut_(_reference, new st.gravel.support.jvm.Block0<Object>() {

			@Override
			public Object value() {
				if (_sharedVariable.initializer() != null) {
					return SystemMapping.this.evaluateExpression_reference_(_sharedVariable.initializer(), _reference);
				}
				return SystemMapping.this;
			}
		});
	}

	public SystemMapping subclassMappingsFor_do_(final Reference _aReference, final st.gravel.support.jvm.Block1<Object, ClassMapping> _aBlock) {
		for (final ClassMapping _each : _classMappingsByReference.values()) {
			if (st.gravel.support.jvm.ObjectExtensions.equals_(_each.superclassReference(), _aReference)) {
				_aBlock.value_(_each);
			}
		}
		return this;
	}

	public AbstractMethodMapping superMethodMappingFor_methodName_(final Reference _aReference, final String _methodName) {
		final st.gravel.core.Symbol _sel;
		final ClassMapping _classMapping;
		final Reference _superclassReference;
		_classMapping = this.classMappingAtReference_(_aReference);
		_superclassReference = _classMapping.superclassReference();
		if (_superclassReference == null) {
			return null;
		}
		_sel = _selectorConverter.functionNameAsSelector_(_methodName);
		return this.methodMappingFrom_selector_(this.classMappingAtReference_(_superclassReference), _sel);
	}

	public SystemDefinitionNode systemDefinitionNode() {
		return _systemDefinitionNode;
	}

	public SystemNode systemNode() {
		return _systemNode;
	}

	public SystemMapping updateTo_(final SystemDefinitionNode _newSystemDefinitionNode) {
		final SystemDiff[] _diff;
		final SystemNode[] _newSystemNode;
		_newSystemNode = new SystemNode[1];
		_diff = new SystemDiff[1];
		_newSystemNode[0] = PackageNodeMerger.factory.systemDefinitionNode_(_newSystemDefinitionNode).load();
		this.log_while_("Calculating diff", new st.gravel.support.jvm.Block0<Object>() {

			@Override
			public Object value() {
				return _diff[0] = _systemNode.diffTo_(_newSystemNode[0]);
			}
		});
		this.log_while_("Applying diff", new st.gravel.support.jvm.Block0<Object>() {

			@Override
			public Object value() {
				return SystemMapping.this.applyDiff_(_diff[0]);
			}
		});
		_systemDefinitionNode = _newSystemDefinitionNode;
		return this;
	}
}
