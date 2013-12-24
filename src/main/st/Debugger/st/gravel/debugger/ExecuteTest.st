(reader defineClass: 'ExecuteTest' superclass: 'st.gravel.support.compiler.jvm.SimulatedInstruction')
!
(reader addInstVar: 'test')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitExecuteTest: self
!
(reader addMethod: 'initialize-release')
!
initializeTest: aBlock
	test := aBlock.
	self initialize
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
test
	^test
!
(reader addClassMethod: 'instance creation')
!
test: aBlock
	^self new initializeTest: aBlock
!
