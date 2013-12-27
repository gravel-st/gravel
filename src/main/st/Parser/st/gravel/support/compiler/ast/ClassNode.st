(reader defineClass: 'ClassNode' superclass: 'st.gravel.support.compiler.ast.ClassDescriptionNode')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'namespace')
!
(reader addInstVar: 'superclassPath')
!
(reader addInstVar: 'properties')
!
(reader addInstVar: 'isExtension')
!
(reader addInstVar: 'metaclassNode')
!
(reader addInstVar: 'isTrait')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self == anObject or: 
			[self class = anObject class and: 
					[name = anObject name and: 
							[namespace = anObject namespace
								and: [superclassPath = anObject superclassPath and: [properties = anObject properties]]]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitClassNode: self
!
(reader addMethod: 'As yet unclassified')
!
asTrait {^ClassNode}
	^(self copy)
		pvtSetTrait: true;
		yourself
!
(reader addMethod: 'As yet unclassified')
!
beExtension {^ClassNode}
	^(self copy)
		pvtSetExtension: true;
		pvtSetProperties: Dictionary new;
		yourself
!
(reader addMethod: 'accessing')
!
classMethods {^Arr[MethodNode]}
	^metaclassNode methods
!
(reader addMethod: 'accessing')
!
classTraitUsage {^TraitUsageNode}
	^metaclassNode traitUsage
!
(reader addMethod: 'As yet unclassified')
!
diffTo: aClassNode {ClassNode} {^UpdateClassDiff}
	aClassNode name = name ifFalse: [aClassNode halt].
	aClassNode namespace = namespace ifFalse: [aClassNode halt].
	aClassNode superclassPath = superclassPath ifFalse: [aClassNode halt].
	aClassNode properties = properties ifFalse: [aClassNode halt].
	aClassNode isExtension = isExtension ifFalse: [aClassNode halt].
	aClassNode isTrait = isTrait ifFalse: [aClassNode halt].
	^UpdateClassDiff
		reference: aClassNode reference
		superclassReference: aClassNode superclassReference
		thisDiff: (self diffToClassDescriptionNode: aClassNode)
		metaDiff: (metaclassNode diffToClassDescriptionNode: aClassNode metaclassNode)
!
(reader addMethod: 'As yet unclassified')
!
findSourceFile {^SourceFile}
	sourcePosition isNil ifFalse: [^sourcePosition sourceFile].
	metaclassNode sourcePosition isNil ifTrue: [^nil].
	^metaclassNode sourcePosition sourceFile
!
(reader addMethod: 'As yet unclassified')
!
flattenTraitsIn: aSystemNode {SystemNode} {^Self}
	| newMetaclassNode {MetaclassNode} newClassNode {ClassNode} |
	newMetaclassNode := metaclassNode flattenTraitsIn: aSystemNode.
	newClassNode := traitUsage flattenClassNode: self in: aSystemNode.
	(newClassNode == self and: [newMetaclassNode == metaclassNode]) ifTrue: [^self].
	^newClassNode copy pvtSetMetaclassNode: newMetaclassNode
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(((super hash bitXor: name hash) bitXor: namespace hash) bitXor: superclassPath hash)
		bitXor: properties hash
!
(reader addMethod: 'initialize-release')
!
initializeName: aSymbol {Sym} superclassPath: aString {Str} properties: aDictionary {Dict[Str, Str]} instVars: anArray {Arr[VariableDeclarationNode]} classInstVars: classInstVars {Arr[VariableDeclarationNode]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} methods: anOrderedCollection {Arr[MethodNode]} classMethods: classMethods {Arr[MethodNode]} namespace: anArray2 {Arr[Sym]} isExtension: aBoolean {Bool} isTrait: aBoolean2 {Bool} traitUsage: aTraitUsageNode {TraitUsageNode} classTraitUsage: classTraitUsage {TraitUsageNode} {^Self}
	name := aSymbol.
	superclassPath := aString.
	properties := aDictionary.
	instVars := anArray.
	methods := anOrderedCollection.
	namespace := anArray2.
	isExtension := aBoolean.
	isTrait := aBoolean2.
	traitUsage := aTraitUsageNode.
	metaclassNode := MetaclassNode
				classNode: self
				methods: classMethods
				instVars: classInstVars
				sharedVariables: sharedVariables
				traitUsage: classTraitUsage.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isClassNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isExtension {^Bool}
	^isExtension
!
(reader addMethod: 'As yet unclassified')
!
isNilClass {^Bool}
	| isNilClass {Str} |
	isNilClass := properties at: 'isNilClass' ifAbsent: [nil].
	^isNilClass = 'true'
!
(reader addMethod: 'As yet unclassified')
!
isSystemTest {^Bool}
	| prop {Nil | Str} |
	prop := properties at: 'isSystemTest' ifAbsent: [nil].
	^prop = 'true'
!
(reader addMethod: 'testing')
!
isTrait {^Bool}
	^isTrait
!
(reader addMethod: 'As yet unclassified')
!
javaClassPath {^Arr[Sym] | Nil}
	| javaClass {Str} |
	javaClass := properties at: 'javaClass' ifAbsent: [^nil].
	^(javaClass tokensBasedOn: $.) asArray collect: [:each {Str} | each asSymbol]
!
(reader addMethod: 'As yet unclassified')
!
javaClassReference {^AbsoluteReference | Nil}
	| path {Arr[Sym] | Nil} |
	path := self javaClassPath.
	path isNil ifTrue: [^nil].
	^AbsoluteReference path: path
!
(reader addMethod: 'As yet unclassified')
!
mergedWithExtension: aClassNode {ClassNode} {^ClassNode}
	^self
		withMethods: (self mergeMethods: methods with: aClassNode methods)
		classMethods: (self mergeMethods: self classMethods with: aClassNode classMethods)
		isExtension: false
!
(reader addMethod: 'As yet unclassified')
!
mergedWithMethods: anArray {Arr[MethodNode]} {^ClassNode}
	^self withMethods: (self mergeMethods: methods with: anArray)
!
(reader addMethod: 'As yet unclassified')
!
mergeMethods: originalMethods {Arr[MethodNode]} with: extensionMethods {Arr[MethodNode]} {^Arr[MethodNode]}
	| s {Set[Str]} |
	s := Set new.
	originalMethods do: [:m {MethodNode} | s add: m selector].
	extensionMethods
		do: [:m {MethodNode} | (s includes: m selector) ifTrue: [self error: 'Override: ' , m selector]].
	^originalMethods copyWithAll: extensionMethods
!
(reader addMethod: 'accessing')
!
meta {^MetaclassNode}
	^metaclassNode
!
(reader addMethod: 'accessing')
!
metaclassNode {^MetaclassNode}
	^metaclassNode
!
(reader addMethod: 'accessing')
!
name {^Sym}
	^name
!
(reader addMethod: 'accessing')
!
namespace {^Arr[Sym]}
	^namespace
!
(reader addMethod: 'accessing')
!
packageName {^Sym | Nil}
	| sp {Sym | Nil} pnString {Str | Nil} |
	sp := super packageName.
	sp isNil ifFalse: [^sp].
	pnString := properties at: 'packageName' ifAbsent: [nil].
	pnString isNil ifTrue: [^nil].
	^pnString asSymbol
!
(reader addMethod: 'copying')
!
postCopy {^Self}
	metaclassNode := MetaclassNode
				classNode: self
				methods: metaclassNode methods
				instVars: metaclassNode instVars
				sharedVariables: metaclassNode sharedVariables
				traitUsage: metaclassNode traitUsage
!
(reader addMethod: 'accessing')
!
properties {^Dict[Str, Str]}
	^properties
!
(reader addMethod: 'As yet unclassified')
!
pvtSetClassMethods: anArray {Arr[MethodNode]} {^Self}
	^self pvtSetMetaclassNode: (metaclassNode withMethods: anArray)
!
(reader addMethod: 'As yet unclassified')
!
pvtSetExtension: aBoolean {Bool} {^Self}
	isExtension := aBoolean
!
(reader addMethod: 'As yet unclassified')
!
pvtSetMetaclassNode: aMetaclassNode {MetaclassNode} {^Self}
	metaclassNode == aMetaclassNode ifTrue: [^self].
	metaclassNode := aMetaclassNode pvtWithClassNode: self
!
(reader addMethod: 'As yet unclassified')
!
pvtSetProperties: aDictionary {Dict[Str, Str]} {^Self}
	properties := aDictionary
!
(reader addMethod: 'As yet unclassified')
!
pvtSetSuperclassPath: aString {Str} {^Self}
	superclassPath := aString
!
(reader addMethod: 'As yet unclassified')
!
pvtSetTrait: aBoolean {Bool} {^Self}
	isTrait := aBoolean
!
(reader addMethod: 'As yet unclassified')
!
reference {^AbsoluteReference}
	^AbsoluteReference path: (namespace copyWith: name)
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: name.
	isExtension ifTrue: [aStream nextPutAll: ' (extension)'].
	isTrait ifTrue: [aStream nextPutAll: ' (trait)']
!
(reader addMethod: 'accessing')
!
superclassPath {^Str}
	^superclassPath
!
(reader addMethod: 'As yet unclassified')
!
superclassReference {^Reference | Nil}
	| path {Arr[Sym]} |
	superclassPath isNil ifTrue: [^nil].
	path := (superclassPath tokensBasedOn: $.) collect: [:str {Str} | str asSymbol].
	path size = 1 ifTrue: [^AbsoluteReference path: (namespace copyWith: path first)].
	^AbsoluteReference path: path
!
(reader addMethod: 'As yet unclassified')
!
withClassInstVar: aVariableDeclarationNode {VariableDeclarationNode} {^Self}
	^self copy pvtSetMetaclassNode: (metaclassNode withInstVar: aVariableDeclarationNode)
!
(reader addMethod: 'As yet unclassified')
!
withClassMethodNode: aMethodNode {MethodNode} {^Self}
	^self copy pvtSetMetaclassNode: (metaclassNode withMethodNode: aMethodNode)
!
(reader addMethod: 'accessing')
!
withClassTrait: aTraitUsageNode {TraitUsageNode} {^Self}
	^self copy pvtSetMetaclassNode: (metaclassNode withTrait: aTraitUsageNode)
!
(reader addMethod: 'As yet unclassified')
!
withMethods: anArray {Arr[MethodNode]} classMethods: anArray2 {Arr[MethodNode]} isExtension: aBoolean {Bool} {^ClassNode}
	^(self copy)
		pvtSetMethods: anArray;
		pvtSetClassMethods: anArray2;
		pvtSetExtension: aBoolean;
		yourself
!
(reader addMethod: 'As yet unclassified')
!
withProperties: aDictionary {Dict[Str, Str]} {^Self}
	^self copy pvtSetProperties: aDictionary
!
(reader addMethod: 'As yet unclassified')
!
withPropertyAt: aKey {Str} put: aValue {Str} {^Self}
	^self withProperties: (properties copyAt: aKey put: aValue)
!
(reader addMethod: 'As yet unclassified')
!
withSharedVariable: aSharedDeclarationNode {SharedDeclarationNode} {^Self}
	^self copy
		pvtSetMetaclassNode: (metaclassNode withSharedVariable: aSharedDeclarationNode)
!
(reader addMethod: 'As yet unclassified')
!
withSuperclassPath: aString {Str} {^Self}
	^self copy pvtSetSuperclassPath: aString
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Sym, Arr[Sym], Str, Dict[Str, Str], Bool, MetaclassNode, Bool]}
	^#('name' 'namespace' 'superclassPath' 'properties' 'isExtension' 'metaclassNode' 'isTrait')
!
(reader addClassMethod: 'instance creation')
!
name: aSymbol {Sym} namespacePath: namespacePath {Arr[Sym]} {^Instance}
	^self
		name: aSymbol
		superclassPath: nil
		properties: Dictionary new
		instVars: #()
		classInstVars: #()
		sharedVariables: #()
		methods: #()
		classMethods: #()
		namespace: namespacePath
		isExtension: false
		isTrait: false
		traitUsage: EmptyTraitUsageNode new
		classTraitUsage: EmptyTraitUsageNode new
!
(reader addClassMethod: 'instance creation')
!
name: aSymbol {Sym} superclassPath: superclassPath {Str} properties: properties {Dict[Str, Str]} instVars: instVars {Arr[VariableDeclarationNode]} classInstVars: classInstVars {Arr[VariableDeclarationNode]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} methods: methods {Arr[MethodNode]} classMethods: classMethods {Arr[MethodNode]} namespace: namespace {Arr[Sym]} isExtension: isExtension {Bool} isTrait: isTrait {Bool} traitUsage: traitUsage {TraitUsageNode} classTraitUsage: classTraitUsage {TraitUsageNode} {^ClassNode}
	^self new
		initializeName: aSymbol
		superclassPath: superclassPath
		properties: properties
		instVars: instVars
		classInstVars: classInstVars
		sharedVariables: sharedVariables
		methods: methods
		classMethods: classMethods
		namespace: namespace
		isExtension: isExtension
		isTrait: isTrait
		traitUsage: traitUsage
		classTraitUsage: classTraitUsage
!
