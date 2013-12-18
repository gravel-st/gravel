(reader defineClass: 'AndThenElse' superclass: 'org.gravel.support.compiler.jvm.Fork')
!
(reader addInstVar: 'left')
!
(reader addInstVar: 'right')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitAndThenElse: self
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
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame, Frame]}
	^#('left' 'right')
!
(reader addClassMethod: 'instance creation')
!
left: aFrame {Frame} right: aFrame2 {Frame} {^AndThenElse}
	^self new initializeLeft: aFrame right: aFrame2
!
