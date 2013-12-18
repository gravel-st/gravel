(reader defineClass: 'WhileLoop' superclass: 'org.gravel.support.compiler.jvm.Loop')
!
(reader addInstVar: 'testFrame')
!
(reader addInstVar: 'doFrame')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitWhileLoop: self
!
(reader addMethod: 'accessing')
!
doFrame {^Frame}
	^doFrame
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: doFrame endStack isEmpty.
	^self
!
(reader addMethod: 'initialize-release')
!
initializeTestFrame: aFrame {Frame} doFrame: aFrame2 {Frame} {^Self}
	testFrame := aFrame.
	doFrame := aFrame2.
	self initialize
!
(reader addMethod: 'accessing')
!
testFrame {^Frame}
	^testFrame
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame, Frame]}
	^#('testFrame' 'doFrame')
!
(reader addClassMethod: 'instance creation')
!
testFrame: aFrame {Frame} doFrame: aFrame2 {Frame} {^WhileLoop}
	^self new initializeTestFrame: aFrame doFrame: aFrame2
!
