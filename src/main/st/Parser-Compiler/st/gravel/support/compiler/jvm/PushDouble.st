(reader defineClass: 'PushDouble' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushDouble: self
!
(reader addMethod: 'initialize-release')
!
initializeValue: aDouble {Double} {^Self}
	value := aDouble.
	self initialize
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^JVMDoubleType new
!
(reader addMethod: 'accessing')
!
value {^Double}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Double]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aFloat {Double} {^PushDouble}
	^self new initializeValue: aFloat
!
