(reader defineClass: 'Invoke' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name' type: 'String')
!
(reader addInstVar: 'ownerType' type: 'JVMDefinedObjectType')
!
(reader addInstVar: 'signature' type: 'JVMMethodType')
!
(reader addMethod: 'initialize-release')
!
initializeOwnerType: aJVMDefinedObjectType {JVMDefinedObjectType} name: aString {Str} signature: aJVMMethodType {JVMMethodType} {^Self}
	ownerType := aJVMDefinedObjectType.
	name := aString.
	signature := aJVMMethodType.
	self initialize
!
(reader addMethod: 'testing')
!
isInvokeStatic {^Bool}
	^false
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^signature numArgs
!
(reader addMethod: 'accessing')
!
ownerType {^JVMDefinedObjectType}
	^ownerType
!
(reader addMethod: 'accessing')
!
signature {^JVMMethodType}
	^signature
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: ownerType dottedClassName;
		nextPutAll: '.';
		nextPutAll: name;
		nextPutAll: signature printString
!
(reader addMethod: 'As yet unclassified')
!
staticSignature {^JVMMethodType}
	^signature copyWithFirst: ownerType
!
(reader addClassMethod: 'instance creation')
!
ownerType: aJVMDefinedObjectType {JVMDefinedObjectType} name: aString {Str} signature: aJVMMethodType {JVMMethodType} {^Instance}
	^self new
		initializeOwnerType: aJVMDefinedObjectType
		name: aString
		signature: aJVMMethodType
!
