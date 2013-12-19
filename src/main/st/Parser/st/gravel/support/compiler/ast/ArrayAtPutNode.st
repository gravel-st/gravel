(reader defineClass: 'ArrayAtPutNode' superclass: 'st.gravel.support.compiler.ast.ArrayAccessNode')
!
(reader addInstVar: 'index')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitArrayAtPutNode: self
!
(reader addMethod: 'accessing')
!
index {^Expression}
	^index
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anExpression {Expression} index: anExpression2 {Expression} value: anExpression3 {Expression} {^Self}
	receiver := anExpression.
	index := anExpression2.
	value := anExpression3.
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
	aBlock value: index.
	aBlock value: value
!
(reader addMethod: 'accessing')
!
receiver {^Expression}
	^receiver
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^receiver send: 'at:put:' with: index with: value
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, Expression]}
	^#('index' 'value')
!
(reader addClassMethod: 'instance creation')
!
receiver: anExpression {Expression} index: anExpression2 {Expression} value: anExpression3 {Expression} {^ArrayAtPutNode}
	^self new initializeReceiver: anExpression index: anExpression2 value: anExpression3
!
