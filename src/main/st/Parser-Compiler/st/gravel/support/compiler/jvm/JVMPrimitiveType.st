(reader defineClass: 'JVMPrimitiveType' superclass: 'st.gravel.support.compiler.jvm.JVMType')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMNodeVisitor[X def]} {^X}
	^visitor visitJVMPrimitiveType: self
!
(reader addMethod: 'As yet unclassified')
!
descriptorOn: aStream {WStream[Char]} {^Self}
	self sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
isPrimitiveType {^Bool}
	^true
!
