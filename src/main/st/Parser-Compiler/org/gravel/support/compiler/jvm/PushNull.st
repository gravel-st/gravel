(reader defineClass: 'PushNull' superclass: 'org.gravel.support.compiler.jvm.PushConstant')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushNull: self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDynamicObjectType new
!
