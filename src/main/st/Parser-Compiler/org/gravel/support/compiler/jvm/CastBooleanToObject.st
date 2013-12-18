(reader defineClass: 'CastBooleanToObject' superclass: 'org.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastBooleanToObject: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isBooleanType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
