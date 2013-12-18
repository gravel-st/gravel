(reader defineClass: 'Return' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitReturn: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBottomType new
!
