(reader defineClass: 'PushBoolean' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushBoolean: self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBooleanType new
!
