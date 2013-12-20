(reader defineClass: 'InstructionSimulator' superclass: 'st.gravel.support.compiler.jvm.JVMInstructionVisitor')
!
(reader addInstVar: 'process')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitSimulator: self
!
(reader addMethod: 'visiting')
!
currentContext
	^process currentContext
!
(reader addMethod: 'initialize-release')
!
initializeProcess: aVMProcess
	process := aVMProcess.
	self initialize
!
(reader addMethod: 'visiting')
!
pop
	^self currentContext pop
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
process
	^process
!
(reader addMethod: 'As yet unclassified')
!
produceANewArray: aNewArray
	| size |
	size := self pop value.
	self push: (self vm createArrayInstance: (Array new: size))
!
(reader addMethod: 'visiting')
!
push: anObject
	self currentContext push: anObject
!
(reader addMethod: 'visiting')
!
visitALoad: anObject {ALoad} {^X}
	self push: (self currentContext localAt: anObject index)
!
(reader addMethod: 'visiting')
!
visitAReturn: anObject {AReturn} {^X}
	process answer: self pop
!
(reader addMethod: 'visiting')
!
visitAStore: anObject {AStore} {^X}
	| value |
	value := self pop.
	self currentContext localAt: anObject index put: value
!
(reader addMethod: 'visiting')
!
visitCastArrayToObject: anObject {CastArrayToObject} {^X}
	
!
(reader addMethod: 'visiting')
!
visitCastDefinedToObject: anObject {CastDefinedToObject} {^X}
	
!
(reader addMethod: 'visiting')
!
visitCastIntToObject: anObject {CastIntToObject} {^X}
	| int primitiveValue |
	int := self pop.
	primitiveValue := int value.
	self push: (self vm createInteger: primitiveValue)
!
(reader addMethod: 'visiting')
!
visitCastObjectToDefined: anObject {CastObjectToDefined} {^X}
	
!
(reader addMethod: 'visiting')
!
visitDup: anObject {Dup} {^X}
	| v |
	v := self pop.
	self push: v.
	self push: v
!
(reader addMethod: 'visiting')
!
visitDynamicFieldRead: anObject {DynamicFieldRead} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicFieldWrite: anObject {DynamicFieldWrite} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalRead: anObject {DynamicGlobalRead} {^X}
	self push: (self vm
				dynamicGlobalRead: (Reference value: anObject namespace) / anObject name asSymbol)
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalWrite: anObject {DynamicGlobalWrite} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicMessageSend: anObject {DynamicMessageSend} {^X}
	| arguments receiver methodContext |
	arguments := (anObject numArgs to: 1 by: -1) collect: [:i | self pop].
	receiver := self pop.
	methodContext := receiver invokeDynamic: anObject functionName.
	methodContext loadArguments: (arguments copyWithFirst: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitFrame: aFrame {Frame} {^X}
	process pushContext: (VMFrameContext parent: self currentContext frame: aFrame)
!
(reader addMethod: 'visiting')
!
visitGetStatic: anObject {GetStatic} {^X}
	| field javaClass |
	javaClass := self vm classForType: anObject ownerType.
	field := javaClass fieldNamed: anObject name ifAbsent: [self halt].
	self push: ((self vm javaClassInstanceFor: javaClass) getStatic: field varName)
!
(reader addMethod: 'visiting')
!
visitIncrementLocal: anObject {IncrementLocal} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeInterface: anObject {InvokeInterface} {^X}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeSpecial: anObject {InvokeSpecial} {^X}
	| arguments receiver methodContext method |
	arguments := (anObject numArgs to: 1 by: -1) collect: [:i | self pop].
	receiver := self pop.
	method := (self vm classForType: anObject ownerType) methodNamed: anObject name
				ifAbsent: [self halt].
	methodContext := VMMethodContext method: method.
	methodContext loadReceiver: receiver arguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitInvokeStatic: anObject {InvokeStatic} {^X}
	| arguments methodContext aJVMClass |
	arguments := (anObject numArgs to: 1 by: -1) collect: [:i | self pop].
	aJVMClass := self vm classForType: anObject ownerType.
	methodContext := aJVMClass isSimulatedPrimitives
				ifTrue: [aJVMClass invokeStatic: anObject name]
				ifFalse: [(self vm javaClassInstanceFor: aJVMClass) invokeStatic: anObject name].
	methodContext loadArguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitInvokeVirtual: anObject
	| arguments receiver methodContext |
	arguments := (anObject numArgs to: 1 by: -1) collect: [:i | self pop].
	receiver := self pop.
	methodContext := receiver invokeVirtual: anObject name.
	methodContext loadReceiver: receiver arguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitNewArray: node {NewArray} {^X}
	node elementType isObjectType ifTrue: [^self produceANewArray: node].
	node elementType isByteType ifTrue: [^self produceByteNewArray: node].
	self halt
!
(reader addMethod: 'visiting')
!
visitNewInstance: anObject {NewInstance} {^X}
	self push: (self vm createInstance: anObject type)
!
(reader addMethod: 'visiting')
!
visitObjectArrayStore: anObject {ObjectArrayStore} {^X}
	| value index array |
	value := self pop.
	index := self pop value.
	array := self pop.
	array arrayAt: index put: value
!
(reader addMethod: 'As yet unclassified')
!
visitPopFrame: aPopFrame
	process popFrame
!
(reader addMethod: 'As yet unclassified')
!
visitPrimitiveMethodContext: aPrimitiveMethodContext
	aPrimitiveMethodContext executeFor: process
!
(reader addMethod: 'visiting')
!
visitPushInt: anObject {PushInt} {^X}
	self push: (PrimitiveValue value: anObject value)
!
(reader addMethod: 'visiting')
!
visitPushNull: anObject {PushNull} {^X}
	self push: nil
!
(reader addMethod: 'visiting')
!
visitPushString: anObject {PushString} {^X}
	self push: (self vm createString: anObject value)
!
(reader addMethod: 'visiting')
!
visitPutStatic: anObject {PutStatic} {^X}
	| field javaClass value |
	value := self pop.
	javaClass := self vm classForType: anObject ownerType.
	field := javaClass fieldNamed: anObject name ifAbsent: [self halt].
	(self vm javaClassInstanceFor: javaClass) putStatic: field varName value: value
!
(reader addMethod: 'visiting')
!
visitReturn: anObject {Return} {^X}
	process popContext
!
(reader addMethod: 'As yet unclassified')
!
vm
	^process vm
!
(reader addClassMethod: 'instance creation')
!
process: aVMProcess
	^self new initializeProcess: aVMProcess
!
