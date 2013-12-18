(reader defineClass: 'Store' superclass: 'org.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'index')
!
(reader addInstVar: 'type')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitStore: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	| elemType {JVMType} |
	elemType := aJVMStack pop.
	(elemType isObjectType or: [elemType isArrayType])
		ifTrue: [^AStore index: index type: type].
	elemType isIntType ifTrue: [^IStore index: index type: type].
	self halt.
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
index: anInteger {Int} type: aJVMDynamicObjectType {JVMType} {^Instance}
	^self new initializeIndex: anInteger type: aJVMDynamicObjectType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[JVMLocalDeclaration, Int, JVMType]}
	^#('local' 'index' 'type')
!
(reader addClassMethod: 'instance creation')
!
local: aJVMLocalDeclaration {JVMLocalDeclaration} {^Instance}
	^self index: aJVMLocalDeclaration index type: aJVMLocalDeclaration type
!
