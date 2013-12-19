(reader defineClass: 'WhileGreaterThanLoop' superclass: 'st.gravel.support.compiler.jvm.WhileIntCompLoop')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileGreaterThanLoop: self
!
