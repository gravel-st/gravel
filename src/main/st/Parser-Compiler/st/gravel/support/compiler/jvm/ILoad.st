(reader defineClass: 'ILoad' superclass: 'st.gravel.support.compiler.jvm.Load')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitILoad: self
!
