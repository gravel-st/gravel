(reader defineClass: 'InvokeVirtual' superclass: 'st.gravel.support.compiler.jvm.Invoke')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitInvokeVirtual: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	signature arguments reverseDo: [:each {JVMType} | aJVMStack popType: each].
	aJVMStack pop.
	signature returnType isVoidType ifFalse: [aJVMStack push: signature returnType].
	^self
!
