(reader defineClass: 'ExecutePrimitive' superclass: 'st.gravel.support.compiler.jvm.SimulatedInstruction')
!
(reader addInstVar: 'context')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitExecutePrimitive: self
!
(reader addMethod: 'accessing')
!
context
	^context
!
(reader addMethod: 'initialize-release')
!
initializeContext: aPrimitiveMethodContext
	context := aPrimitiveMethodContext.
	self initialize
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addClassMethod: 'instance creation')
!
context: aPrimitiveMethodContext
	^self new initializeContext: aPrimitiveMethodContext
!
