(reader defineClass: 'BooleanBinaryNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'left' type: 'Expression')
!
(reader addInstVar: 'right' type: 'SequenceNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBooleanBinaryNode: self
!
(reader addMethod: 'initialize-release')
!
initializeLeft: anUnaryMessageNode {Expression} right: aSequenceNode {SequenceNode} {^Self}
	left := anUnaryMessageNode.
	right := aSequenceNode.
	self initialize
!
(reader addMethod: 'accessing')
!
left {^Expression}
	^left
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: left.
	aBlock value: right
!
(reader addMethod: 'accessing')
!
right {^SequenceNode}
	^right
!
(reader addClassMethod: 'instance creation')
!
left: anUnaryMessageNode {Expression} right: aSequenceNode {SequenceNode} {^Instance}
	^self new initializeLeft: anUnaryMessageNode right: aSequenceNode
!
