(reader defineClass: 'DupX1' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDupX1: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| top {JVMType} next {JVMType} |
	top := aJVMStack pop.
	next := aJVMStack pop.
	aJVMStack push: top.
	aJVMStack push: next.
	aJVMStack push: top.
	^self
!
