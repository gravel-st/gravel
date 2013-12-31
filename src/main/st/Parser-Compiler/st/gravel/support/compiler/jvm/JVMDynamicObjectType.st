(reader defineClass: 'JVMDynamicObjectType' superclass: 'st.gravel.support.compiler.jvm.JVMNonPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMDynamicObjectType: self
!
(reader addMethod: 'As yet unclassified')
!
className {^Str}
	^'java/lang/Object'
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aType {JVMType} {^JVMType}
	^self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithBoolean: aJVMBooleanType {JVMBooleanType} {^Self}
	^self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithDefined: aJVMDefinedObjectType {JVMDefinedObjectType} {^Self}
	^self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithInt: aJVMIntType {JVMIntType} {^JVMType}
	^self
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $L.
	aStream nextPutAll: self className.
	aStream nextPut: $;
!
(reader addMethod: 'accessing')
!
dottedClassName {^Str}
	^'java.lang.Object'
!
(reader addMethod: 'As yet unclassified')
!
isDynamicObjectType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isObjectType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromArray: aJVMArrayType {JVMArrayType} {^CastArrayToObject}
	^CastArrayToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromBoolean {^CastBooleanToObject}
	^CastBooleanToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromByte {^CastByteToObject}
	^CastByteToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromChar {^CastCharToObject}
	^CastCharToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDefinedObject: anObject {JVMDefinedObjectType} {^CastTo}
	^CastDefinedToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromFloat {^CastFloatToObject}
	^CastFloatToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromInt {^CastIntToObject}
	^CastIntToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromLong {^CastLongToObject}
	^CastLongToObject new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromDynamicObject
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $*
!
