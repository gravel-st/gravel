(reader defineClass: 'DynamicSend' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'receiverType')
!
(reader addInstVar: 'argumentTypes')
!
(reader addInstVar: 'numArgs')
!
(reader addInstVar: 'functionName')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicSend: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| aReceiverType {JVMType} anArray {Arr[JVMType]} |
	anArray := (1 to: numArgs) collect: 
					[:i {Int} |
					| elemType {JVMType} |
					elemType := aJVMStack pop.
					self assert: elemType isObjectType.
					elemType].
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
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
withReceiverType: aJVMObjectType {JVMType} argumentTypes: anArray {Arr[JVMType]} {^DynamicSend}
	^(self copy)
		pvtSetReceiverType: aJVMObjectType;
		pvtSetArgumentTypes: anArray
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMType, Arr[JVMType], Int, Str]}
	^#('receiverType' 'argumentTypes' 'numArgs' 'functionName')
!
