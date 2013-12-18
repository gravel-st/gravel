(reader defineClass: 'IfBooleanObjectThenElse' superclass: 'org.gravel.support.compiler.jvm.IfThenElse')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIfBooleanObjectThenElse: self
!
