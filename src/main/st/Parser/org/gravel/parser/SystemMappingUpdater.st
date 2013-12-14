(reader defineClass: 'SystemMappingUpdater' superclass: 'org.gravel.parser.DiffVisitor')
!
(reader addInstVar: 'systemMapping')
!
(reader addInstVar: 'compilerTools')
!
(reader addInstVar: 'selectorConverter')
!
(reader addInstVar: 'toInitialize')
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
	| identityClass {JavaClass} identityMapping {IdentityClassPartMapping} localLinkedMethods {Arr[MethodNode]} superclassReference {Reference | Nil} superclass {JavaClass} allMethods {Arr[MethodNode]} superInstVars {Arr[BoundVariableDeclarationNode]} allInstVars {Arr[BoundVariableDeclarationNode]} |
	allMethods := self methods: aClassDescriptionNode methods
				withExtraMethods: (self extraMethodsFor: aClassDescriptionNode).
	superclassReference := aClassDescriptionNode superclassReference.
	superclassReference isNil
		ifTrue: 
			[self assert: aClassDescriptionNode reference isMeta.
			superclass := compilerTools javaClassSuperclass]
		ifFalse: [superclass := self classForSuperOf: superclassReference].
	superInstVars := self allInstVarsForReference: superclassReference.
	allInstVars := superInstVars copyWithAll: aClassDescriptionNode boundInstVars.
	localLinkedMethods := self
				localLinkMethods: allMethods
				instVars: allInstVars
				ownerReference: aClassDescriptionNode reference.
	identityClass := compilerTools
				compileJavaClass: aClassDescriptionNode reference
				name: (compilerTools referenceAsClassName: aClassDescriptionNode reference)
				superclass: superclass
				methods: localLinkedMethods
				instVars: aClassDescriptionNode boundInstVars
				allInstVars: allInstVars
				instVarOwners: (self getInstVarOwners: superInstVars)
				sourceFile: aClassDescriptionNode findSourceFile.
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
	| extensionClass {JavaClass} identityMapping {IdentityClassPartMapping} localLinkedMethods {Arr[MethodNode]} allMethods {Arr[MethodNode]} boundInstVars {Arr[BoundVariableDeclarationNode]} allInstVars {Arr[BoundVariableDeclarationNode]} superInstVars {Arr[BoundVariableDeclarationNode]} |
	allMethods := self methods: aClassDescriptionNode methods
				withExtraMethods: (self extraMethodsFor: aClassDescriptionNode).
	boundInstVars := aClassDescriptionNode boundInstVars.
	superInstVars := self allInstVarsForReference: aClassDescriptionNode superclassReference.
	allInstVars := superInstVars copyWithAll: boundInstVars.
	localLinkedMethods := self
				localLinkMethods: allMethods
				instVars: allInstVars
				ownerReference: aClassDescriptionNode reference.
	extensionClass := compilerTools
				compileExtensionJavaClass: aClassDescriptionNode reference
				prefix: (compilerTools referenceAsClassName: aClassDescriptionNode reference)
				methods: localLinkedMethods
				identityClass: nil
				instVars: boundInstVars
				allInstVars: allInstVars
				instVarOwners: Dictionary new
				sourceFile: aClassDescriptionNode findSourceFile.
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
	| extensionClass {JavaClass} localLinkedMethods {Arr[MethodNode]} namePrefix {Str} superInstVars {Arr[BoundVariableDeclarationNode]} allInstVars {Arr[BoundVariableDeclarationNode]} |
	namePrefix := compilerTools referenceAsClassName: aClassDescriptionNode reference.
	superInstVars := self allInstVarsForReference: aClassDescriptionNode superclassReference.
	allInstVars := superInstVars copyWithAll: boundInstVars.
	localLinkedMethods := self
				localLinkMethods: extensionMethods
				instVars: allInstVars
				ownerReference: aClassDescriptionNode reference.
	extensionClass := compilerTools
				compileExtensionJavaClass: aClassDescriptionNode reference
				prefix: namePrefix
				methods: localLinkedMethods
				identityClass: identityClass
				instVars: boundInstVars
				allInstVars: allInstVars
				instVarOwners: (self getInstVarOwners: allInstVars)
				sourceFile: sourceFile.
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
(reader addMethod: 'As yet unclassified')
!
getInstVarOwners: allInstVars {Arr[BoundVariableDeclarationNode]} {^Dict[Reference, JavaClass]}
	| instVarOwners {Dict[Reference, JavaClass]} |
	instVarOwners := Dictionary new.
	allInstVars do: 
			[:each {BoundVariableDeclarationNode} |
			instVarOwners at: each ownerType
				ifAbsentPut: [(systemMapping classMappingAtReference: each ownerType) identityClass]].
	^instVarOwners
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	selectorConverter := SelectorConverter new.
	toInitialize := OrderedCollection new
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
(reader addMethod: 'accessing')
!
link {^Self}
	systemMapping classMappingsDo: 
			[:classMapping {ClassMapping} |
			classMapping classNode isMeta
				ifTrue: [self initializeClassShareds: classMapping classNode].
			compilerTools linkInNamespace: classMapping systemMapping: systemMapping].
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
localLink: node {Node} instVarNames: instVarNames {Arr[Str]} owner: owner {Expression} ownerReference: ownerReference {Reference} {^Node}
	| intermediate {Node} nonLocal {Node} holderized {Node} fieldAccessed {Node} |
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
(reader addMethod: 'As yet unclassified')
!
visitAddClassDiff: anAddClassDiff {AddClassDiff} {^Self}
	self compileClassDescriptionNode: anAddClassDiff classNode
		isStatic: anAddClassDiff isStatic.
	self compileClassDescriptionNode: anAddClassDiff classNode metaclassNode.
	toInitialize add: anAddClassDiff classNode metaclassNode reference
!
(reader addMethod: 'visiting')
!
visitAddMethodDiff: anObject {AddMethodDiff} {^Self}
	^self visit: anObject asClassDiff
!
(reader addMethod: 'As yet unclassified')
!
visitBranchDiff: aBranchDiff {BranchDiff} {^Self}
	self visit: aBranchDiff root.
	aBranchDiff children do: [:ch {Diff} | self visit: ch]
!
(reader addMethod: 'As yet unclassified')
!
visitClassDiffs: aClassDiffs {ClassDiffs} {^Self}
	aClassDiffs classDiffs do: [:each {Diff} | self visit: each]
!
(reader addMethod: 'visiting')
!
visitEmptyDiff: anObject {EmptyDiff} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitRemoveClassDiff: anObject {RemoveClassDiff} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
visitUpdateClassDiff: anUpdateClassDiff {UpdateClassDiff} {^Self}
	| ecm {ExtensionClassPartMapping} cm {ClassMapping} ncn {ClassDescriptionNode} methods {Arr[MethodNode]} |
	cm := systemMapping classMappingAtReference: anUpdateClassDiff reference.
	cm := anUpdateClassDiff updatedMethodNodes inject: cm
				into: [:classMapping {ClassMapping} :methodNode {MethodNode} | classMapping withoutMethodMapping: methodNode selector].
	cm := anUpdateClassDiff deletedSelectors inject: cm
				into: [:classMapping {ClassMapping} :selector {Str} | classMapping withoutMethodMapping: selector].
	ncn := anUpdateClassDiff applyOnClassNode: cm classNode.
	methods := anUpdateClassDiff methodNodes
				copyWithAll: anUpdateClassDiff updatedMethodNodes.
	ecm := self
				compileExtensionClassPartMapping: ncn
				methods: methods
				identityClass: cm identityClass
				instVars: cm classNode boundInstVars
				sourceFile: (self findSourceFile: anUpdateClassDiff methodNodes).
	systemMapping addClassMapping: ((cm withClassNode: ncn) withExtension: ecm)
!
(reader addMethod: 'visiting')
!
visitUpdateMethodDiff: anObject {UpdateMethodDiff} {^Self}
	^self visit: anObject asClassDiff
!
(reader addMethod: 'As yet unclassified')
!
visitWrapJavaclassDiff: aWrapJavaclassDiff {WrapJavaclassDiff} {^Self}
	| identityMapping {IdentityClassPartMapping} ecm {ExtensionClassPartMapping} allMethods {Arr[MethodNode]} |
	identityMapping := IdentityClassPartMapping
				javaClass: (compilerTools findJavaClass: aWrapJavaclassDiff classNode javaClassPath)
				isGenerated: false.
	allMethods := self methods: aWrapJavaclassDiff classNode methods
				withExtraMethods: (self extraMethodsFor: aWrapJavaclassDiff classNode).
	ecm := self
				compileExtensionClassPartMapping: aWrapJavaclassDiff classNode
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
instVarTypes {^[SystemMapping, SystemMappingCompilerTools, SelectorConverter, OrderedCollection[Reference]]}
	^#('systemMapping' 'compilerTools' 'selectorConverter' 'toInitialize')
!
(reader addClassMethod: 'instance creation')
!
systemMapping: aSystemMapping {SystemMapping} compilerTools: aSystemMappingCompilerTools {SystemMappingCompilerTools} {^SystemMappingUpdater}
	^self new initializeSystemMapping: aSystemMapping
		compilerTools: aSystemMappingCompilerTools
!
