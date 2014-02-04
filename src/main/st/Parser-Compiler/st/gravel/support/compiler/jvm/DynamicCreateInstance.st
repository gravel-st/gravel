(reader defineClass: 'DynamicCreateInstance' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'reference' type: 'String')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicCreateInstance: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'initialize-release')
!
initializeReference: aString {Str} {^Self}
	reference := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
methodType {^JVMMethodType}
	^JVMMethodType returnType: self type
!
(reader addMethod: 'accessing')
!
reference {^Str}
	^reference
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMDynamicObjectType}
	^JVMDynamicObjectType new
!
(reader addClassMethod: 'instance creation')
!
reference: aString {Str} {^DynamicCreateInstance}
	^self new initializeReference: aString
!
