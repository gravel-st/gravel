(reader defineClass: 'DynamicFieldWrite' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'type' type: 'JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicFieldWrite: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack popType: self type.
	aJVMStack pop.
	^self
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {Str} type: aJVMDynamicObjectType {JVMType} {^Self}
	name := aString.
	type := aJVMDynamicObjectType.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
methodType {^JVMMethodType}
	^JVMMethodType returnType: JVMVoidType new
		arguments: (Array with: JVMDynamicObjectType new with: type)
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^type
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} type: aJVMDynamicObjectType {JVMType} {^DynamicFieldWrite}
	^self new initializeName: aString type: aJVMDynamicObjectType
!
