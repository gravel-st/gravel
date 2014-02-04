(reader defineClass: 'GetStatic' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'ownerType' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'type' type: 'JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitGetStatic: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'initialize-release')
!
initializeOwnerType: aJVMDefinedObjectType {JVMDefinedObjectType} name: aString {Str} type: aJVMDefinedObjectType2 {JVMType} {^Self}
	ownerType := aJVMDefinedObjectType.
	name := aString.
	type := aJVMDefinedObjectType2.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^type
!
(reader addClassMethod: 'instance creation')
!
ownerType: ownerType {JVMDefinedObjectType} name: aString {Str} type: type {JVMType} {^GetStatic}
	self assert: ownerType notNil.
	self assert: type notNil.
	^self new initializeOwnerType: ownerType name: aString type: type
!
