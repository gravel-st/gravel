(reader defineClass: 'IStore' superclass: 'org.gravel.support.compiler.jvm.Store')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIStore: self
!
