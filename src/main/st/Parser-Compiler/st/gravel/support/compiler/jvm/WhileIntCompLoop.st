(reader defineClass: 'WhileIntCompLoop' superclass: 'st.gravel.support.compiler.jvm.WhileLoop')
!
(reader addInstVar: 'incFrame')
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	super effectStack: aJVMStack.
	self assert: testFrame endStack size = 2.
	self assert: testFrame endStack peek isIntType.
	self assert: (testFrame endStack peek: 2) isIntType.
	self assert: incFrame endStack isEmpty.
	^self
!
(reader addMethod: 'accessing')
!
incFrame {^Frame}
	^incFrame
!
(reader addMethod: 'initialize-release')
!
initializeIncFrame: aFrame {Frame} testFrame: aFrame2 {Frame} doFrame: aFrame3 {Frame} {^Self}
	incFrame := aFrame.
	testFrame := aFrame2.
	doFrame := aFrame3.
	self initialize
!
(reader addClassMethod: 'instance creation')
!
incFrame: aFrame {Frame} testFrame: aFrame2 {Frame} doFrame: aFrame3 {Frame} {^Instance}
	^self new initializeIncFrame: aFrame testFrame: aFrame2 doFrame: aFrame3
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Frame]}
	^#('incFrame')
!
