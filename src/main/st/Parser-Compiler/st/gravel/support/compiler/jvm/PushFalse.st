(reader defineClass: 'PushFalse' superclass: 'st.gravel.support.compiler.jvm.PushBoolean')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushFalse: self
!
(reader addMethod: 'accessing')
!
value {^Bool}
	^false
!
