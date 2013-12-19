(reader defineClass: 'PushChar' superclass: 'st.gravel.support.compiler.jvm.PushConstant')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitPushChar: self
!
(reader addMethod: 'initialize-release')
!
initializeValue: aCharacter {Char} {^Self}
	value := aCharacter.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	^JVMCharType new
!
(reader addMethod: 'accessing')
!
value {^Char}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Character]}
	^#('value')
!
(reader addClassMethod: 'instance creation')
!
value: aCharacter {Char} {^PushChar}
	^self new initializeValue: aCharacter
!
