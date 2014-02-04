(reader defineClass: 'DynamicMessageSend' superclass: 'st.gravel.support.compiler.jvm.DynamicSend')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicMessageSend: self
!
(reader addMethod: 'initialize-release')
!
initializeFunctionName: aString {Str} numArgs: anInteger {Int} {^Self}
	functionName := aString.
	numArgs := anInteger.
	self initialize
!
(reader addClassMethod: 'instance creation')
!
functionName: aString {Str} numArgs: anInteger {Int} {^DynamicMessageSend}
	^self new initializeFunctionName: aString numArgs: anInteger
!
