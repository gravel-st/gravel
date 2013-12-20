(reader defineClass: 'JVMMethodType' superclass: 'st.gravel.support.compiler.jvm.JVMNode')
!
(reader addInstVar: 'returnType')
!
(reader addInstVar: 'arguments')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMMethodType: self
!
(reader addMethod: 'accessing')
!
arguments {^Arr[JVMType]}
	^arguments
!
(reader addMethod: 'As yet unclassified')
!
copyWithFirst: aJVMType {JVMType} {^Self}
	^self copy pvtSetArguments: (arguments copyWithFirst: aJVMType)
!
(reader addMethod: 'accessing')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $(.
	arguments do: [:each {JVMType} | each descriptorOn: aStream].
	aStream nextPut: $).
	returnType descriptorOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
descriptorString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self descriptorOn: aStream.
	^aStream contents
!
(reader addMethod: 'initialize-release')
!
initializeReturnType: aJVMDefinedObjectType {JVMType} arguments: anArray {Arr[JVMType]} {^Self}
	returnType := aJVMDefinedObjectType.
	arguments := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^arguments size
!
(reader addMethod: 'As yet unclassified')
!
pvtSetArguments: anArray {Arr[JVMType]} {^Self}
	arguments := anArray
!
(reader addMethod: 'accessing')
!
returnType {^JVMType}
	^returnType
!
(reader addMethod: 'accessing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $(.
	arguments do: [:each {JVMType} | each printOn: aStream].
	aStream nextPut: $).
	returnType printOn: aStream
!
(reader addClassMethod: 'As yet unclassified')
!
dynamic: numArgs {Int} {^Instance}
	^self returnType: JVMDynamicObjectType new dynamic: numArgs
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMType, Arr[JVMType]]}
	^#('returnType' 'arguments')
!
(reader addClassMethod: 'instance creation')
!
object {^Instance}
	^self returnType: JVMDefinedObjectType object
!
(reader addClassMethod: 'instance creation')
!
returnType: aJVMDefinedObjectType {JVMType} {^JVMMethodType}
	^self returnType: aJVMDefinedObjectType arguments: #()
!
(reader addClassMethod: 'instance creation')
!
returnType: aJVMDefinedObjectType {JVMType} arguments: anArray {Arr[JVMType]} {^JVMMethodType}
	^self new initializeReturnType: aJVMDefinedObjectType arguments: anArray
!
(reader addClassMethod: 'As yet unclassified')
!
returnType: aJVMDefinedObjectType {JVMType} dynamic: numArgs {Int} {^Instance}
	^self returnType: aJVMDefinedObjectType
		arguments: ((1 to: numArgs) collect: [:i {Int} | JVMDynamicObjectType new])
!
(reader addClassMethod: 'instance creation')
!
void {^Instance}
	^self returnType: JVMVoidType new
!
(reader addClassMethod: 'As yet unclassified')
!
voidArguments: anArray {Arr[JVMType]} {^JVMMethodType}
	^self returnType: JVMVoidType new arguments: anArray
!
(reader addClassMethod: 'As yet unclassified')
!
voidDynamic: numArgs {Int} {^JVMMethodType}
	^self returnType: JVMVoidType new dynamic: numArgs
!
