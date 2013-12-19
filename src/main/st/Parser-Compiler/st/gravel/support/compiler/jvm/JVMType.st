(reader defineClass: 'JVMType' superclass: 'st.gravel.support.compiler.jvm.JVMNode')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^self class = anObject class
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMType: self
!
(reader addMethod: 'As yet unclassified')
!
castNotSupported {^CastTo}
	^self error: 'Cast not supported'
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithArray: aJVMArrayType {JVMArrayType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithBoolean: aJVMBooleanType {JVMBooleanType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithByte: aJVMByteType {JVMByteType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithChar: aJVMCharType {JVMCharType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithDefined: aJVMDefinedObjectType {JVMDefinedObjectType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithFloat: aJVMFloatType {JVMFloatType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithInt: aJVMIntType {JVMIntType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithLong: aJVMLongType {JVMLongType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithShort: aJVMShortType {JVMShortType} {^JVMType}
	^JVMDynamicObjectType new
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
descriptorString {^Str}
	| aStream {WStream[Char]} |
	aStream := WriteStream on: String new.
	self descriptorOn: aStream.
	^aStream contents
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^self class hash
!
(reader addMethod: 'As yet unclassified')
!
isArrayType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isBooleanType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isBottomType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isByteType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isCharType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isCoerceableByteType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isDefinedType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isDynamicObjectType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isFloatType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isIntType {^Bool}
	^false
!
(reader addMethod: 'visitor')
!
isLongType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isObjectType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isVoidType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromArray: aJVMArrayType {JVMArrayType} {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromBoolean {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromByte {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromChar {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDefinedObject: anObject {JVMDefinedObjectType} {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromFloat {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromInt {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromLong {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromShort {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^self subclassResponsibility
!
