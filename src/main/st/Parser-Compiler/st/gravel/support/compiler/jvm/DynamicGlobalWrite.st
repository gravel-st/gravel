(reader defineClass: 'DynamicGlobalWrite' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'namespace')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicGlobalWrite: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self
!
(reader addMethod: 'initialize-release')
!
initializeNamespace: aString {Str} name: aString2 {Str} {^Self}
	namespace := aString.
	name := aString2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
methodType {^JVMMethodType}
	^JVMMethodType dynamic: 1
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
namespace {^Str}
	^namespace
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMVoidType new
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, Str]}
	^#('namespace' 'name')
!
(reader addClassMethod: 'instance creation')
!
namespace: aString {Str} name: aString2 {Str} {^DynamicGlobalWrite}
	^self new initializeNamespace: aString name: aString2
!
