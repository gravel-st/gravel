(reader defineClass: 'JVMFloatType' superclass: 'st.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMFloatType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithFloat: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithFloat: aJVMFloatType {JVMFloatType} {^JVMType}
	^self
!
(reader addMethod: 'As yet unclassified')
!
isFloatType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToFloat}
	^CastObjectToFloat new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromFloat
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $F
!
