(reader defineClass: 'IdentityComparisonNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'left' type: 'Expression')
!
(reader addInstVar: 'right' type: 'Expression')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIdentityComparisonNode: self
!
(reader addMethod: 'initialize-release')
!
initializeLeft: aVariableNode {Expression} right: aVariableNode2 {Expression} {^Self}
	left := aVariableNode.
	right := aVariableNode2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	left sourceOn: aStream.
	aStream nextPutAll: ' == '.
	right sourceOn: aStream.
	aStream nextPutAll: '}'
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
right {^Expression}
	^right
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^BinaryMessageNode receiver: left selector: '==' argument: right
!
(reader addClassMethod: 'instance creation')
!
left: aVariableNode {Expression} right: aVariableNode2 {Expression} {^Instance}
	^self new initializeLeft: aVariableNode right: aVariableNode2
!
