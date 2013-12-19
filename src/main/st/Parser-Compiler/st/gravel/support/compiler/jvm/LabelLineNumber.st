(reader defineClass: 'LabelLineNumber' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addInstVar: 'line')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitLabelLineNumber: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	^self
!
(reader addMethod: 'initialize-release')
!
initializeLine: anInteger {Int} {^Self}
	line := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
line {^Int}
	^line
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Int]}
	^#('line')
!
(reader addClassMethod: 'instance creation')
!
line: anInteger {Int} {^LabelLineNumber}
	^self new initializeLine: anInteger
!
