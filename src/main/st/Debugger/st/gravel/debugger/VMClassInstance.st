(reader defineClass: 'VMClassInstance' superclass: 'st.gravel.debugger.VMAbstractInstance')
!
(reader addInstVar: 'statics')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitVMClassInstance: self
!
(reader addMethod: 'As yet unclassified')
!
getStatic: aString
	^statics at: aString
!
(reader addMethod: 'initialize-release')
!
initialize
	super initialize.
	statics := Dictionary new
!
(reader addMethod: 'As yet unclassified')
!
invokeStatic: aString
	| method |
	method := self methodAt: aString.
	method isPrimitive
		ifTrue: [^PrimitiveMethodContext simPrefix: method simPrefix name: aString].
	^VMMethodContext method: method
!
(reader addMethod: 'As yet unclassified')
!
invokeStatic: aString ifAbsent: aBlock
	^VMMethodContext method: (self methodAt: aString ifAbsent: [^aBlock value])
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
putStatic: aString value: aVMInstance
	statics at: aString put: aVMInstance
!
(reader addMethod: 'accessing')
!
vm
	^vm
!
(reader addClassMethod: 'instance creation')
!
vm: aVirtualMachine subjectClass: aJVMClass
	aJVMClass isSimulatedPrimitives ifTrue: [self halt].
	^self new initializeVm: aVirtualMachine subjectClass: aJVMClass
!
