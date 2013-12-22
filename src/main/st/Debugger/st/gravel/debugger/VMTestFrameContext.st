(reader defineClass: 'VMTestFrameContext' superclass: 'st.gravel.debugger.VMFrameContext')
!
(reader addInstVar: 'test')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMTestFrameContext: self
!
(reader addMethod: 'accessing')
!
frame
	^frame
!
(reader addMethod: 'As yet unclassified')
!
frameEndInstruction
	^ExecuteTest test: test
!
(reader addMethod: 'initialize-release')
!
initializeParent: aVMFrameContext frame: aFrame test: aBlock
	parent := aVMFrameContext.
	frame := aFrame.
	test := aBlock.
	self initialize
!
(reader addMethod: 'accessing')
!
parent
	^parent
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
parent: aVMFrameContext frame: aFrame test: aBlock
	^self new initializeParent: aVMFrameContext frame: aFrame test: aBlock
!
