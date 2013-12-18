(reader defineClass: 'ObjectArrayLoad' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitObjectArrayLoad: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| arrayType {JVMArrayType} |
	self assert: aJVMStack pop isIntType.
	arrayType := aJVMStack pop.
	self assert: arrayType isArrayType.
	self assert: arrayType elementType isObjectType.
	aJVMStack push: arrayType elementType.
	^self
!
