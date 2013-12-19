(reader defineClass: 'DynamicFieldRead' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name')
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
initializeName: aString {Str} {^Self}
	name := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
methodType {^JVMMethodType}
	^JVMMethodType returnType: self type dynamic: 1
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('name')
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} {^DynamicFieldRead}
	^self new initializeName: aString
!
