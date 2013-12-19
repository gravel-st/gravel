(reader defineClass: 'ByteArrayStore' superclass: 'st.gravel.support.compiler.jvm.JVMInstruction')
!
(reader addMethod: 'visitor')
!
accept: visitor {JVMInstructionVisitor[X def]} {^X}
	^visitor visitByteArrayStore: self
!
(reader addMethod: 'As yet unclassified')
!
effectStack: aJVMStack {JVMStack} {^JVMInstruction}
	self assert: aJVMStack pop isCoerceableByteType.
	self assert: aJVMStack pop isIntType.
	self assert: aJVMStack pop isArrayType.
	^self
!
