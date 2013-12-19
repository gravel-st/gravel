(reader defineClass: 'CastDefinedToObject' superclass: 'st.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastDefinedToObject: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isDefinedType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
