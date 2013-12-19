(reader defineClass: 'WhileFalseLoop' superclass: 'st.gravel.support.compiler.jvm.WhileBooleanLoop')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileFalseLoop: self
!
