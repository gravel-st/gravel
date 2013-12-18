(reader defineClass: 'JVMControlFlowInstruction' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitJVMControlFlowInstruction: self
!
