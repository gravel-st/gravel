(reader defineClass: 'ILoad' superclass: 'org.gravel.support.compiler.jvm.Load')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitILoad: self
!
