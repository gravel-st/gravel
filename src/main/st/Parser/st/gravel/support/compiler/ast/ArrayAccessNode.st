(reader defineClass: 'ArrayAccessNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'receiver')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitArrayAccessNode: self
!
(reader addMethod: 'initialize-release')
!
initializeReceiver: anExpression {Expression} {^Self}
	receiver := anExpression.
	self initialize
!
(reader addMethod: 'accessing')
!
receiver {^Expression}
	^receiver
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression]}
	^#('receiver')
!
(reader addClassMethod: 'instance creation')
!
receiver: anExpression {Expression} {^Instance}
	^self new initializeReceiver: anExpression
!
