(reader defineClass: 'DynamicFieldWrite' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicFieldWrite: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack pop.
	aJVMStack pop.
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
	^JVMMethodType voidDynamic: 2
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMVoidType new
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('name')
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} {^DynamicFieldWrite}
	^self new initializeName: aString
!
