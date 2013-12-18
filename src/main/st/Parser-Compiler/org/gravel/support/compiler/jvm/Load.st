(reader defineClass: 'Load' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'index')
!
(reader addInstVar: 'type')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitLoad: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack push: type.
	^self
!
(reader addMethod: 'accessing')
!
index {^Int}
	^index
!
(reader addMethod: 'initialize-release')
!
initializeIndex: anInteger {Int} type: aJVMDynamicObjectType {JVMType} {^Self}
	index := anInteger.
	type := aJVMDynamicObjectType.
	self initialize
!
(reader addMethod: 'accessing')
!
type {^JVMType}
	^type
!
(reader addClassMethod: 'instance creation')
!
index: anInteger {Int} type: aJVMType {JVMType} {^Load}
	(aJVMType isObjectType or: [aJVMType isArrayType])
		ifTrue: [^ALoad new initializeIndex: anInteger type: aJVMType].
	aJVMType isIntType ifTrue: [^ILoad new initializeIndex: anInteger type: aJVMType].
	self halt.
	^Load new initializeIndex: anInteger type: aJVMType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMLocalDeclaration, Int, JVMType]}
	^#('local' 'index' 'type')
!
(reader addClassMethod: 'instance creation')
!
local: aJVMLocalDeclaration {JVMLocalDeclaration} {^Load}
	^self index: aJVMLocalDeclaration index type: aJVMLocalDeclaration type
!
