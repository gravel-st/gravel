(reader defineClass: 'DupX2' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDupX2: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| p1 {JVMType} p2 {JVMType} p3 {JVMType} |
	p1 := aJVMStack pop.
	p2 := aJVMStack pop.
	p3 := aJVMStack pop.
	aJVMStack push: p1.
	aJVMStack push: p3.
	aJVMStack push: p2.
	aJVMStack push: p1.
	^self
!
