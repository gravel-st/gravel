(reader defineClass: 'DynamicSend' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'receiverType' type: 'JVMType')
!
(reader addInstVar: 'argumentTypes' type: 'Array[JVMType]')
!
(reader addInstVar: 'numArgs' type: 'Integer')
!
(reader addInstVar: 'functionName' type: 'String')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicSend: self
!
(reader addMethod: 'accessing')
!
argumentTypes {^Arr[JVMType]}
	argumentTypes isNil
		ifTrue: [^(1 to: numArgs) collect: [:i {Int} | JVMDynamicObjectType new]].
	^argumentTypes
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| aReceiverType {JVMType} anArray {Arr[JVMType]} |
	anArray := ((1 to: numArgs) collect: [:i {Int} | aJVMStack pop]) reverse.
	aReceiverType := aJVMStack pop.
	self assert: aReceiverType isObjectType.
	aJVMStack push: self type.
	^self withReceiverType: aReceiverType argumentTypes: anArray
!
(reader addMethod: 'accessing')
!
functionName {^Str}
	^functionName
!
(reader addMethod: 'accessing')
!
numArgs {^Int}
	^numArgs
!
(reader addMethod: 'As yet unclassified')
!
pvtSetArgumentTypes: anArray {Arr[JVMType]} {^Self}
	argumentTypes := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetReceiverType: aJVMObjectType {JVMType} {^Self}
	receiverType := aJVMObjectType
!
(reader addMethod: 'accessing')
!
receiverType {^JVMType}
	receiverType isNil ifTrue: [^JVMDynamicObjectType new].
	^receiverType
!
(reader addMethod: 'As yet unclassified')
!
signature {^JVMMethodType}
	^JVMMethodType returnType: self type
		arguments: (self argumentTypes copyWithFirst: self receiverType)
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: functionName
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
withReceiverType: aJVMObjectType {JVMType} argumentTypes: anArray {Arr[JVMType]} {^Self}
	^(self copy)
		pvtSetReceiverType: aJVMObjectType;
		pvtSetArgumentTypes: anArray
!
