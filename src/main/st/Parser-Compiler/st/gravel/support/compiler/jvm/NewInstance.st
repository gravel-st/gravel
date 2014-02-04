(reader defineClass: 'NewInstance' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'type' type: 'JVMDefinedObjectType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitNewInstance: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
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
(reader addClassMethod: 'instance creation')
!
className: aString {Str} {^NewInstance}
	^self type: (JVMDefinedObjectType className: aString)
!
(reader addClassMethod: 'instance creation')
!
type: aJVMDefinedObjectType {JVMDefinedObjectType} {^NewInstance}
	^self new initializeType: aJVMDefinedObjectType
!
