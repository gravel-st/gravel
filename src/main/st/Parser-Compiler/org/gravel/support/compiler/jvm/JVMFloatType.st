(reader defineClass: 'JVMFloatType' superclass: 'org.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithFloat: self
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
