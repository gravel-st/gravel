(reader defineClass: 'JVMIntType' superclass: 'st.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMIntType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithInt: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithInt: aJVMIntType {JVMIntType} {^JVMType}
	^self
!
(reader addMethod: 'As yet unclassified')
!
isCoerceableByteType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isIntType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToInt}
	^CastObjectToInt new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromInt
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $I
!
