(reader defineClass: 'JVMCharType' superclass: 'org.gravel.support.compiler.jvm.JVMPrimitiveType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMCharType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType commonSuperTypeWithChar: self
!
(reader addMethod: 'As yet unclassified')
!
isCharType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionFromDynamicObject {^CastObjectToChar}
	^CastObjectToChar new
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^aJVMType newCastInstructionFromChar
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $C
!
