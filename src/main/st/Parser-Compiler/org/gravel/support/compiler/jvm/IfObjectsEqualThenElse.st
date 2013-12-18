(reader defineClass: 'IfObjectsEqualThenElse' superclass: 'org.gravel.support.compiler.jvm.Fork')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIfObjectsEqualThenElse: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isObjectType.
	self assert: aJVMStack pop isObjectType.
	^self pushTypeOnStack: aJVMStack
!
