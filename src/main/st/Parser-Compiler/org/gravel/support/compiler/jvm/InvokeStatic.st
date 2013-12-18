(reader defineClass: 'InvokeStatic' superclass: 'org.gravel.support.compiler.jvm.Invoke')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitInvokeStatic: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	signature arguments reverseDo: [:each {JVMType} | self assert: aJVMStack pop = each].
	signature returnType isVoidType ifFalse: [aJVMStack push: signature returnType].
	^self
!
(reader addMethod: 'As yet unclassified')
!
staticSignature {^JVMMethodType}
	^signature
!
