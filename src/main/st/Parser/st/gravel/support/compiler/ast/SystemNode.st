(reader defineClass: 'SystemNode' superclass: 'st.gravel.support.compiler.ast.Node')
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
	| unordered {OrdColl[ClassDiff]} start {SystemNode} classDiffs {OrdColl[ClassDiff]} |
	unordered := OrderedCollection new.
	self classNodes
		syncWith: aSystemNode classNodes
		thenDo: 
			[:old {ClassNode} :new {ClassNode} |
			| diff {UpdateClassDiff} |
			diff := old diffTo: new.
			diff isEmpty ifFalse: [unordered add: diff]]
		ifNew: 
			[:classNode {ClassNode} |
			unordered add: (classNode javaClassPath isNil
						ifTrue: [AddClassDiff classNode: classNode]
						ifFalse: [WrapJavaclassDiff classNode: classNode])]
		ifAbsent: [:classNode {ClassNode} | unordered add: (RemoveClassDiff classNode: classNode)].
	start := self.
	classDiffs := OrderedCollection new.
	[unordered isEmpty] whileFalse: 
			[| todo {OrdColl[ClassDiff]} |
			todo := unordered select: 
							[:elem {ClassDiff} |
							| superclassReference {Reference | Nil} |
							superclassReference := elem superclassReference.
							superclassReference isNil or: [start includesReference: superclassReference]].
			todo isEmpty
				ifTrue: [self error: 'Prerequisite error; trying to load classes with unknown superclass'].
			unordered removeAll: todo.
			todo do: 
					[:each {ClassDiff} |
					each isNewClassDiff
						ifTrue: 
							[start := start withClassDescriptionNode: ({NewClassDiff} each) classNode.
							each isStatic
								ifTrue: 
									[| nextRef {Reference | Nil} |
									nextRef := each superclassReference.
									[nextRef isNil] whileFalse: 
											[| superNode {ClassDiff | Nil} ref {Reference | Nil} |
											ref := nextRef.
											superNode := classDiffs detect: [:cd {ClassDiff} | cd reference = ref]
														ifNone: [self error: 'Prereq not found'].
											nextRef := superNode isStatic ifTrue: [nil] ifFalse: [superNode superclassReference].
											superNode beStatic]]].
					classDiffs add: each]].
	^SystemDiff classDiffs: classDiffs asArray namespaces: aSystemNode namespaceNodes
!
(reader addMethod: 'As yet unclassified')
!
flattenTraits {^SystemNode}
	^(TraitFlattener start: self) flattenTraits
!
(reader addMethod: 'As yet unclassified')
!
includesReference: aReference {Reference} {^Bool}
	^classDescriptionNodes includesKey: aReference
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
