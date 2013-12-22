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
(reader addMethod: 'As yet unclassified')
!
executeWhileLessThanTest: inst
	| left right |
	right := self pop value.
	left := self pop value.
	left > right ifTrue: [^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: inst doFrame
				test: [self visitWhileLessThanLoop: inst])
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
(reader addMethod: 'As yet unclassified')
!
popArguments: anInteger
	| arguments |
	arguments := Array new: anInteger.
	0 to: anInteger - 1 do: [:i | arguments at: anInteger - i put: self pop].
	^arguments
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
pushFrame: aFrame
	process pushContext: (VMFrameContext parent: self currentContext frame: aFrame)
!
(reader addMethod: 'visiting')
!
pushInt: int
	self push: (PrimitiveValue value: int)
!
(reader addMethod: 'visiting')
!
visit: anObject
	Transcript
		cr;
		show: anObject class name.
	super visit: anObject
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
visitArrayLength: anObject {ArrayLength} {^X}
	self pushInt: self pop primitiveValue size
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
visitCastObjectToArray: anObject {CastObjectToArray} {^X}
	
!
(reader addMethod: 'visiting')
!
visitCastObjectToDefined: anObject {CastObjectToDefined} {^X}
	
!
(reader addMethod: 'visiting')
!
visitCastObjectToInt: anObject {CastObjectToInt} {^X}
	| int |
	int := self pop.
	self pushInt: int primitiveValue
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
visitDupX1: anObject {DupX1} {^X}
	| top next |
	top := self pop.
	next := self pop.
	self push: top.
	self push: next.
	self push: top
!
(reader addMethod: 'visiting')
!
visitDynamicFieldRead: anObject {DynamicFieldRead} {^X}
	| receiver |
	receiver := self pop.
	self push: (receiver dynamicInstVarAt: anObject name)
!
(reader addMethod: 'visiting')
!
visitDynamicFieldWrite: anObject {DynamicFieldWrite} {^X}
	| value receiver |
	value := self pop.
	receiver := self pop.
	receiver dynamicInstVarAt: anObject name put: value
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
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := receiver invokeDynamic: anObject functionName.
	methodContext loadArguments: (arguments copyWithFirst: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitDynamicSuperSend: anObject {DynamicSuperSend} {^X}
	| arguments receiver methodContext |
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := receiver invokeDynamicSuper: anObject functionName
				for: (Reference value: anObject superReference).
	methodContext loadArguments: (arguments copyWithFirst: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'As yet unclassified')
!
visitExecuteTest: anExecuteTest
	process popFrame.
	anExecuteTest test value
!
(reader addMethod: 'visiting')
!
visitFrame: aFrame {Frame} {^X}
	self pushFrame: aFrame
!
(reader addMethod: 'visiting')
!
visitGetField: anObject {GetField} {^X}
	| receiver |
	receiver := self pop.
	self push: (receiver fieldAt: anObject name)
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
visitIfBooleanObjectThenElse: anObject {IfBooleanObjectThenElse} {^X}
	self pop primitiveValue
		ifTrue: [self pushFrame: anObject trueFrame]
		ifFalse: [self pushFrame: anObject falseFrame]
!
(reader addMethod: 'visiting')
!
visitILoad: anObject {ILoad} {^X}
	self push: (self currentContext localAt: anObject index)
!
(reader addMethod: 'visiting')
!
visitIncrementLocal: anObject {IncrementLocal} {^X}
	self currentContext localAt: anObject index
		put: ((self currentContext localAt: anObject index) incrementWith: anObject increment)
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
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	method := (self vm classForType: anObject ownerType) methodNamed: anObject name
				ifAbsent: [self halt].
	method isPrimitive
		ifTrue: 
			[method name = '<init>' ifTrue: [^self].
			^self halt].
	methodContext := VMMethodContext method: method.
	methodContext loadReceiver: receiver arguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitInvokeStatic: anObject {InvokeStatic} {^X}
	| arguments methodContext aJVMClass |
	arguments := self popArguments: anObject numArgs.
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
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := receiver invokeVirtual: anObject name.
	methodContext loadReceiver: receiver arguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitIStore: anObject {IStore} {^X}
	| value |
	value := self pop.
	self currentContext localAt: anObject index put: value
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
visitObjectArrayLoad: anObject {ObjectArrayLoad} {^X}
	| index array |
	index := self pop value.
	array := self pop.
	self push: (array arrayAt: index)
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
(reader addMethod: 'visiting')
!
visitPop: anObject {Pop} {^X}
	self pop
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
	self pushInt: anObject value
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
visitPutField: anObject {PutField} {^X}
	| value receiver |
	value := self pop.
	receiver := self pop.
	receiver fieldAt: anObject name put: value
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
(reader addMethod: 'visiting')
!
visitSubtract: anObject {Subtract} {^X}
	| right left |
	right := self pop value.
	left := self pop value.
	self pushInt: left - right
!
(reader addMethod: 'visiting')
!
visitWhileGreaterThanLoop: anObject {WhileGreaterThanLoop} {^X}
	^self visitWhileLoop: anObject
!
(reader addMethod: 'visiting')
!
visitWhileLessThanLoop: anObject {WhileLessThanLoop} {^X}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject testFrame
				test: [self executeWhileLessThanTest: anObject])
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
