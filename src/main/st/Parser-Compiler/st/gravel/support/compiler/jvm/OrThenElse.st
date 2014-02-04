(reader defineClass: 'OrThenElse' superclass: 'st.gravel.support.compiler.jvm.Fork')
!
(reader addInstVar: 'left' type: 'Frame')
!
(reader addInstVar: 'right' type: 'Frame')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitOrThenElse: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self pushTypeOnStack: aJVMStack
!
(reader addMethod: 'initialize-release')
!
initializeLeft: aFrame {Frame} right: aFrame2 {Frame} {^Self}
	left := aFrame.
	right := aFrame2.
	self initialize
!
(reader addMethod: 'accessing')
!
left {^Frame}
	^left
!
(reader addMethod: 'accessing')
!
right {^Frame}
	^right
!
(reader addClassMethod: 'instance creation')
!
left: aFrame {Frame} right: aFrame2 {Frame} {^OrThenElse}
	^self new initializeLeft: aFrame right: aFrame2
!
