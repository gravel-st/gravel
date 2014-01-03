(reader defineClass: 'JVMDoubleType' superclass: 'st.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMDoubleType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithDouble: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWithDouble: aJVMDoubleType {JVMDoubleType} {^JVMType}
	^self
!
(reader addMethod: 'testing')
!
isDoubleType {^Bool}
	^true
!
(reader addMethod: 'testing')
!
isWide {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToDouble}
	^CastObjectToDouble new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromDouble
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $D
!
