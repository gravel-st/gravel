(reader defineClass: 'InvokeInterface' superclass: 'st.gravel.support.compiler.jvm.Invoke')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitInvokeInterface: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	signature arguments reverseDo: [:each {JVMType} | self assert: aJVMStack pop = each].
	aJVMStack pop.
	signature returnType isVoidType ifFalse: [aJVMStack push: signature returnType].
	^self
!
