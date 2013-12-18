(reader defineClass: 'DynamicMessageSend' superclass: 'org.gravel.support.compiler.jvm.DynamicSend')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicMessageSend: self
!
(reader addMethod: 'accessing')
!
functionName
	^functionName
!
(reader addMethod: 'initialize-release')
!
initializeFunctionName: aString {Str} numArgs: anInteger {Int} {^Self}
	functionName := aString.
	numArgs := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
numArgs
	^numArgs
!
(reader addMethod: 'As yet unclassified')
!
pvtSetArgumentTypes: anArray
	argumentTypes := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetReceiverType: aJVMObjectType
	receiverType := aJVMObjectType
!
(reader addMethod: 'As yet unclassified')
!
signature {^JVMMethodType}
	^JVMMethodType dynamic: numArgs + 1
!
(reader addMethod: 'As yet unclassified')
!
type
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
withReceiverType: aJVMObjectType {JVMType} argumentTypes: anArray {Arr[JVMType]} {^DynamicSend}
	^(self copy)
		pvtSetReceiverType: aJVMObjectType;
		pvtSetArgumentTypes: anArray
!
(reader addClassMethod: 'instance creation')
!
functionName: aString {Str} numArgs: anInteger {Int} {^DynamicMessageSend}
	^self new initializeFunctionName: aString numArgs: anInteger
!
