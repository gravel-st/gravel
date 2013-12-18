(reader defineClass: 'CastObjectToShort' superclass: 'org.gravel.support.compiler.jvm.CastTo')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitCastObjectToShort: self
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
	^JVMShortType new
!
