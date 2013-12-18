(reader defineClass: 'IfObjectIsNullThenElse' superclass: 'org.gravel.support.compiler.jvm.Fork')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIfObjectIsNullThenElse: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isDynamicObjectType.
	^self pushTypeOnStack: aJVMStack
!
