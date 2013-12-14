(reader defineClass: 'ClassDescriptionNode' superclass: 'org.gravel.parser.Node')
!
(reader addInstVar: 'methods')
!
(reader addInstVar: 'instVars')
!
(reader addInstVar: 'traitUsage')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self == anObject or: 
			[self class = anObject class
				and: [methods = anObject methods and: [instVars = anObject instVars]]]
!
(reader addMethod: 'accessing')
!
allMethodsIn: aSystemNode {SystemNode} do: aBlock {[MethodNode, ^Object]} {^Self}
	| scn {ClassDescriptionNode} |
	methods do: aBlock.
	scn := self superclassNodeIn: aSystemNode.
	scn isNil ifTrue: [^self].
	scn allMethodsIn: aSystemNode do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
boundInstVars {^Arr[BoundVariableDeclarationNode]}
	^instVars collect: [:each {VariableDeclarationNode} | each withOwnerType: self reference]
!
(reader addMethod: 'accessing')
!
canUnderstand: selector {Str} in: aSystemNode {SystemNode} {^Bool}
	| scn {ClassDescriptionNode} |
	(self includesSelector: selector) ifTrue: [^true].
	scn := self superclassNodeIn: aSystemNode.
	scn isNil ifTrue: [^false].
	^scn canUnderstand: selector in: aSystemNode
!
(reader addMethod: 'As yet unclassified')
!
copyRemoveSelector: selector {Str} {^Self}
	^self copy
		pvtSetMethods: (methods reject: [:each {MethodNode} | each selector = selector])
!
(reader addMethod: 'As yet unclassified')
!
copyReplaceMethodNode: aMethodNode {MethodNode} {^Self}
	^self copy pvtSetMethods: (methods
				collect: [:each {MethodNode} | each selector = aMethodNode selector ifTrue: [aMethodNode] ifFalse: [each]])
!
(reader addMethod: 'As yet unclassified')
!
diffFromClassNode: aClassNode {ClassNode} {^Diff}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
diffFromMetaclassNode: aMetaclassNode {MetaclassNode} {^Diff}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
diffTo: aClassDescriptionNode {ClassDescriptionNode} {^Diff}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
diffToClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} {^Diff}
	| diff {Diff} reference {Reference} |
	diff := EmptyDiff new.
	reference := self reference.
	instVars
		syncWith: aClassDescriptionNode instVars
		select: [:a {VariableDeclarationNode} :b {VariableDeclarationNode} | a name = b name]
		thenDo: [:a {VariableDeclarationNode} :b {VariableDeclarationNode} | diff := diff withDiff: (a diffTo: b reference: reference)]
		ifNew: [:instVar {VariableDeclarationNode} | diff := diff withDiff: (AddInstVarDiff reference: self reference instVar: instVar)]
		ifAbsent: 
			[:instVar {VariableDeclarationNode} |
			diff := diff withDiff: (RemoveInstVarDiff reference: self reference instVar: instVar)].
	methods
		syncWith: aClassDescriptionNode methods
		select: [:a {MethodNode} :b {MethodNode} | a selector = b selector]
		thenDo: [:a {MethodNode} :b {MethodNode} | diff := diff withDiff: (a diffTo: b reference: reference)]
		ifNew: 
			[:methodNode {MethodNode} |
			diff := diff withDiff: (AddMethodDiff reference: self reference methodNode: methodNode)]
		ifAbsent: 
			[:methodNode {MethodNode} |
			diff := diff
						withDiff: (RemoveMethodDiff reference: self reference methodNode: methodNode)].
	^diff
!
(reader addMethod: 'As yet unclassified')
!
findSourceFile {^SourceFile}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
flattenTraitsIn: aSystemNode {SystemNode} {^Self}
	^self subclassResponsibility
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(self class hash bitXor: methods hash) bitXor: instVars hash
!
(reader addMethod: 'accessing')
!
includesSelector: selector {Str} {^Bool}
	^methods anySatisfy: [:each {MethodNode} | each selector = selector]
!
(reader addMethod: 'As yet unclassified')
!
initializeMethods: anOrderedCollection {Arr[MethodNode]} instVars: anArray {Arr[VariableDeclarationNode]} {^Self}
	methods := anOrderedCollection.
	instVars := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
instVars {^Arr[VariableDeclarationNode]}
	^instVars
!
(reader addMethod: 'As yet unclassified')
!
isClassNode {^Bool}
	^false
!
(reader addMethod: 'accessing')
!
isMeta {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isNilClass {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'testing')
!
isTrait {^Bool}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
meta {^MetaclassNode}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
methodAt: selector {Str} {^MethodNode}
	^methods detect: [:each {MethodNode} | each selector = selector]
		ifNone: [self error: 'Method ' , selector , ' not found']
!
(reader addMethod: 'accessing')
!
methodOrNilAt: selector {Str} {^MethodNode}
	^methods detect: [:each {MethodNode} | each selector = selector] ifNone: [nil]
!
(reader addMethod: 'accessing')
!
methods {^Arr[MethodNode]}
	^methods
!
(reader addMethod: 'As yet unclassified')
!
name {^Sym}
	^nil
!
(reader addMethod: 'accessing')
!
namespace {^Arr[Sym]}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	methods do: aBlock.
	instVars do: aBlock
!
(reader addMethod: 'accessing')
!
pvtSetInstVars: arr {Arr[VariableDeclarationNode]} {^Self}
	instVars := arr
!
(reader addMethod: 'As yet unclassified')
!
pvtSetMethods: anArray {Arr[MethodNode]} {^Self}
	methods := anArray
!
(reader addMethod: 'accessing')
!
pvtSetTraitUsage: aTraitUsageNode {TraitUsageNode} {^Self}
	traitUsage := aTraitUsageNode
!
(reader addMethod: 'As yet unclassified')
!
reference {^Reference}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
selectorsDo: aBlock {[Str, ^Object]} {^Self}
	methods do: [:m {MethodNode} | aBlock value: m selector]
!
(reader addMethod: 'accessing')
!
superclassNodeIn: aSystemNode {SystemNode} {^ClassDescriptionNode}
	| scr {Reference | Nil} |
	scr := self superclassReference.
	scr isNil ifTrue: [^nil].
	^aSystemNode classNodeAt: scr
!
(reader addMethod: 'As yet unclassified')
!
superclassReference {^Reference | Nil}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
superclassReferenceForMethodLookup {^Reference | Nil}
	^self superclassReference
!
(reader addMethod: 'accessing')
!
withInstVar: aVariableDeclarationNode {VariableDeclarationNode} {^Self}
	^self copy pvtSetInstVars: (instVars copyWith: aVariableDeclarationNode)
!
(reader addMethod: 'As yet unclassified')
!
withMethodNode: aMethodNode {MethodNode} {^Self}
	| current {MethodNode} |
	current := self methodOrNilAt: aMethodNode selector.
	current isNil ifFalse: [self error: 'Duplicate selector: ' , aMethodNode selector].
	^self copy pvtSetMethods: (methods copyWith: aMethodNode)
!
(reader addMethod: 'As yet unclassified')
!
withMethodNode: aMethodNode {MethodNode} ofTrait: aReference {Reference} {^Self}
	^self withMethodNode: (aMethodNode ofTrait: aReference)
!
(reader addMethod: 'As yet unclassified')
!
withMethods: anArray {Arr[MethodNode]} {^Self}
	^self copy pvtSetMethods: anArray
!
(reader addMethod: 'accessing')
!
withTrait: aTraitUsageNode {TraitUsageNode} {^Self}
	^self copy pvtSetTraitUsage: (traitUsage withTrait: aTraitUsageNode)
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Arr[MethodNode], Arr[VariableDeclarationNode], TraitUsageNode]}
	^#('methods' 'instVars' 'traitUsage')
!
(reader addClassMethod: 'As yet unclassified')
!
methods: anOrderedCollection {Arr[MethodNode]} instVars: anArray {Arr[VariableDeclarationNode]} {^MetaclassNode}
	^self new initializeMethods: anOrderedCollection instVars: anArray
!
