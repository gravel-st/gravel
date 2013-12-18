(reader defineClass: 'AStore' superclass: 'org.gravel.support.compiler.jvm.Store')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitAStore: self
!
