(reader defineClass: 'DynamicGlobalRead' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'namespace')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitDynamicGlobalRead: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	aJVMStack push: self type.
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
	^JVMMethodType dynamic: 0
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
	^JVMDynamicObjectType new
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str, Str]}
	^#('namespace' 'name')
!
(reader addClassMethod: 'instance creation')
!
namespace: aString {Str} name: aString2 {Str} {^DynamicGlobalRead}
	^self new initializeNamespace: aString name: aString2
!
