(reader defineClass: 'NewArray' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'elementType' type: 'JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitNewArray: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isIntType.
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
initializeElementType: aJVMObjectType {JVMType} {^Self}
	elementType := aJVMObjectType.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMArrayType elementType: elementType
!
(reader addClassMethod: 'instance creation')
!
elementType: aJVMObjectType {JVMType} {^NewArray}
	^self new initializeElementType: aJVMObjectType
!
