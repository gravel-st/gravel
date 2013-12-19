(reader defineClass: 'PushString' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushString: self
!
(reader addMethod: 'initialize-release')
!
initializeValue: aString {Str} {^Self}
	value := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMDefinedObjectType string
!
(reader addMethod: 'accessing')
!
value {^Str}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aString {Str} {^PushString}
	^self new initializeValue: aString
!
