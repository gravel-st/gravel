(reader defineClass: 'VMHandlerFrameContext' superclass: 'st.gravel.debugger.VMFrameContext')
!
(reader addInstVar: 'exception')
!
(reader addInstVar: 'catchFrame')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMHandlerFrameContext: self
!
(reader addMethod: 'accessing')
!
catchFrame
	^catchFrame
!
(reader addMethod: 'accessing')
!
exception
	^exception
!
(reader addMethod: 'accessing')
!
frame
	^frame
!
(reader addMethod: 'initialize-release')
!
initializeParent: aVMMethodContext frame: aFrame exception: aJVMDefinedObjectType catchFrame: aFrame2
	parent := aVMMethodContext.
	frame := aFrame.
	exception := aJVMDefinedObjectType.
	catchFrame := aFrame2.
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
(reader addClassMethod: 'instance creation')
!
parent: aVMMethodContext frame: aFrame exception: aJVMDefinedObjectType catchFrame: aFrame2
	^self new
		initializeParent: aVMMethodContext
		frame: aFrame
		exception: aJVMDefinedObjectType
		catchFrame: aFrame2
!
