(reader defineClass: 'IfThenElse' superclass: 'st.gravel.support.compiler.jvm.Fork')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIfThenElse: self
!
(reader addMethod: 'As yet unclassified')
!
effectBooleanTestStack: aJVMStack {JVMStack} {^IfBooleanValueThenElse}
	| commonType {JVMType} |
	commonType := trueFrame type commonSuperTypeWith: falseFrame type.
	^IfBooleanValueThenElse trueFrame: (trueFrame withReturnType: commonType)
		falseFrame: (falseFrame withReturnType: commonType)
!
(reader addMethod: 'As yet unclassified')
!
effectObjectTestStack: aJVMStack {JVMStack} {^IfBooleanObjectThenElse}
	| commonType {JVMType} |
	commonType := trueFrame type commonSuperTypeWith: falseFrame type.
	^IfBooleanObjectThenElse trueFrame: (trueFrame withReturnType: commonType)
		falseFrame: (falseFrame withReturnType: commonType)
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| testType {JVMType} |
	testType := aJVMStack pop.
	testType isDynamicObjectType
		ifTrue: [^(self effectObjectTestStack: aJVMStack) pushTypeOnStack: aJVMStack].
	testType isBooleanType
		ifTrue: [^(self effectBooleanTestStack: aJVMStack) pushTypeOnStack: aJVMStack].
	self halt
!
