(reader defineClass: 'PushInt' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value' type: 'Integer')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushInt: self
!
(reader addMethod: 'initialize-release')
!
initializeValue: anInteger {Int} {^Self}
	value := anInteger.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMIntType new
!
(reader addMethod: 'accessing')
!
value {^Int}
	^value
!
(reader addClassMethod: 'instance creation')
!
value: anInteger {Int} {^PushInt}
	^self new initializeValue: anInteger
!
