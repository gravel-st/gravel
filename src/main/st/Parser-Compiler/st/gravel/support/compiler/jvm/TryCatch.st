(reader defineClass: 'TryCatch' superclass: 'st.gravel.support.compiler.jvm.JVMControlFlowInstruction')
!
(reader addInstVar: 'tryFrame')
!
(reader addInstVar: 'doFrame')
!
(reader addInstVar: 'exception')
!
(reader addInstVar: 'catchFrame')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitTryCatch: self
!
(reader addMethod: 'accessing')
!
catchFrame {^Frame}
	^catchFrame
!
(reader addMethod: 'accessing')
!
doFrame {^Frame}
	^doFrame
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self
!
(reader addMethod: 'accessing')
!
exception {^JVMDefinedObjectType}
	^exception
!
(reader addMethod: 'initialize-release')
!
initializeTryFrame: aFrame {Frame} doFrame: aFrame2 {Frame} exception: aJVMDefinedObjectType {JVMDefinedObjectType} catchFrame: aFrame3 {Frame} {^Self}
	tryFrame := aFrame.
	doFrame := aFrame2.
	exception := aJVMDefinedObjectType.
	catchFrame := aFrame3.
	self initialize
!
(reader addMethod: 'accessing')
!
tryFrame {^Frame}
	^tryFrame
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame, Frame, JVMDefinedObjectType, Frame]}
	^#('tryFrame' 'doFrame' 'exception' 'catchFrame')
!
(reader addClassMethod: 'instance creation')
!
tryFrame: aFrame {Frame} doFrame: aFrame2 {Frame} exception: aJVMDefinedObjectType {JVMDefinedObjectType} catchFrame: aFrame3 {Frame} {^TryCatch}
	^self new
		initializeTryFrame: aFrame
		doFrame: aFrame2
		exception: aJVMDefinedObjectType
		catchFrame: aFrame3
!
(reader addClassMethod: 'instance creation')
!
tryFrame: aFrame {Frame} exception: aJVMDefinedObjectType {JVMDefinedObjectType} catchFrame: aFrame2 {Frame} {^TryCatch}
	^self
		tryFrame: aFrame
		doFrame: nil
		exception: aJVMDefinedObjectType
		catchFrame: aFrame2
!
