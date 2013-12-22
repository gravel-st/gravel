(reader defineClass: 'VMFrameContext' superclass: 'st.gravel.debugger.VMContext')
!
(reader addInstVar: 'parent')
!
(reader addInstVar: 'frame')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMFrameContext: self
!
(reader addMethod: 'As yet unclassified')
!
currentInstruction
	frame instructions size < ip ifTrue: [^self frameEndInstruction].
	^frame instructions at: ip
!
(reader addMethod: 'accessing')
!
frame
	^frame
!
(reader addMethod: 'As yet unclassified')
!
frameEndInstruction
	^PopFrame new
!
(reader addMethod: 'initialize-release')
!
initializeParent: aVMMethodContext
	parent := aVMMethodContext.
	self initialize
!
(reader addMethod: 'initialize-release')
!
initializeParent: aVMMethodContext frame: aFrame
	parent := aVMMethodContext.
	frame := aFrame.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isFrame
	^true
!
(reader addMethod: 'As yet unclassified')
!
localAt: anInteger
	^parent localAt: anInteger
!
(reader addMethod: 'As yet unclassified')
!
localAt: anInteger put: aPrimitiveValue
	parent localAt: anInteger put: aPrimitiveValue
!
(reader addMethod: 'accessing')
!
parent
	^parent
!
(reader addMethod: 'As yet unclassified')
!
pop
	^parent pop
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
push: aValue
	parent push: aValue
!
(reader addClassMethod: 'instance creation')
!
parent: aVMMethodContext
	^self new initializeParent: aVMMethodContext
!
(reader addClassMethod: 'instance creation')
!
parent: aVMMethodContext frame: aFrame
	^self new initializeParent: aVMMethodContext frame: aFrame
!
