(reader defineClass: 'JVMBooleanType' superclass: 'org.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMBooleanType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithBoolean: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithBoolean: aJVMBooleanType {JVMBooleanType} {^Self}
	^self
!
(reader addMethod: 'As yet unclassified')
!
isBooleanType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToBoolean}
	^CastObjectToBoolean new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromBoolean
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $Z
!
