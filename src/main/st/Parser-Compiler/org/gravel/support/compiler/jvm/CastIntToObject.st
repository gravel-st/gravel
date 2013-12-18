(reader defineClass: 'CastIntToObject' superclass: 'org.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastIntToObject: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isIntType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
