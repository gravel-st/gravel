(reader defineClass: 'Loop' superclass: 'org.gravel.support.compiler.jvm.JVMControlFlowInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitLoop: self
!
