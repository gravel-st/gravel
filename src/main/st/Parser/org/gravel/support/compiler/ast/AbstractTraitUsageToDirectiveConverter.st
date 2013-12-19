(reader defineClass: 'AbstractTraitUsageToDirectiveConverter' superclass: 'org.gravel.support.compiler.ast.NodeVisitor')
!
(reader addMethod: 'visiting')
!
produceSimpleNoMethod: aSimpleTraitUsageNode {SimpleTraitUsageNode} {^Arr[Node]}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
reader {^VariableNode}
	^VariableNode name: 'reader'
!
(reader addMethod: 'visiting')
!
visitCompositeTraitUsageNode: aCompositeTraitUsageNode {CompositeTraitUsageNode} {^Arr[Node]}
	^aCompositeTraitUsageNode components collectAll: [:each | self visit: each]
!
(reader addMethod: 'visiting')
!
visitEmptyTraitUsageNode: anEmptyTraitUsageNode {EmptyTraitUsageNode} {^Arr[Node]}
	^#()
!
(reader addMethod: 'visiting')
!
visitSimpleTraitUsageNode: aSimpleTraitUsageNode {SimpleTraitUsageNode} {^Arr[Node]}
	aSimpleTraitUsageNode methodOperations isEmpty
		ifTrue: [^self produceSimpleNoMethod: aSimpleTraitUsageNode].
	self error: 'Not implemented yet'
!
(reader addClassMethod: 'pegon')
!
supertype
	^#{NodeVisitor} => (#{Array} => #{Node})
!
(reader addClassMethod: 'pegon')
!
typeParameters
	^#()
!
