(reader defineClass: 'Invoke' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'ownerType')
!
(reader addInstVar: 'signature')
!
(reader addMethod: 'initialize-release')
!
initializeOwnerType: aJVMDefinedObjectType {JVMDefinedObjectType} name: aString {Str} signature: aJVMMethodType {JVMMethodType} {^Self}
	ownerType := aJVMDefinedObjectType.
	name := aString.
	signature := aJVMMethodType.
	self initialize
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
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
		nextPutAll: 'name: ';
		nextPutAll: name;
		nextPutAll: 'ownerType: ';
		nextPutAll: ownerType printString;
		nextPutAll: 'signature: ';
		nextPutAll: signature printString
!
(reader addMethod: 'As yet unclassified')
!
staticSignature {^JVMMethodType}
	^signature copyWithFirst: ownerType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMDefinedObjectType, Str, JVMMethodType]}
	^#('ownerType' 'name' 'signature')
!
(reader addClassMethod: 'instance creation')
!
ownerType: aJVMDefinedObjectType {JVMDefinedObjectType} name: aString {Str} signature: aJVMMethodType {JVMMethodType} {^Instance}
	^self new
		initializeOwnerType: aJVMDefinedObjectType
		name: aString
		signature: aJVMMethodType
!
