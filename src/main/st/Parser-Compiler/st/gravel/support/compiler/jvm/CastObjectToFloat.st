(reader defineClass: 'CastObjectToFloat' superclass: 'st.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastObjectToFloat: self
!
(reader addMethod: 'visitor')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isObjectType.
	aJVMStack push: self type.
	^self
!
(reader addMethod: 'visitor')
!
type {^JVMType}
	^JVMFloatType new
!
