(reader defineClass: 'PushTrue' superclass: 'st.gravel.support.compiler.jvm.PushBoolean')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushTrue: self
!
(reader addMethod: 'accessing')
!
value {^Bool}
	^true
!
