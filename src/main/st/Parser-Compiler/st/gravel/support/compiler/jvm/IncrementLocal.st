(reader defineClass: 'IncrementLocal' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'local' type: 'JVMLocalDeclaration')
!
(reader addInstVar: 'increment' type: 'Integer')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitIncrementLocal: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self
!
(reader addMethod: 'accessing')
!
increment {^Int}
	^increment
!
(reader addMethod: 'accessing')
!
index {^Int}
	^local index
!
(reader addMethod: 'initialize-release')
!
initializeLocal: aJVMLocalDeclaration {JVMLocalDeclaration} increment: anInteger {Int} {^Self}
	local := aJVMLocalDeclaration.
	increment := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
local {^JVMLocalDeclaration}
	^local
!
(reader addClassMethod: 'instance creation')
!
local: aJVMLocalDeclaration {JVMLocalDeclaration} increment: anInteger {Int} {^IncrementLocal}
	^self new initializeLocal: aJVMLocalDeclaration increment: anInteger
!
