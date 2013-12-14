(reader defineClass: 'SystemNode' superclass: 'org.gravel.parser.Node')
!
(reader addInstVar: 'classDescriptionNodes')
!
(reader addInstVar: 'namespaceNodes')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSystemNode: self
!
(reader addMethod: 'As yet unclassified')
!
applyDiff: aDiff {Diff} {^SystemNode}
	^aDiff applyOnSystemNode: self
!
(reader addMethod: 'accessing')
!
classDescriptionNodes {^Dict[Reference, ClassDescriptionNode]}
	^classDescriptionNodes
!
(reader addMethod: 'As yet unclassified')
!
classNodeAt: aReference {Reference} {^ClassDescriptionNode}
	^classDescriptionNodes at: aReference
!
(reader addMethod: 'As yet unclassified')
!
classNodes {^Dictionary[Reference, ClassNode]}
	| dict {Dictionary[Reference, ClassNode]} |
	dict := Dictionary new.
	classDescriptionNodes do: 
			[:each {ClassDescriptionNode} |
			each isClassNode
				ifTrue: 
					[| cn {ClassNode} |
					cn := each.
					dict at: each reference put: cn]].
	^dict
!
(reader addMethod: 'As yet unclassified')
!
diffTo: aSystemNode {SystemNode} {^SystemDiff}
	| diff {Diff} |
	diff := EmptyDiff new.
	self classNodes
		syncWith: aSystemNode classNodes
		thenDo: [:old {ClassNode} :new {ClassNode} | diff := diff withDiff: (old diffTo: new)]
		ifNew: 
			[:classNode {ClassNode} |
			| oDiff {Diff} |
			oDiff := diff.
			diff := oDiff withAddClassDiffForClassNode: classNode.
			self assert: diff classDiffsSize = (oDiff classDiffsSize + 1)]
		ifAbsent: [:classNode {ClassNode} | diff := diff withRemoveClassDiffForClassNode: classNode].
	^SystemDiff diff: diff namespaces: aSystemNode namespaceNodes
!
(reader addMethod: 'As yet unclassified')
!
flattenTraits {^SystemNode}
	| nonTraits {Dict[Reference, ClassDescriptionNode]} |
	nonTraits := classDescriptionNodes reject: [:each {ClassDescriptionNode} | each isTrait].
	^SystemNode classDescriptionNodes: (nonTraits
				collect: [:each {ClassDescriptionNode} | each flattenTraitsIn: self])
		namespaceNodes: namespaceNodes
!
(reader addMethod: 'initialize-release')
!
initializeClassDescriptionNodes: aDictionary {Dict[Reference, ClassDescriptionNode]} namespaceNodes: aDictionary2 {Dict[Reference, NamespaceNode]} {^Self}
	classDescriptionNodes := aDictionary.
	namespaceNodes := aDictionary2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
namespaceNodeAt: aReference {AbsoluteReference} {^NamespaceNode}
	^self namespaceNodeAt: aReference
		ifAbsent: [self error: 'Can''t find namespace: ' , aReference printString]
!
(reader addMethod: 'As yet unclassified')
!
namespaceNodeAt: aReference {AbsoluteReference} ifAbsent: aBlock {[^NamespaceNode]} {^NamespaceNode}
	^namespaceNodes at: aReference ifAbsent: aBlock
!
(reader addMethod: 'accessing')
!
namespaceNodes {^Dict[Reference, NamespaceNode]}
	^namespaceNodes
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	classDescriptionNodes do: aBlock.
	namespaceNodes do: aBlock
!
(reader addMethod: 'As yet unclassified')
!
pvtSetNamespaceNodes: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	namespaceNodes := aDictionary
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
withClassDescriptionNode: aClassDescriptionNode {ClassDescriptionNode} {^Self}
	| namespace {AbsoluteReference} |
	namespace := aClassDescriptionNode reference namespace.
	^self class
		classDescriptionNodes: (classDescriptionNodes copyAt: aClassDescriptionNode reference
				put: aClassDescriptionNode)
		namespaceNodes: (namespaceNodes copyAt: namespace
				ifAbsentPut: [NamespaceNode for: namespace])
!
(reader addMethod: 'As yet unclassified')
!
withNamespaceNodes: aDictionary {Dict[Reference, NamespaceNode]} {^Self}
	^self copy pvtSetNamespaceNodes: aDictionary
!
(reader addClassMethod: 'instance creation')
!
classDescriptionNodes: aDictionary {Dict[Reference, ClassDescriptionNode]} namespaceNodes: aDictionary2 {Dict[Reference, NamespaceNode]} {^SystemNode}
	^self new initializeClassDescriptionNodes: aDictionary namespaceNodes: aDictionary2
!
(reader addClassMethod: 'instance creation')
!
empty {^SystemNode}
	^self classDescriptionNodes: Dictionary new namespaceNodes: Dictionary new
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Dict[Reference, ClassDescriptionNode], Dict[Reference, NamespaceNode]]}
	^#('classDescriptionNodes' 'namespaceNodes')
!
