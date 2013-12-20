(reader defineClass: 'SystemMappingUpdater' superclass: 'st.gravel.support.compiler.ast.DiffVisitor')
!
(reader addInstVar: 'systemMapping')
!
(reader addInstVar: 'compilerTools')
!
(reader addInstVar: 'selectorConverter')
!
(reader addInstVar: 'toInitialize')
!
(reader addInstVar: 'isStaticOverride')
!
(reader addMethod: 'As yet unclassified')
!
allInstVarsForReference: aReference {Reference | Nil} {^Arr[BoundVariableDeclarationNode]}
	aReference isNil ifTrue: [^#()].
	^(systemMapping classMappingAtReference: aReference) allInstVarsIn: systemMapping
!
(reader addMethod: 'As yet unclassified')
!
classForSuperOf: aReference {Reference} {^JavaClass}
	| superMapping {ClassMapping} superclass {JavaClass} |
	superMapping := systemMapping classMappingAtReference: aReference.
	superclass := superMapping identityClass.
	superclass isInterface ifTrue: [^self classForSuperOf: superMapping superclassReference].
	^superclass
!
(reader addMethod: 'As yet unclassified')
!
compileClass: aClassDescriptionNode {ClassDescriptionNode} extensionPostfix: extensionPostfix {Str} isStatic: isStatic {Boolean} identityClass: identityClass {JavaClass} {^JavaClass}
	| compiler {JVMClassCompiler} extensionClass {JavaClass} |
	compiler := JVMClassCompiler
				classDescriptionNode: aClassDescriptionNode
				systemNode: systemMapping systemNode
				systemMappingUpdater: self
				isStatic: isStatic.
	extensionPostfix isNil ifFalse: [compiler extensionPostfix: extensionPostfix].
	identityClass isNil
		ifFalse: [compiler selfType: (compilerTools jvmTypeForClass: identityClass)].
	extensionClass := compilerTools writeClass: compiler compileClassNode.
	compiler extraClassesDo: [:each {JVMClass} | compilerTools writeClass: each].
	^extensionClass
!
(reader addMethod: 'As yet unclassified')
!
compileClass: aClassDescriptionNode {ClassDescriptionNode} isStatic: isStatic {Boolean} {^JavaClass}
	^self
		compileClass: aClassDescriptionNode
		extensionPostfix: nil
		isStatic: isStatic
		identityClass: nil
!
(reader addMethod: 'As yet unclassified')
!
compileClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	^self compileClassDescriptionNode: aClassDescriptionNode isStatic: false
!
(reader addMethod: 'As yet unclassified')
!
compileClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} isStatic: isStatic {Bool} {^Self}
	isStatic
		ifTrue: [self compileClassDescriptionNodeStatic: aClassDescriptionNode]
		ifFalse: [self compileClassDescriptionNodeNonStatic: aClassDescriptionNode]
!
(reader addMethod: 'As yet unclassified')
!
compileClassDescriptionNodeNonStatic: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	| identityClass {JavaClass} identityMapping {IdentityClassPartMapping} allMethods {Arr[MethodNode]} extraMethods {Arr[MethodNode]} ecdn {ClassDescriptionNode} |
	extraMethods := self extraMethodsFor: aClassDescriptionNode.
	ecdn := aClassDescriptionNode withExtraMethods: extraMethods.
	identityClass := self compileClass: ecdn isStatic: false.
	allMethods := self methods: aClassDescriptionNode methods withExtraMethods: extraMethods.
	identityMapping := self
				linkMethods: allMethods
				in: identityClass
				identityClass: identityClass
				to: (IdentityClassPartMapping javaClass: identityClass isGenerated: true)
				isStatic: false.
	systemMapping addClassMapping: (ClassMapping
				identityMapping: identityMapping
				extensions: #()
				instVarMappings: Dictionary new
				classNode: aClassDescriptionNode)
!
(reader addMethod: 'As yet unclassified')
!
compileClassDescriptionNodeStatic: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	| extensionClass {JavaClass} identityMapping {IdentityClassPartMapping} allMethods {Arr[MethodNode]} extraMethods {Arr[MethodNode]} ecdn {ClassDescriptionNode} |
	extraMethods := self extraMethodsFor: aClassDescriptionNode.
	allMethods := self methods: aClassDescriptionNode methods withExtraMethods: extraMethods.
	ecdn := aClassDescriptionNode withExtraMethods: extraMethods.
	extensionClass := self compileClass: ecdn isStatic: true.
	identityMapping := IdentityClassPartMapping
				javaClass: (aClassDescriptionNode isNilClass ifTrue: [nil] ifFalse: [extensionClass])
				isGenerated: true.
	identityMapping := self
				linkMethods: allMethods
				in: extensionClass
				identityClass: extensionClass
				to: identityMapping
				isStatic: true.
	systemMapping addClassMapping: (ClassMapping
				identityMapping: identityMapping
				extensions: #()
				instVarMappings: Dictionary new
				classNode: aClassDescriptionNode)
!
(reader addMethod: 'As yet unclassified')
!
compiledMethodNodesIn: superclassReference {Reference} do: aBlock {[MethodNode, ^Object]} {^Self}
	| superMapping {ClassMapping} sc {JavaClass} allSelectors {Set[Sym]} |
	superclassReference isNil ifTrue: [^self].
	superMapping := systemMapping classMappingAtReference: superclassReference.
	allSelectors := superMapping allSelectorsIn: systemMapping.
	sc := superMapping identityClass.
	compilerTools methodNamesIn: sc
		do: 
			[:methodName {Str} |
			| sel {Sym} |
			sel := selectorConverter functionNameAsSelector: methodName.
			(allSelectors includes: sel)
				ifTrue: 
					[| methodMapping {AbstractMethodMapping | Nil} |
					methodMapping := systemMapping methodMappingFrom: superMapping selector: sel.
					(methodMapping isNil not and: [methodMapping methodNode isNil not])
						ifTrue: [aBlock value: methodMapping methodNode]]]
!
(reader addMethod: 'As yet unclassified')
!
compileExtensionClassPartMapping: aClassDescriptionNode {ClassDescriptionNode} methods: extensionMethods {Array[MethodNode]} identityClass: identityClass {JavaClass} instVars: boundInstVars {Arr[BoundVariableDeclarationNode]} sourceFile: sourceFile {SourceFile} {^ExtensionClassPartMapping}
	| extensionClass {JavaClass} |
	extensionClass := self
				compileClass: aClassDescriptionNode
				extensionPostfix: compilerTools nextExtensionPostfix
				isStatic: true
				identityClass: identityClass.
	^self
		linkMethods: extensionMethods
		in: extensionClass
		identityClass: identityClass
		to: (ExtensionClassPartMapping javaClass: extensionClass isGenerated: true)
		isStatic: true
!
(reader addMethod: 'accessing')
!
compilerTools {^SystemMappingCompilerTools}
	^compilerTools
!
(reader addMethod: 'As yet unclassified')
!
executeUpdateClassDescriptorDiff: anUpdateClassDescriptorDiff {UpdateClassDescriptorDiff} reference: aReference {Reference} {^Self}
	| ecm {ExtensionClassPartMapping} cm {ClassMapping} ncn {ClassDescriptionNode} methods {Arr[MethodNode]} |
	cm := systemMapping classMappingAtReference: aReference.
	cm := anUpdateClassDescriptorDiff updatedMethodNodes inject: cm
				into: [:classMapping {ClassMapping} :methodNode {MethodNode} | classMapping withoutMethodMapping: methodNode selector].
	cm := anUpdateClassDescriptorDiff deletedSelectors inject: cm
				into: [:classMapping {ClassMapping} :selector {Str} | classMapping withoutMethodMapping: selector].
	ncn := anUpdateClassDescriptorDiff applyOnClassNode: cm classNode.
	methods := anUpdateClassDescriptorDiff methodNodes
				copyWithAll: anUpdateClassDescriptorDiff updatedMethodNodes.
	ecm := self
				compileExtensionClassPartMapping: ncn
				methods: methods
				identityClass: cm identityClass
				instVars: cm classNode boundInstVars
				sourceFile: (self findSourceFile: anUpdateClassDescriptorDiff methodNodes).
	systemMapping addClassMapping: ((cm withClassNode: ncn) withExtension: ecm)
!
(reader addMethod: 'As yet unclassified')
!
extraMethodsFor: aClassDescriptionNode {ClassDescriptionNode} {^Arr[MethodNode]}
	aClassDescriptionNode isClassNode
		ifTrue: [^self extraMethodsForClassNode: aClassDescriptionNode]
		ifFalse: [^self extraMethodsForMetaclassNode: aClassDescriptionNode]
!
(reader addMethod: 'As yet unclassified')
!
extraMethodsForClassNode: aClassNode {ClassNode} {^Arr[MethodNode]}
	^Array with: (UnaryMethodNode
				selector: 'class'
				body: (SequenceNode
						statement: (ReturnNode value: (VariableNode name: aClassNode name asString)))
				returnType: nil
				pragmas: #()
				protocol: 'extra')
!
(reader addMethod: 'As yet unclassified')
!
extraMethodsForMetaclassNode: aMetaclassNode {MetaclassNode} {^Arr[MethodNode]}
	| javaClassReference {AbsoluteReference} |
	javaClassReference := aMetaclassNode classNode javaClassReference.
	javaClassReference isNil ifTrue: [javaClassReference := aMetaclassNode reference nonmeta].
	^Array with: (UnaryMethodNode
				selector: 'basicNew'
				body: (SequenceNode
						statement: (ReturnNode value: (InstanceCreationNode reference: javaClassReference)))
				returnType: nil
				pragmas: #()
				protocol: 'extra')
!
(reader addMethod: 'As yet unclassified')
!
findSourceFile: methodNodes {Arr[MethodNode]} {^SourceFile | Nil}
	methodNodes
		do: [:each {MethodNode} | each sourcePosition isNil ifFalse: [^each sourcePosition sourceFile]].
	^nil
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	selectorConverter := SelectorConverter new.
	toInitialize := OrderedCollection new.
	isStaticOverride := false
!
(reader addMethod: 'accessing')
!
initializeClassShareds: aMetaclassNode {MetaclassNode} {^Self}
	aMetaclassNode sharedVariables do: 
			[:sharedVariable {SharedDeclarationNode} |
			| reference {AbsoluteReference} |
			reference := aMetaclassNode reference nonmeta / sharedVariable name asSymbol.
			systemMapping singletonAtReference: reference initialize: sharedVariable]
!
(reader addMethod: 'initialize-release')
!
initializeSystemMapping: aSystemMapping {SystemMapping} compilerTools: aSystemMappingCompilerTools {SystemMappingCompilerTools} {^Self}
	systemMapping := aSystemMapping.
	compilerTools := aSystemMappingCompilerTools.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isStaticOverride: aBoolean {Bool} while: aBlock {[^Self]} {^Self}
	| old {Bool} |
	isStaticOverride = (aBoolean | isStaticOverride) ifTrue: [^aBlock value].
	old := isStaticOverride.
	isStaticOverride := aBoolean | isStaticOverride.
	aBlock value.
	isStaticOverride := old
!
(reader addMethod: 'accessing')
!
link {^Self}
	systemMapping classMappingsDo: 
			[:classMapping {ClassMapping} |
			| identityClass {JavaClass} |
			classMapping classNode isMeta
				ifTrue: [self initializeClassShareds: classMapping classNode].
			identityClass := classMapping identityClass.
			classMapping classNode isMeta
				ifTrue: 
					[systemMapping singletonAtReference: classMapping reference nonmeta
						ifAbsentPut: [compilerTools createSingletonForClass: identityClass]]].
	compilerTools resetCallsites.
	systemMapping namespaceGlobalsAndInitializersDo: 
			[:reference {AbsoluteReference} :sharedVariable {SharedDeclarationNode} |
			systemMapping singletonAtReference: reference initialize: sharedVariable].
	toInitialize do: 
			[:ref {Reference} |
			compilerTools initializeClass: (systemMapping classMappingAtReference: ref)
				systemMapping: systemMapping].
	toInitialize := OrderedCollection new
!
(reader addMethod: 'As yet unclassified')
!
linkMethods: methods {Array[MethodNode]} in: javaClass {JavaClass} identityClass: identityClass {JavaClass} to: cpm {ClassPartMapping} isStatic: isStatic {Bool} {^ClassPartMapping}
	| ecm {ClassPartMapping} |
	ecm := cpm.
	methods do: 
			[:m {MethodNode} |
			| fn {Str} methodHandle {JavaMethodHandle} selector {Sym} |
			selector := m selector asSymbol.
			fn := selectorConverter selectorAsFunctionName: selector.
			methodHandle := compilerTools
						methodHandleAt: fn
						numArgs: selector numArgs
						in: javaClass
						identityClass: identityClass
						isStatic: isStatic.
			ecm := ecm withMethodMapping: (MethodMapping
								methodNode: m
								methodHandle: methodHandle
								definingClass: javaClass)].
	^ecm
!
(reader addMethod: 'As yet unclassified')
!
localLink: node {Node} instVars: instVars {Arr[BoundVariableDeclarationNode]} ownerReference: ownerReference {Reference} owner: owner {Expression} {^Node}
	| intermediate {Node} nonLocal {Node} holderized {Node} fieldAccessed {Node} instVarNames {Arr[Str]} |
	instVarNames := instVars collect: [:each {BoundVariableDeclarationNode} | each name].
	intermediate := IntermediateNodeRewriter visit: node.
	nonLocal := (NonLocalReturnRewriter nlrMarker: compilerTools nextNlrMarker)
				visit: intermediate.
	holderized := NonLocalTempWritesToHolderConverter visit: nonLocal.
	fieldAccessed := (VariableAccessToFieldAccessConverter
				instVarNames: instVarNames
				owner: owner
				ownerReference: ownerReference) visit: holderized.
	^fieldAccessed
!
(reader addMethod: 'As yet unclassified')
!
localLinkMethods: methods {Arr[MethodNode]} instVars: instVars {Arr[BoundVariableDeclarationNode]} ownerReference: ownerReference {Reference} {^Arr[MethodNode]}
	| owner {SelfNode} |
	owner := SelfNode new.
	^methods collect: 
			[:m {MethodNode} |
			| fieldAccessed {MethodNode} |
			fieldAccessed := self
						localLink: m
						instVars: instVars
						ownerReference: ownerReference
						owner: owner.
			fieldAccessed]
!
(reader addMethod: 'As yet unclassified')
!
methods: methods {Arr[MethodNode]} withExtraMethods: extraMethods {Arr[MethodNode]} {^Arr[MethodNode]}
	| selectors {Set[Str]} n {OrderedCollection[MethodNode]} |
	selectors := Set new.
	n := OrderedCollection new.
	methods do: 
			[:each {MethodNode} |
			(selectors includes: each selector)
				ifFalse: 
					[selectors add: each selector.
					n add: each]].
	extraMethods do: 
			[:each {MethodNode} |
			(selectors includes: each selector)
				ifFalse: 
					[selectors add: each selector.
					n add: each]].
	^n asArray
!
(reader addMethod: 'As yet unclassified')
!
methodsToRecompile: allMethods {Arr[MethodNode]} in: superclassReference {Reference} {^Arr[MethodNode]}
	| methodsToRecompile {OrdColl[MethodNode]} selectors {Set[Str]} |
	selectors := Set new.
	methodsToRecompile := OrderedCollection new.
	allMethods do: [:each {MethodNode} | selectors add: each selector].
	self compiledMethodNodesIn: superclassReference
		do: 
			[:methodNode {MethodNode} |
			| clean {MethodNode} |
			(selectors includes: methodNode selector)
				ifFalse: 
					[clean := methodNode withoutSourcePointers.
					methodsToRecompile add: clean]].
	^methodsToRecompile asArray
!
(reader addMethod: 'As yet unclassified')
!
setNamespaceNodes: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	systemMapping setNamespaceNodes: aDictionary
!
(reader addMethod: 'accessing')
!
systemMapping {^SystemMapping}
	^systemMapping
!
(reader addMethod: 'visiting')
!
visitAddClassDiff: anAddClassDiff {AddClassDiff} {^Self}
	self compileClassDescriptionNode: anAddClassDiff classNode
		isStatic: anAddClassDiff isStatic | isStaticOverride.
	self compileClassDescriptionNode: anAddClassDiff classNode metaclassNode.
	toInitialize add: anAddClassDiff classNode metaclassNode reference
!
(reader addMethod: 'visiting')
!
visitRemoveClassDiff: anObject {RemoveClassDiff} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Self}
	self executeUpdateClassDescriptorDiff: anUpdateClassDiff thisDiff
		reference: anUpdateClassDiff reference.
	self executeUpdateClassDescriptorDiff: anUpdateClassDiff metaDiff
		reference: anUpdateClassDiff reference meta
!
(reader addMethod: 'visiting')
!
visitWrapJavaclassDiff: aWrapJavaclassDiff {WrapJavaclassDiff} {^Self}
	| identityMapping {IdentityClassPartMapping} ecm {ExtensionClassPartMapping} allMethods {Arr[MethodNode]} extraMethods {Arr[MethodNode]} ecdn {ClassDescriptionNode} |
	identityMapping := IdentityClassPartMapping
				javaClass: (compilerTools findJavaClass: aWrapJavaclassDiff classNode javaClassPath)
				isGenerated: false.
	extraMethods := self extraMethodsFor: aWrapJavaclassDiff classNode.
	ecdn := aWrapJavaclassDiff classNode withExtraMethods: extraMethods.
	allMethods := self methods: aWrapJavaclassDiff classNode methods
				withExtraMethods: extraMethods.
	ecm := self
				compileExtensionClassPartMapping: ecdn
				methods: allMethods
				identityClass: identityMapping javaClass
				instVars: #()
				sourceFile: aWrapJavaclassDiff classNode findSourceFile.
	systemMapping addClassMapping: (ClassMapping
				identityMapping: identityMapping
				extensions: (Array with: ecm)
				instVarMappings: Dictionary new
				classNode: aWrapJavaclassDiff classNode).
	self compileClassDescriptionNode: aWrapJavaclassDiff classNode metaclassNode.
	toInitialize add: aWrapJavaclassDiff classNode metaclassNode reference
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[SystemMapping, SystemMappingCompilerTools, SelectorConverter, OrderedCollection[Reference], Bool]}
	^#('systemMapping' 'compilerTools' 'selectorConverter' 'toInitialize' 'isStaticOverride')
!
(reader addClassMethod: 'instance creation')
!
systemMapping: aSystemMapping {SystemMapping} compilerTools: aSystemMappingCompilerTools {SystemMappingCompilerTools} {^SystemMappingUpdater}
	^self new initializeSystemMapping: aSystemMapping
		compilerTools: aSystemMappingCompilerTools
!
