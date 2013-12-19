(reader defineClass: 'CastObjectToBoolean' superclass: 'st.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastObjectToBoolean: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isObjectType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBooleanType new
!
