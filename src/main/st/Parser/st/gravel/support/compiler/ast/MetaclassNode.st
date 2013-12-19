(reader defineClass: 'MetaclassNode' superclass: 'st.gravel.support.compiler.ast.ClassDescriptionNode')
!
(reader addInstVar: 'classNode')
!
(reader addInstVar: 'sharedVariables')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitMetaclassNode: self
!
(reader addMethod: 'accessing')
!
classNode {^ClassNode}
	^classNode
!
(reader addMethod: 'As yet unclassified')
!
findSourceFile {^SourceFile}
	sourcePosition isNil ifFalse: [^sourcePosition sourceFile].
	classNode sourcePosition isNil ifTrue: [^nil].
	^classNode sourcePosition sourceFile
!
(reader addMethod: 'As yet unclassified')
!
flattenTraitsIn: aSystemNode {SystemNode} {^Self}
	^traitUsage flattenMetaclassNode: self in: aSystemNode
!
(reader addMethod: 'initialize-release')
!
initializeClassNode: aClassNode {ClassNode} methods: anOrderedCollection {Arr[MethodNode]} instVars: anArray {Arr[VariableDeclarationNode]} sharedVariables: aSharedVariables {Arr[SharedDeclarationNode]} traitUsage: anObject {TraitUsageNode} {^Self}
	classNode := aClassNode.
	methods := anOrderedCollection.
	instVars := anArray.
	sharedVariables := aSharedVariables.
	traitUsage := anObject.
	self initialize
!
(reader addMethod: 'accessing')
!
instVars {^Arr[VariableDeclarationNode]}
	^instVars
!
(reader addMethod: 'accessing')
!
isMeta {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isNilClass {^Bool}
	^false
!
(reader addMethod: 'testing')
!
isTrait {^Bool}
	^classNode isTrait
!
(reader addMethod: 'accessing')
!
meta {^MetaclassNode}
	^self
!
(reader addMethod: 'accessing')
!
namespace {^Arr[Sym]}
	^classNode namespace
!
(reader addMethod: 'accessing')
!
packageName {^Sym | Nil}
	| sp {Sym | Nil} |
	sp := super packageName.
	sp isNil ifFalse: [^sp].
	^classNode packageName
!
(reader addMethod: 'accessing')
!
printOn: aStream {WStream[Char]} {^Self}
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
pvtSetClassNode: aClassNode {ClassNode} {^Self}
	classNode := aClassNode
!
(reader addMethod: 'As yet unclassified')
!
pvtSetSharedVariables: anArray {Arr[SharedDeclarationNode]} {^Self}
	sharedVariables := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtWithClassNode: aClassNode {ClassNode} {^Self}
	classNode == aClassNode ifTrue: [^self].
	^self copy pvtSetClassNode: aClassNode
!
(reader addMethod: 'As yet unclassified')
!
reference {^Reference}
	^ClassReference reference: classNode reference
!
(reader addMethod: 'As yet unclassified')
!
sharedVariableAt: aName {Str} ifAbsent: aBlock {[^SharedDeclarationNode]} {^SharedDeclarationNode}
	^sharedVariables detect: [:each {SharedDeclarationNode} | each name = aName]
		ifNone: aBlock
!
(reader addMethod: 'accessing')
!
sharedVariables {^Arr[SharedDeclarationNode]}
	^sharedVariables
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	classNode sourceOn: aStream.
	aStream nextPutAll: ' class'
!
(reader addMethod: 'As yet unclassified')
!
superclassReference {^Reference}
	| csr {Reference | Nil} |
	csr := classNode superclassReference.
	csr isNil ifTrue: [^nil].
	^ClassReference reference: csr
!
(reader addMethod: 'As yet unclassified')
!
superclassReferenceForMethodLookup {^Reference}
	| csr {Reference | Nil} |
	csr := classNode superclassReference.
	csr isNil ifTrue: [^AbsoluteReference path: #(#st #gravel #lang #Class)].
	^ClassReference reference: csr
!
(reader addMethod: 'As yet unclassified')
!
withSharedVariable: aSharedDeclarationNode {SharedDeclarationNode} {^Self}
	^self copy pvtSetSharedVariables: (sharedVariables copyWith: aSharedDeclarationNode)
!
(reader addClassMethod: 'instance creation')
!
classNode: aClassNode {ClassNode} methods: anOrderedCollection {Arr[MethodNode]} instVars: anArray {Arr[VariableDeclarationNode]} sharedVariables: sharedVariables {Arr[SharedDeclarationNode]} traitUsage: traitUsage {TraitUsageNode} {^MetaclassNode}
	^self new
		initializeClassNode: aClassNode
		methods: anOrderedCollection
		instVars: anArray
		sharedVariables: sharedVariables
		traitUsage: traitUsage
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[ClassNode, Arr[SharedDeclarationNode]]}
	^#('classNode' 'sharedVariables')
!
