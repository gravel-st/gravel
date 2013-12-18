(reader defineClass: 'JVMVoidType' superclass: 'org.gravel.support.compiler.jvm.JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMVoidType: self
!
(reader addMethod: 'As yet unclassified')
!
commonSuperTypeWith: aJVMType {JVMType} {^JVMType}
	^aJVMType
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	self sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
isVoidType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
newCastInstructionTo: aJVMType {JVMType} {^CastTo}
	^self castNotSupported
!
(reader addMethod: 'printing')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $V
!
