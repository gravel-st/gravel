(reader defineClass: 'VMProcess' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'contextStack')
!
(reader addInstVar: 'vm')
!
(reader addInstVar: 'answer')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMProcess: self
!
(reader addMethod: 'As yet unclassified')
!
answer
	^answer
!
(reader addMethod: 'As yet unclassified')
!
answer: anInstance
	self popContext.
	self atEnd ifTrue: [answer := anInstance] ifFalse: [self currentContext push: anInstance]
!
(reader addMethod: 'As yet unclassified')
!
atEnd
	^contextStack isEmpty
!
(reader addMethod: 'As yet unclassified')
!
currentContext
	^contextStack last
!
(reader addMethod: 'initialize-release')
!
initialize
	contextStack := OrderedCollection new
!
(reader addMethod: 'initialize-release')
!
initializeVm: aVirtualMachine
	vm := aVirtualMachine.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
popContext
	[contextStack removeLast isFrame] whileTrue
!
(reader addMethod: 'As yet unclassified')
!
popFrame
	self assert: contextStack removeLast isFrame
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
pushContext: aVMMethodContext
	contextStack add: aVMMethodContext
!
(reader addMethod: 'As yet unclassified')
!
step
	self currentContext incrementIP.
	(InstructionSimulator process: self) visit: self currentContext currentInstruction
!
(reader addMethod: 'accessing')
!
vm
	^vm
!
(reader addClassMethod: 'instance creation')
!
vm: aVirtualMachine
	^self new initializeVm: aVirtualMachine
!
(reader addClassMethod: 'instance creation')
!
vm: aVirtualMachine currentContext: aVMMethodContext
	^(self vm: aVirtualMachine) pushContext: aVMMethodContext
!
