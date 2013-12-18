(reader defineClass: 'PushFloat' superclass: 'org.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value')
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
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMFloatType new
!
(reader addMethod: 'accessing')
!
value {^Float}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Float]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aFloat {Float} {^PushFloat}
	^self new initializeValue: aFloat
!
