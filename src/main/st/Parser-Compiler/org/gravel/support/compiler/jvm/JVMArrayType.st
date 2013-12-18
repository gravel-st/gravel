(reader defineClass: 'JVMArrayType' superclass: 'org.gravel.support.compiler.jvm.JVMNonPrimitiveType')
!
(reader addInstVar: 'elementType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMArrayType: self
!
(reader addMethod: 'accessing')
!
className {^Str}
	^self descriptorString
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithArray: self
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $[.
	elementType descriptorOn: aStream
!
(reader addMethod: 'accessing')
!
dottedClassName {^Str}
	^self descriptorString
!
(reader addMethod: 'accessing')
!
elementType {^JVMType}
	^elementType
!
(reader addMethod: 'initialize-release')
!
initializeElementType: aJVMObjectType {JVMType} {^Self}
	elementType := aJVMObjectType.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isArrayType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToArray}
	^CastObjectToArray elementType: elementType
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromArray: self
!
(reader addMethod: 'accessing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $[.
	elementType sourceOn: aStream
!
(reader addClassMethod: 'instance creation')
!
elementType: aJVMObjectType {JVMType} {^JVMArrayType}
	^self new initializeElementType: aJVMObjectType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMType]}
	^#('elementType')
!
