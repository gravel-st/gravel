(reader defineClass: 'VMMethodContext' superclass: 'st.gravel.debugger.VMContext')
!
(reader addInstVar: 'method')
!
(reader addInstVar: 'locals')
!
(reader addInstVar: 'stack')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMMethodContext: self
!
(reader addMethod: 'As yet unclassified')
!
currentInstruction
	^method instructions at: ip
!
(reader addMethod: 'initialize-release')
!
initialize
	super initialize.
	locals := method locals collect: [:each | nil].
	stack := OrderedCollection new
!
(reader addMethod: 'initialize-release')
!
initializeMethod: aJVMMethod
	method := aJVMMethod.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
loadArguments: anArray
	anArray keysAndValuesDo: [:i :v | locals at: i put: v]
!
(reader addMethod: 'As yet unclassified')
!
loadReceiver: anInstance arguments: anArray
	self assert: method isStatic not.
	locals at: 1 put: anInstance.
	anArray keysAndValuesDo: [:i :v | locals at: i + 1 put: v]
!
(reader addMethod: 'As yet unclassified')
!
localAt: anInteger
	^locals at: anInteger + 1
!
(reader addMethod: 'As yet unclassified')
!
localAt: anInteger put: anUndefinedObject
	| zIndex |
	zIndex := anInteger + 1.
	zIndex > locals size
		ifTrue: [locals := locals copyWithAll: (Array new: zIndex - locals size)].
	locals at: zIndex put: anUndefinedObject
!
(reader addMethod: 'As yet unclassified')
!
log: aBlock
	
!
(reader addMethod: 'accessing')
!
method
	^method
!
(reader addMethod: 'As yet unclassified')
!
pop
	| value |
	value := stack removeLast.
	self log: ['Popped: ' , value printString].
	^value
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $[;
		nextPutAll: method printString;
		nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
push: anObject
	self log: ['Pushing: ' , anObject printString].
	stack add: anObject
!
(reader addClassMethod: 'instance creation')
!
method: aJVMMethod
	^self new initializeMethod: aJVMMethod
!
(reader addClassMethod: 'instance creation')
!
method: aJVMMethod instance: anInstance
	^self new initializeMethod: aJVMMethod instance: anInstance
!
