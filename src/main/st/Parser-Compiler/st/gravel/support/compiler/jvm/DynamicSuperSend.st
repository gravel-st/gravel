(reader defineClass: 'DynamicSuperSend' superclass: 'st.gravel.support.compiler.jvm.DynamicSend')
!
(reader addInstVar: 'superReference')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicSuperSend: self
!
(reader addMethod: 'accessing')
!
functionName {^Str}
	^functionName
!
(reader addMethod: 'initialize-release')
!
initializeFunctionName: aString {Str} numArgs: anInteger {Int} superReference: aString2 {Str} {^Self}
	functionName := aString.
	numArgs := anInteger.
	superReference := aString2.
	self initialize
!
(reader addMethod: 'accessing')
!
numArgs {^Int}
	^numArgs
!
(reader addMethod: 'As yet unclassified')
!
signature {^JVMMethodType}
	^JVMMethodType dynamic: numArgs + 1
!
(reader addMethod: 'accessing')
!
superReference {^Str}
	^superReference
!
(reader addClassMethod: 'instance creation')
!
functionName: aString {Str} numArgs: anInteger {Int} superReference: aString2 {Str} {^DynamicSuperSend}
	^self new initializeFunctionName: aString numArgs: anInteger superReference: aString2
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('superReference')
!
