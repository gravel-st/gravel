(reader defineClass: 'IfTrueIfFalseNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'test' type: 'Expression')
!
(reader addInstVar: 'trueSequence' type: 'SequenceNode')
!
(reader addInstVar: 'falseSequence' type: 'SequenceNode')
!
(reader addInstVar: 'returnType' type: 'TypeNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIfTrueIfFalseNode: self
!
(reader addMethod: 'accessing')
!
falseSequence {^SequenceNode}
	^falseSequence
!
(reader addMethod: 'initialize-release')
!
initializeTest: aVariableNode {Expression} trueSequence: aSequenceNode {SequenceNode} falseSequence: aSequenceNode2 {SequenceNode} returnType: aTypeOrNode {TypeNode} {^Self}
	test := aVariableNode.
	trueSequence := aSequenceNode.
	falseSequence := aSequenceNode2.
	returnType := aTypeOrNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	test sourceOn: aStream.
	aStream nextPutAll: ' ifTrue: ['.
	trueSequence sourceOn: aStream.
	aStream nextPutAll: '] ifFalse: ['.
	falseSequence sourceOn: aStream.
	aStream nextPutAll: ']}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: test.
	aBlock value: trueSequence.
	aBlock value: falseSequence
!
(reader addMethod: 'accessing')
!
returnType {^TypeNode}
	^returnType
!
(reader addMethod: 'accessing')
!
test {^Expression}
	^test
!
(reader addMethod: 'accessing')
!
trueSequence {^SequenceNode}
	^trueSequence
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^KeywordMessageNode
		receiver: test
		selector: 'ifTrue:ifFalse:'
		arguments: (Array with: (BlockNode body: trueSequence)
				with: (BlockNode body: falseSequence))
!
(reader addClassMethod: 'instance creation')
!
test: aVariableNode {Expression} trueSequence: aSequenceNode {SequenceNode} falseSequence: aSequenceNode2 {SequenceNode} returnType: aTypeOrNode {TypeNode} {^Instance}
	^self new
		initializeTest: aVariableNode
		trueSequence: aSequenceNode
		falseSequence: aSequenceNode2
		returnType: aTypeOrNode
!
