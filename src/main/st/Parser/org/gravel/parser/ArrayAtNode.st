(reader defineClass: 'ArrayAtNode' superclass: 'org.gravel.parser.ArrayAccessNode')
!
(reader addInstVar: 'index')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitArrayAtNode: self
!
(reader addMethod: 'accessing')
!
index {^Expression}
	^index
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anExpression {Expression} index: anExpression2 {Expression} {^Self}
	receiver := anExpression.
	index := anExpression2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	receiver sourceOn: aStream.
	aStream nextPutAll: ' at: '.
	index sourceOn: aStream.
	aStream nextPutAll: '}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	aBlock value: receiver.
	aBlock value: index
!
(reader addMethod: 'accessing')
!
receiver {^Expression}
	^receiver
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^receiver send: 'at:' with: index
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression]}
	^#('index')
!
(reader addClassMethod: 'instance creation')
!
receiver: anExpression {Expression} index: anExpression2 {Expression} {^ArrayAtNode}
	^self new initializeReceiver: anExpression index: anExpression2
!
