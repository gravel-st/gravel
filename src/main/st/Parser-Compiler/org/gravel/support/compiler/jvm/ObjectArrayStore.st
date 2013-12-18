(reader defineClass: 'ObjectArrayStore' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitObjectArrayStore: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| arrayType {JVMType} valType {JVMType} |
	valType := aJVMStack pop.
	self assert: valType isObjectType.
	self assert: aJVMStack pop isIntType.
	arrayType := aJVMStack pop.
	self assert: arrayType isArrayType.
	self assert: ({JVMArrayType} arrayType) elementType isObjectType.
	^self
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMBottomType new
!
