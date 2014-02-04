(reader defineClass: 'PushFloat' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value' type: 'Float')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushFloat: self
!
(reader addMethod: 'initialize-release')
!
initializeValue: aFloat {Float} {^Self}
	value := aFloat.
	self initialize
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^JVMFloatType new
!
(reader addMethod: 'accessing')
!
value {^Float}
	^value
!
(reader addClassMethod: 'instance creation')
!
value: aFloat {Float} {^PushFloat}
	^self new initializeValue: aFloat
!
