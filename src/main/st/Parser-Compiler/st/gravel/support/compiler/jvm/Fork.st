(reader defineClass: 'Fork' superclass: 'st.gravel.support.compiler.jvm.JVMControlFlowInstruction')
!
(reader addInstVar: 'falseFrame')
!
(reader addInstVar: 'trueFrame')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitFork: self
!
(reader addMethod: 'accessing')
!
falseFrame {^Frame}
	^falseFrame
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	trueFrame isNil ifTrue: [trueFrame := PushTrue new asFrame].
	falseFrame isNil ifTrue: [falseFrame := PushFalse new asFrame]
!
(reader addMethod: 'initialize-release')
!
initializeTrueFrame: aFrame {Frame} falseFrame: aFrame2 {Frame} {^Self}
	trueFrame := aFrame.
	falseFrame := aFrame2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
pushTypeOnStack: aJVMStack {JVMStack} {^Self}
	self type isBottomType ifFalse: [aJVMStack push: self type].
	^self
!
(reader addMethod: 'accessing')
!
trueFrame {^Frame}
	^trueFrame
!
(reader addMethod: 'As yet unclassified')
!
type {^JVMType}
	trueFrame type isBottomType ifTrue: [^falseFrame type].
	falseFrame type isBottomType ifTrue: [^trueFrame type].
	self assert: trueFrame type = falseFrame type.
	^falseFrame type
!
(reader addClassMethod: 'As yet unclassified')
!
boolean {^Instance}
	^self trueFrame: PushTrue new asFrame falseFrame: PushFalse new asFrame
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame, Frame]}
	^#('falseFrame' 'trueFrame')
!
(reader addClassMethod: 'instance creation')
!
trueFrame: aFrame {Frame} falseFrame: aFrame2 {Frame} {^Instance}
	^self new initializeTrueFrame: aFrame falseFrame: aFrame2
!
