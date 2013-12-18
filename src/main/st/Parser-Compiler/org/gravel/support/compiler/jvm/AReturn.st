(reader defineClass: 'AReturn' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitAReturn: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack popLast isObjectType.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBottomType new
!
