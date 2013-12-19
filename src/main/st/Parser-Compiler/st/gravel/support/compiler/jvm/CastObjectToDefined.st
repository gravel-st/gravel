(reader defineClass: 'CastObjectToDefined' superclass: 'st.gravel.support.compiler.jvm.CastTo')
!
(reader addInstVar: 'type')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastObjectToDefined: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isObjectType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'initialize-release')
!
initializeType: aJVMDefinedObjectType {JVMDefinedObjectType} {^Self}
	type := aJVMDefinedObjectType.
	self initialize
!
(reader addMethod: 'accessing')
!
type {^JVMDefinedObjectType}
	^type
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMDefinedObjectType]}
	^#('type')
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType {JVMDefinedObjectType} {^CastObjectToDefined}
	^self new initializeType: aJVMDefinedObjectType
!
