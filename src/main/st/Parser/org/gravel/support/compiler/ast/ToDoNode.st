(reader defineClass: 'ToDoNode' superclass: 'org.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'start')
!
(reader addInstVar: 'stop')
!
(reader addInstVar: 'doSequence')
!
(reader addInstVar: 'counterName')
!
(reader addInstVar: 'step')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitToDoNode: self
!
(reader addMethod: 'accessing')
!
counterName {^Str}
	^counterName
!
(reader addMethod: 'accessing')
!
doSequence {^SequenceNode}
	^doSequence
!
(reader addMethod: 'initialize-release')
!
initializeStart: anIntegerLiteralNode {Expression} stop: aVariableNode {Expression} step: anObject1 {Expression} counterName: anObject {Str} doSequence: aSequenceNode {SequenceNode} {^Self}
	start := anIntegerLiteralNode.
	stop := aVariableNode.
	step := anObject1.
	counterName := anObject.
	doSequence := aSequenceNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	start sourceOn: aStream.
	aStream nextPutAll: ' to: '.
	stop sourceOn: aStream.
	aStream nextPutAll: ' by: '.
	step sourceOn: aStream.
	aStream
		nextPutAll: ' do: [:';
		nextPutAll: counterName;
		nextPutAll: ' | '.
	doSequence sourceOn: aStream.
	aStream nextPutAll: ']}'
!
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	aBlock value: counterName
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: start.
	aBlock value: stop.
	aBlock value: step.
	aBlock value: doSequence
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^counterName = aString
!
(reader addMethod: 'accessing')
!
start {^Expression}
	^start
!
(reader addMethod: 'accessing')
!
step {^Expression}
	^step
!
(reader addMethod: 'accessing')
!
stop {^Expression}
	^stop
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^nil
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, Expression, SequenceNode, Str, Expression]}
	^#('start' 'stop' 'doSequence' 'counterName' 'step')
!
(reader addClassMethod: 'instance creation')
!
start: startNode {Expression} stop: stopNode {Expression} step: stepNode {Expression} counterName: aString {Str} doSequence: aSequenceNode {SequenceNode} {^Instance}
	^self new
		initializeStart: startNode
		stop: stopNode
		step: stepNode
		counterName: aString
		doSequence: aSequenceNode
!
