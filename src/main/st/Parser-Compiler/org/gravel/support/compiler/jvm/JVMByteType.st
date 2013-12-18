(reader defineClass: 'JVMByteType' superclass: 'org.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMByteType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithByte: self
!
(reader addMethod: 'As yet unclassified')
!
isByteType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isCoerceableByteType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToByte}
	^CastObjectToByte new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromByte
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $B
!
