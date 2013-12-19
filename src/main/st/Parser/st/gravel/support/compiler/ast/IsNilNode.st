(reader defineClass: 'IsNilNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'receiver')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIsNilNode: self
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anExpression {Expression} {^Self}
	receiver := anExpression.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	receiver sourceOn: aStream.
	aStream nextPutAll: ' isNil}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: receiver
!
(reader addMethod: 'accessing')
!
receiver {^Expression}
	^receiver
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^receiver send: 'isNil'
!
(reader addClassMethod: 'instance creation')
!
instVarTypes {^[Expression]}
	^#('receiver')
!
(reader addClassMethod: 'instance creation')
!
receiver: anExpression {Expression} {^Instance}
	^self new initializeReceiver: anExpression
!
