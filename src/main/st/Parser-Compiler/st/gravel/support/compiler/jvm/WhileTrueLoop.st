(reader defineClass: 'WhileTrueLoop' superclass: 'st.gravel.support.compiler.jvm.WhileBooleanLoop')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileTrueLoop: self
!
