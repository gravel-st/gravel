(reader defineClass: 'PushConstant' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushConstant: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aStack {JVMStack} {^JVMInstruction}
	aStack push: self type.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^self subclassResponsibility
!
