(reader defineClass: 'Loop' superclass: 'st.gravel.support.compiler.jvm.JVMControlFlowInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitLoop: self
!
