(reader defineClass: 'WhileLessThanLoop' superclass: 'org.gravel.support.compiler.jvm.WhileIntCompLoop')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileLessThanLoop: self
!
