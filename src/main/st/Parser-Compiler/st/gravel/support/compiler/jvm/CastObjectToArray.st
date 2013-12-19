(reader defineClass: 'CastObjectToArray' superclass: 'st.gravel.support.compiler.jvm.CastTo')
!
(reader addInstVar: 'elementType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastObjectToArray: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isObjectType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'accessing')
!
elementType {^JVMType}
	^elementType
!
(reader addMethod: 'initialize-release')
!
initializeElementType: aJVMDynamicObjectType {JVMType} {^Self}
	elementType := aJVMDynamicObjectType.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMArrayType elementType: elementType
!
(reader addClassMethod: 'instance creation')
!
elementType: aJVMDynamicObjectType {JVMType} {^CastObjectToArray}
	^self new initializeElementType: aJVMDynamicObjectType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMType]}
	^#('elementType')
!
