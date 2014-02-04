(reader defineClass: 'SystemMapping' superclass: 'st.gravel.support.compiler.ast.AbstractMapping')
!
(reader addInstVar: 'systemNode' type: 'SystemNode')
!
(reader addInstVar: 'compilerTools' type: 'SystemMappingCompilerTools')
!
(reader addInstVar: 'classMappingsByJavaClass' type: 'Dictionary[JavaClass, ClassMapping]')
!
(reader addInstVar: 'classMappingsByReference' type: 'Dictionary[Reference, AbstractClassMapping]')
!
(reader addInstVar: 'singletonHolders' type: 'Dictionary[AbsoluteReference, AlmostFinalValue]')
!
(reader addInstVar: 'selectorConverter' type: 'SelectorConverter')
!
(reader addInstVar: 'nilClassMapping' type: 'ClassMapping')
!
(reader addInstVar: 'systemDefinitionNode' type: 'SystemDefinitionNode')
!
(reader addInstVar: 'subclassMappingsCache' type: 'Dictionary[Reference, Set[AbstractClassMapping]]')
!
(reader addMethod: 'As yet unclassified')
!
addClassMapping: aClassMapping {ClassMapping} {^ClassMapping}
	| identityClass {JavaClass} |
	identityClass := aClassMapping identityClass.
	identityClass isNil
		ifTrue: 
			[self assert: aClassMapping classNode isNilClass.
			nilClassMapping := aClassMapping]
		ifFalse: [classMappingsByJavaClass at: identityClass put: aClassMapping].
	classMappingsByReference at: aClassMapping classNode reference put: aClassMapping.
	systemNode := systemNode withClassDescriptionNode: aClassMapping classNode.
	self resetCache.
	^aClassMapping
!
(reader addMethod: 'As yet unclassified')
!
applyDiff: aSystemDiff {SystemDiff} {^Self}
	| updater {SystemMappingUpdater} |
	updater := self newSystemMappingUpdater.
	aSystemDiff classDiffs do: [:each {ClassDiff} | updater visit: each].
	updater setNamespaceNodes: aSystemDiff namespaces.
	updater link
!
(reader addMethod: 'As yet unclassified')
!
bestClassMappingFor: receiverClass {JavaClass} {^ClassMapping}
	| best {ClassMapping | Nil} |
	best := nil.
	self concreteClassMappingsDo: 
			[:cm {ClassMapping} |
			(compilerTools isAssignable: cm identityClass from: receiverClass)
				ifTrue: 
					[best isNil
						ifTrue: [best := cm]
						ifFalse: 
							[(compilerTools isAssignable: best identityClass from: cm identityClass)
								ifTrue: [best := cm]]]].
	^best
!
(reader addMethod: 'As yet unclassified')
!
buildSubclassMappingsCache {^Self}
	subclassMappingsCache := Dictionary new.
	classMappingsByReference do: 
			[:each {AbstractClassMapping} |
			| scr {Reference} |
			scr := each superclassReference.
			scr isNil ifFalse: [(subclassMappingsCache at: scr ifAbsentPut: [Set new]) add: each]]
!
(reader addMethod: 'As yet unclassified')
!
classMappingAtJavaClass: aClass {JavaClass} ifAbsent: absentBlock {[^ClassMapping]} {^ClassMapping}
	aClass isNil ifTrue: [^nilClassMapping].
	^classMappingsByJavaClass at: aClass ifAbsent: absentBlock
!
(reader addMethod: 'As yet unclassified')
!
classMappingAtReference: aReference {Reference} {^AbstractClassMapping}
	^self classMappingAtReference: aReference
		ifAbsent: [self error: 'Cannot find: ' , aReference printString]
!
(reader addMethod: 'As yet unclassified')
!
classMappingAtReference: aReference {Reference} ifAbsent: absentBlock {[^AbstractClassMapping]} {^AbstractClassMapping}
	^classMappingsByReference at: aReference ifAbsent: absentBlock
!
(reader addMethod: 'As yet unclassified')
!
classMappingForJavaClass: receiverClass {JavaClass} {^ClassMapping}
	^self classMappingAtJavaClass: receiverClass
		ifAbsent: 
			[| newClassMapping {ClassMapping} |
			newClassMapping := self newClassMappingForJavaClass: receiverClass.
			classMappingsByJavaClass at: receiverClass put: newClassMapping.
			newClassMapping]
!
(reader addMethod: 'As yet unclassified')
!
classMappingsDo: aBlock {[AbstractClassMapping, ^Object]} {^Self}
	classMappingsByReference do: aBlock
!
(reader addMethod: 'accessing')
!
classSharedSingletonHolderAtReference: reference {AbsoluteReference} ifAbsent: aBlock {[^AlmostFinalValue]} {^AlmostFinalValue}
	^singletonHolders at: reference
		ifAbsent: 
			[singletonHolders at: reference namespace namespace / reference name
				ifAbsent: 
					[| cm {AbstractClassMapping} superclassReference {AbsoluteReference} sharedVariable {SharedDeclarationNode} |
					cm := classMappingsByReference at: reference namespace ifAbsent: [^aBlock value].
					sharedVariable := cm classNode meta sharedVariableAt: reference name asString
								ifAbsent: [nil].
					sharedVariable isNil
						ifFalse: [self error: 'Shared not initialized: ' , reference printString].
					superclassReference := cm superclassReference.
					superclassReference isNil ifTrue: [^aBlock value].
					self classSharedSingletonHolderAtReference: superclassReference / reference name
						ifAbsent: aBlock]]
!
(reader addMethod: 'As yet unclassified')
!
compileAndWriteExpression: anExpression {Node} reference: aReference {Reference} {^JavaClass}
	| jvmClasses {Arr[JVMClass]} |
	jvmClasses := self compileExpression: anExpression reference: aReference.
	^self compileJVMClasses: jvmClasses
!
(reader addMethod: 'As yet unclassified')
!
compileExpression: anExpression {Node} reference: aReference {Reference} {^Arr[JVMClass]}
	| ownerType {JVMDefinedObjectType} fieldAccessed {BlockNode} aBlockInnerClass {BlockInnerClass} intermediate {BlockNode} holderized {BlockNode} jvmClassCompiler {JVMClassCompiler} blockClass {JVMClass} |
	intermediate := IntermediateNodeRewriter visit: (BlockNode expression: anExpression).
	holderized := NonLocalTempWritesToHolderConverter visit: intermediate.
	fieldAccessed := (VariableAccessToFieldAccessConverter
				instVarNames: #()
				owner: NilLiteralNode new
				ownerReference: aReference) visit: holderized.
	ownerType := JVMDefinedObjectType
				dottedClassName: 'Expression$' , compilerTools nextExtensionPostfix.
	aBlockInnerClass := BlockInnerClass
				ownerType: ownerType
				blockNode: fieldAccessed
				copiedVariables: #().
	jvmClassCompiler := JVMClassCompiler
				classDescriptionNode: nil
				systemNode: systemNode
				systemMappingUpdater: self newSystemMappingUpdater
				isStatic: false.
	jvmClassCompiler ownerType: (JVMDefinedObjectType
				dottedClassName: 'ExpressionContainer$' , compilerTools nextExtensionPostfix).
	blockClass := jvmClassCompiler compileBlockNoAdd: aBlockInnerClass.
	^jvmClassCompiler withContainerAndExtraClasses: blockClass
!
(reader addMethod: 'As yet unclassified')
!
compileExpressionSource: source {Str} {^Arr[JVMClass]}
	^self compileExpression: (Parser parseExpression: source)
		reference: (Reference value: 'st.gravel.lang.UndefinedObject')
!
(reader addMethod: 'As yet unclassified')
!
compileInlinedMethod: aMethodNode {MethodNode} selfType: selfType {JVMNonPrimitiveType} allowBlockInlining: allowBlockInlining {Bool} {^JavaClass | Nil}
	| jvmClassCompiler {JVMClassCompiler} inlinedMethodClass {JVMClass} jvmClasses {Arr[JVMClass]} |
	jvmClassCompiler := JVMClassCompiler
				classDescriptionNode: nil
				systemNode: systemNode
				systemMappingUpdater: self newSystemMappingUpdater
				isStatic: true.
	jvmClassCompiler
		allowBlockInlining: allowBlockInlining;
		selfType: selfType;
		superType: JVMDefinedObjectType object.
	jvmClassCompiler ownerType: (JVMDefinedObjectType
				dottedClassName: 'InlinedMethod$' , compilerTools nextExtensionPostfix).
	inlinedMethodClass := jvmClassCompiler compileInlinedMethod: aMethodNode.
	jvmClasses := jvmClassCompiler extraClasses copyWith: inlinedMethodClass.
	^self compileJVMClasses: jvmClasses
!
(reader addMethod: 'As yet unclassified')
!
compileJVMClasses: jvmClasses {Arr[JVMClass]} {^JavaClass | Nil}
	| last {JavaClass | Nil} |
	last := nil.
	jvmClasses do: [:jvmClass {JVMClass} | last := compilerTools writeClass: jvmClass].
	jvmClasses do: [:jvmClass {JVMClass} | compilerTools runAstInit: jvmClass].
	^last
!
(reader addMethod: 'accessing')
!
compilerTools {^SystemMappingCompilerTools}
	^compilerTools
!
(reader addMethod: 'As yet unclassified')
!
concreteClassMappingsDo: aBlock {[ClassMapping, ^Object]} {^Self}
	classMappingsByReference
		do: [:acm {AbstractClassMapping} | aBlock value: ({ClassMapping} acm)]
!
(reader addMethod: 'As yet unclassified')
!
definitionClassNodeAt: reference {Reference} ifAbsent: aBlock {[^ClassDescriptionNode]} {^ClassDescriptionNode}
	reference isMeta
		ifTrue: 
			[^({ClassNode} self definitionClassNodeAt: reference nonmeta ifAbsent: [^aBlock value])
				metaclassNode].
	^systemDefinitionNode classNodeAt: reference ifAbsent: [^aBlock value]
!
(reader addMethod: 'As yet unclassified')
!
definitionOrObsoleteClassNodeAt: reference {Reference} {^ClassDescriptionNode}
	^self definitionOrObsoleteClassNodeAt: reference
		ifAbsent: [self error: 'Cannot find: ' , reference printString]
!
(reader addMethod: 'As yet unclassified')
!
definitionOrObsoleteClassNodeAt: reference {Reference} ifAbsent: aBlock {[^ClassDescriptionNode]} {^ClassDescriptionNode}
	^self definitionClassNodeAt: reference
		ifAbsent: 
			[self obsoleteClassNodeAt: reference
				ifAbsent: [self error: 'Cannot find: ' , reference printString]]
!
(reader addMethod: 'As yet unclassified')
!
evaluateExpression: anExpression {Expression} reference: aReference {AbsoluteReference} {^Obj}
	| cl {JavaClass} |
	cl := self compileAndWriteExpression: anExpression reference: aReference.
	^compilerTools evaluateBlock0Class: cl
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	classMappingsByJavaClass := Dictionary new.
	classMappingsByReference := Dictionary new.
	singletonHolders := Dictionary new.
	selectorConverter := SelectorConverter new
!
(reader addMethod: 'initialize-release')
!
initializeSystemNode: aSystemNode {SystemNode} compilerTools: aMockSystemMappingCompilerTools {SystemMappingCompilerTools} {^Self}
	systemNode := aSystemNode.
	compilerTools := aMockSystemMappingCompilerTools.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
log: aString {Str} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
log: aString {Str} while: aBlock {[^Object]} {^Self}
	| ms {Int} |
	self log: aString , '...'.
	ms := aBlock millisecondsToRun.
	self log: aString , ' Done in ' , ms printString , ' ms'
!
(reader addMethod: 'As yet unclassified')
!
methodHandleFor: receiverClass {JavaClass} methodName: methodName {Str} {^JavaMethodHandle | Nil}
	| sel {Sym} classMapping {ClassMapping} |
	classMapping := self classMappingForJavaClass: receiverClass.
	sel := selectorConverter functionNameAsSelector: methodName.
	^self methodHandleFrom: classMapping selector: sel
!
(reader addMethod: 'As yet unclassified')
!
methodHandleForNil: methodName {Str} {^JavaMethodHandle | Nil}
	| sel {Sym} classMapping {ClassMapping} |
	classMapping := self nilClassMapping.
	sel := selectorConverter functionNameAsSelector: methodName.
	^self methodHandleFrom: classMapping selector: sel
!
(reader addMethod: 'As yet unclassified')
!
methodHandleFrom: classMapping {ClassMapping} selector: sel {Sym} {^JavaMethodHandle | Nil}
	| methodMapping {AbstractMethodMapping | Nil} |
	methodMapping := self methodMappingFrom: classMapping selector: sel.
	methodMapping isNil ifTrue: [^nil].
	^methodMapping methodHandle
!
(reader addMethod: 'As yet unclassified')
!
methodMappingFor: receiverClass {JavaClass} methodName: methodName {Str} {^MethodMapping | Nil}
	| sel {Sym} classMapping {ClassMapping} |
	classMapping := self classMappingForJavaClass: receiverClass.
	sel := selectorConverter functionNameAsSelector: methodName.
	^self methodMappingFrom: classMapping selector: sel
!
(reader addMethod: 'As yet unclassified')
!
methodMappingForNil: methodName {Str} {^MethodMapping | Nil}
	| sel {Sym} classMapping {ClassMapping} |
	classMapping := self nilClassMapping.
	sel := selectorConverter functionNameAsSelector: methodName.
	^self methodMappingFrom: classMapping selector: sel
!
(reader addMethod: 'As yet unclassified')
!
methodMappingFrom: classMapping {ClassMapping} selector: sel {Sym} {^AbstractMethodMapping | Nil}
	^classMapping methodMappingAt: sel
		ifAbsent: 
			[| superclassReference {Reference} mapping {AbstractMethodMapping | Nil} |
			superclassReference := classMapping superclassReferenceForMethodLookup.
			superclassReference isNil
				ifTrue: [mapping := nil]
				ifFalse: 
					[mapping := self methodMappingFrom: (self classMappingAtReference: superclassReference)
								selector: sel].
			mapping]
!
(reader addMethod: 'accessing')
!
namespacedSingletonHolderAtReference: reference {AbsoluteReference} ifAbsent: aBlock {[^AlmostFinalValue]} {^AlmostFinalValue}
	| nsNode {NamespaceNode} |
	nsNode := systemNode namespaceNodeAt: reference namespace namespace ifAbsent: [nil].
	nsNode isNil
		ifFalse: 
			[nsNode allImportsIn: systemNode
				do: 
					[:importNS {NamespaceNode} |
					| sh {AlmostFinalValue} shared {SharedDeclarationNode} |
					shared := importNS sharedVariableAt: reference name asString ifAbsent: [nil].
					shared isNil
						ifFalse: [^self singletonAtReference: importNS reference / reference name initialize: shared].
					sh := singletonHolders at: importNS reference / reference name ifAbsent: [nil].
					sh isNil ifFalse: [^sh]]].
	^aBlock value
!
(reader addMethod: 'As yet unclassified')
!
namespaceGlobalsAndInitializersDo: aBlock {[AbsoluteReference, SharedDeclarationNode, ^Object]} {^Self}
	systemNode namespaceNodes keysAndValuesDo: 
			[:reference {Reference} :namespaceNode {NamespaceNode} |
			namespaceNode sharedVariables do: 
					[:sharedVariable {SharedDeclarationNode} |
					aBlock value: ({AbsoluteReference} reference) / sharedVariable name asSymbol
						value: sharedVariable]]
!
(reader addMethod: 'As yet unclassified')
!
newClassMappingForJavaClass: receiverClass {JavaClass} {^ClassMapping}
	| methodMappings {Dict[Sym, AbstractMethodMapping]} classNode {ClassNode} superMapping {ClassMapping} allSelectors {Set[Sym]} |
	superMapping := self bestClassMappingFor: receiverClass.
	allSelectors := superMapping allSelectorsIn: self.
	methodMappings := Dictionary new.
	compilerTools methodNamesIn: receiverClass
		do: 
			[:methodName {Str} :numArgs {Int} |
			| sel {Sym} |
			sel := selectorConverter functionNameAsSelector: methodName.
			(sel numArgs = numArgs and: [allSelectors includes: sel])
				ifTrue: 
					[| methodHandle {JavaMethodHandle} |
					methodHandle := compilerTools
								methodHandleAt: methodName
								numArgs: sel numArgs
								in: receiverClass
								identityClass: receiverClass
								isStatic: false.
					methodHandle isNil
						ifFalse: 
							[methodMappings at: sel
								put: (AnonymousMethodMapping methodHandle: methodHandle definingClass: receiverClass)]]].
	classNode := ClassNode
				name: superMapping classNode name
				superclassPath: superMapping reference printString
				properties: Dictionary new
				instVars: #()
				classInstVars: #()
				sharedVariables: #()
				methods: #()
				classMethods: #()
				namespace: superMapping classNode namespace
				isExtension: false
				isTrait: false
				traitUsage: EmptyTraitUsageNode new
				classTraitUsage: EmptyTraitUsageNode new.
	^ClassMapping
		identityMapping: ((IdentityClassPartMapping javaClass: receiverClass isGenerated: false)
				withMethodMappings: methodMappings)
		extensions: #()
		instVarMappings: Dictionary new
		classNode: classNode
!
(reader addMethod: 'As yet unclassified')
!
newSystemMappingUpdater {^SystemMappingUpdater}
	^SystemMappingUpdater systemMapping: self compilerTools: compilerTools
!
(reader addMethod: 'accessing')
!
nilClassMapping {^ClassMapping}
	^nilClassMapping
!
(reader addMethod: 'As yet unclassified')
!
obsoleteClassNodeAt: aReference {Reference} ifAbsent: absentBlock {[^ClassDescriptionNode]} {^ClassDescriptionNode}
	^(self classMappingAtReference: aReference ifAbsent: [^absentBlock value]) classNode
!
(reader addMethod: 'As yet unclassified')
!
packageNames {^Arr[Sym]}
	^systemDefinitionNode packageNames
!
(reader addMethod: 'As yet unclassified')
!
resetCache {^Self}
	subclassMappingsCache := nil
!
(reader addMethod: 'accessing')
!
resolveSingletonHolder: reference {AbsoluteReference} {^AlmostFinalValue}
	^self resolveSingletonHolder: reference
		ifAbsent: [self error: 'Singleton not found:' , reference printString]
!
(reader addMethod: 'accessing')
!
resolveSingletonHolder: reference {AbsoluteReference} ifAbsent: aBlock {[^AlmostFinalValue]} {^AlmostFinalValue}
	^self namespacedSingletonHolderAtReference: reference
		ifAbsent: [self classSharedSingletonHolderAtReference: reference ifAbsent: aBlock]
!
(reader addMethod: 'accessing')
!
selectorConverter {^SelectorConverter}
	^selectorConverter
!
(reader addMethod: 'As yet unclassified')
!
setNamespaceNodes: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	| dict {Dict[Reference, NamespaceNode]} |
	dict := Dictionary new.
	systemNode namespaceNodes
		syncWith: aDictionary
		thenDo: [:old {NamespaceNode} :new {NamespaceNode} | dict at: new reference put: (old mergeWith: new)]
		ifNew: [:nsNode {NamespaceNode} | dict at: nsNode reference put: nsNode]
		ifAbsent: [:nsNode {NamespaceNode} | dict at: nsNode reference put: nsNode].
	systemNode := systemNode withNamespaceNodes: dict
!
(reader addMethod: 'accessing')
!
singletonAtReference: reference {AbsoluteReference} {^Object}
	| holder {AlmostFinalValue} |
	holder := singletonHolders at: reference
				ifAbsent: [self error: 'Singleton not found:' , reference printString].
	^compilerTools valueOfSingletonHolder: holder
!
(reader addMethod: 'accessing')
!
singletonAtReference: reference {AbsoluteReference} ifAbsentInitialize: aBlock {[^Object]} {^AlmostFinalValue}
	^singletonHolders at: reference
		ifAbsentPut: [compilerTools newSingletonHolder: reference initializer: aBlock]
!
(reader addMethod: 'accessing')
!
singletonAtReference: reference {AbsoluteReference} ifAbsentPut: aBlock {[^Object]} {^AlmostFinalValue}
	^singletonHolders at: reference
		ifAbsentPut: [compilerTools newSingletonHolder: reference value: aBlock value]
!
(reader addMethod: 'accessing')
!
singletonAtReference: reference {AbsoluteReference} initialize: sharedVariable {SharedDeclarationNode} {^AlmostFinalValue}
	^self singletonAtReference: reference
		ifAbsentPut: 
			[sharedVariable initializer isNil
				ifTrue: [nil]
				ifFalse: [self evaluateExpression: sharedVariable initializer reference: reference]]
!
(reader addMethod: 'accessing')
!
singletonAtReferenceString: aString {Str} {^Object}
	^self singletonAtReference: (Reference value: aString)
!
(reader addMethod: 'As yet unclassified')
!
subclassMappingsFor: aReference {Reference} do: aBlock {[AbstractClassMapping, ^Object]} {^Self}
	| c {Set[AbstractClassMapping] | Nil} |
	subclassMappingsCache isNil ifTrue: [self buildSubclassMappingsCache].
	c := subclassMappingsCache at: aReference ifAbsent: [nil].
	c isNil ifTrue: [^nil].
	c do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
superMethodMappingFor: aReference {Reference} methodName: methodName {Str} {^AbstractMethodMapping | Nil}
	| sel {Sym} classMapping {ClassMapping} superclassReference {Reference} |
	classMapping := self classMappingAtReference: aReference.
	superclassReference := classMapping superclassReference.
	superclassReference isNil ifTrue: [^nil].
	sel := selectorConverter functionNameAsSelector: methodName.
	^self methodMappingFrom: (self classMappingAtReference: superclassReference) selector: sel
!
(reader addMethod: 'accessing')
!
systemDefinitionNode {^SystemDefinitionNode}
	^systemDefinitionNode
!
(reader addMethod: 'accessing')
!
systemNode {^SystemNode}
	^systemNode
!
(reader addMethod: 'As yet unclassified')
!
updateTo: newSystemDefinitionNode {SystemDefinitionNode} {^Self}
	| diff {SystemDiff} newSystemNode {SystemNode} |
	newSystemNode := (PackageNodeMerger systemDefinitionNode: newSystemDefinitionNode) load.
	self log: 'Calculating diff' while: [diff := systemNode diffTo: newSystemNode].
	self log: 'Applying diff' while: [self applyDiff: diff].
	systemDefinitionNode := newSystemDefinitionNode.
	self resetCache
!
(reader addClassMethod: 'instance creation')
!
systemNode: aSystemNode {SystemNode} compilerTools: aMockSystemMappingCompilerTools {SystemMappingCompilerTools} {^Instance}
	^self new initializeSystemNode: aSystemNode compilerTools: aMockSystemMappingCompilerTools
!
