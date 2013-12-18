(reader defineClass: 'WhileFalseLoop' superclass: 'org.gravel.support.compiler.jvm.WhileBooleanLoop')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileFalseLoop: self
!
