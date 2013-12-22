(reader defineClass: 'WhileIntCompLoop' superclass: 'st.gravel.support.compiler.jvm.WhileLoop')
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	super effectStack: aJVMStack.
	self assert: testFrame endStack size = 2.
	self assert: testFrame endStack peek isIntType.
	self assert: (testFrame endStack peek: 2) isIntType.
	^self
!
