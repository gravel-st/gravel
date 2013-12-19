(reader defineClass: 'TryCatch' superclass: 'st.gravel.support.compiler.jvm.JVMControlFlowInstruction')
!
(reader addInstVar: 'tryFrame')
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
initializeTryFrame: aFrame {Frame} exception: aJVMDefinedObjectType {JVMDefinedObjectType} catchFrame: aFrame2 {Frame} {^Self}
	tryFrame := aFrame.
	exception := aJVMDefinedObjectType.
	catchFrame := aFrame2.
	self initialize
!
(reader addMethod: 'accessing')
!
tryFrame {^Frame}
	^tryFrame
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame, JVMDefinedObjectType, Frame]}
	^#('tryFrame' 'exception' 'catchFrame')
!
(reader addClassMethod: 'instance creation')
!
tryFrame: aFrame {Frame} exception: aJVMDefinedObjectType {JVMDefinedObjectType} catchFrame: aFrame2 {Frame} {^TryCatch}
	^self new initializeTryFrame: aFrame exception: aJVMDefinedObjectType catchFrame: aFrame2
!
