(reader defineClass: 'WhileNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'testSequence' type: 'SequenceNode')
!
(reader addInstVar: 'doSequence' type: 'SequenceNode | Nil')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitWhileNode: self
!
(reader addMethod: 'accessing')
!
doSequence {^SequenceNode | Nil}
	^doSequence
!
(reader addMethod: 'initialize-release')
!
initializeTestSequence: aSequenceNode {SequenceNode} doSequence: aSequenceNode2 {SequenceNode | Nil} {^Self}
	testSequence := aSequenceNode.
	doSequence := aSequenceNode2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	testSequence isNil ifFalse: [aBlock value: testSequence].
	doSequence isNil ifFalse: [aBlock value: doSequence]
!
(reader addMethod: 'accessing')
!
testSequence {^SequenceNode}
	^testSequence
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^nil
!
(reader addClassMethod: 'instance creation')
!
testSequence: aSequenceNode {SequenceNode} doSequence: aSequenceNode2 {SequenceNode | Nil} {^Instance}
	^self new initializeTestSequence: aSequenceNode doSequence: aSequenceNode2
!
