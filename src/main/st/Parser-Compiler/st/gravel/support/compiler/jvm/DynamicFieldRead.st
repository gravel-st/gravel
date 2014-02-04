(reader defineClass: 'DynamicFieldRead' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'type' type: 'JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicFieldRead: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack pop.
	aJVMStack push: self type.
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
	^JVMMethodType returnType: type arguments: (Array with: JVMDynamicObjectType new)
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
name: aString {Str} type: aJVMDynamicObjectType {JVMType} {^DynamicFieldRead}
	^self new initializeName: aString type: aJVMDynamicObjectType
!
