(reader defineClass: 'DynamicLiteralBlockMessageSend' superclass: 'st.gravel.support.compiler.jvm.DynamicSend')
!
(reader addInstVar: 'blockSendConstants' type: 'Array[String]')
!
(reader addInstVar: 'constantOwner' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'copiedArguments' type: 'Array[String]')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicLiteralBlockMessageSend: self
!
(reader addMethod: 'accessing')
!
blockSendConstants {^Arr[Str]}
	^blockSendConstants
!
(reader addMethod: 'accessing')
!
constantOwner {^JVMDefinedObjectType}
	^constantOwner
!
(reader addMethod: 'accessing')
!
copiedArguments {^Arr[Str]}
	^copiedArguments
!
(reader addMethod: 'initialize-release')
!
initializeFunctionName: aString {Str} numArgs: anInteger {Int} blockSendConstants: anArray {Arr[Str]} constantOwner: aJVMDefinedObjectType {JVMDefinedObjectType} copiedArguments: anObject {Arr[Str]} {^Self}
	functionName := aString.
	numArgs := anInteger.
	blockSendConstants := anArray.
	constantOwner := aJVMDefinedObjectType.
	copiedArguments := anObject.
	self initialize
!
(reader addClassMethod: 'instance creation')
!
functionName: aString {Str} numArgs: anInteger {Int} blockSendConstants: anArray {Arr[Str]} constantOwner: aJVMDefinedObjectType {JVMDefinedObjectType} copiedArguments: anObject {Arr[Str]} {^DynamicLiteralBlockMessageSend}
	^self new
		initializeFunctionName: aString
		numArgs: anInteger
		blockSendConstants: anArray
		constantOwner: aJVMDefinedObjectType
		copiedArguments: anObject
!
