(reader defineClass: 'InstructionSimulator' superclass: 'st.gravel.support.compiler.jvm.JVMInstructionVisitor')
!
(reader addInstVar: 'process')
!
(reader addMethod: 'visiting')
!
currentContext
	^process currentContext
!
(reader addMethod: 'As yet unclassified')
!
executeAndRight: anObject
	| value |
	value := self pop value.
	value
		ifFalse: 
			[self pushFrame: anObject falseFrame.
			^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject right
				test: [self executeIfTrueIfFalse: anObject])
!
(reader addMethod: 'As yet unclassified')
!
executeIfTrueIfFalse: anObject
	| value |
	value := self pop value.
	value
		ifTrue: [self pushFrame: anObject trueFrame]
		ifFalse: [self pushFrame: anObject falseFrame]
!
(reader addMethod: 'As yet unclassified')
!
executeOrRight: anObject
	| value |
	value := self pop value.
	value
		ifTrue: 
			[self pushFrame: anObject trueFrame.
			^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject right
				test: [self executeIfTrueIfFalse: anObject])
!
(reader addMethod: 'As yet unclassified')
!
executeWhileFalseTest: inst
	| value |
	value := self pop value.
	value ifTrue: [^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: inst doFrame
				test: [self visitWhileFalseLoop: inst])
!
(reader addMethod: 'As yet unclassified')
!
executeWhileGreaterThanTest: inst
	| left right |
	right := self pop value.
	left := self pop value.
	left < right ifTrue: [^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: inst doFrame
				test: [self visitWhileGreaterThanLoop: inst])
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
(reader addMethod: 'As yet unclassified')
!
executeWhileTrueTest: inst
	| value |
	value := self pop value.
	value ifFalse: [^self].
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: inst doFrame
				test: [self visitWhileTrueLoop: inst])
!
(reader addMethod: 'initialize-release')
!
initializeProcess: aVMProcess
	process := aVMProcess.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
invokeDynamic: methodName for: receiver
	receiver isNil
		ifTrue: 
			[| mh jvmClass method |
			mh := self vm systemMapping methodHandleForNil: methodName.
			jvmClass := self vm classForType: mh javaClass jvmType.
			method := jvmClass methodNamed: mh name ifAbsent: [self halt].
			^VMMethodContext method: method].
	^receiver invokeDynamic: methodName
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
(reader addMethod: 'As yet unclassified')
!
produceByteNewArray: aNewArray
	| size |
	size := self pop value.
	self push: (self vm createByteArrayInstance: (ByteArray new: size))
!
(reader addMethod: 'visiting')
!
push: anObject
	self currentContext push: anObject
!
(reader addMethod: 'visiting')
!
pushBoolean: aValue
	self push: (PrimitiveValue value: aValue)
!
(reader addMethod: 'visiting')
!
pushChar: int
	self push: (PrimitiveValue value: int)
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
visit: anObject {Node} {^Self}
	super visit: anObject
!
(reader addMethod: 'visiting')
!
visitALoad: anObject {ALoad} {^Self}
	self push: (self currentContext localAt: anObject index)
!
(reader addMethod: 'visiting')
!
visitAndThenElse: anObject {OrThenElse} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject left
				test: [self executeAndRight: anObject])
!
(reader addMethod: 'visiting')
!
visitAReturn: anObject {AReturn} {^Self}
	process answer: self pop
!
(reader addMethod: 'visiting')
!
visitArrayLength: anObject {ArrayLength} {^Self}
	self pushInt: self pop primitiveValue size
!
(reader addMethod: 'visiting')
!
visitAStore: anObject {AStore} {^Self}
	| value |
	value := self pop.
	self currentContext localAt: anObject index put: value
!
(reader addMethod: 'visiting')
!
visitCastArrayToObject: anObject {CastArrayToObject} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitCastBooleanToObject: anObject {CastBooleanToObject} {^Self}
	| int primitiveValue |
	int := self pop.
	primitiveValue := int value.
	self push: (self vm createBoolean: primitiveValue)
!
(reader addMethod: 'visiting')
!
visitCastCharToObject: anObject {CastCharToObject} {^X}
	| int primitiveValue |
	int := self pop.
	primitiveValue := int value.
	self push: (self vm createCharacter: primitiveValue)
!
(reader addMethod: 'visiting')
!
visitCastDefinedToObject: anObject {CastDefinedToObject} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitCastIntToObject: anObject {CastIntToObject} {^Self}
	| int primitiveValue |
	int := self pop.
	primitiveValue := int value.
	self push: (self vm createInteger: primitiveValue)
!
(reader addMethod: 'visiting')
!
visitCastObjectToArray: anObject {CastObjectToArray} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitCastObjectToBoolean: anObject {CastObjectToBoolean} {^Self}
	| int {VMInstance} |
	int := self pop.
	self pushBoolean: int primitiveValue
!
(reader addMethod: 'visiting')
!
visitCastObjectToDefined: anObject {CastObjectToDefined} {^Self}
	
!
(reader addMethod: 'visiting')
!
visitCastObjectToInt: anObject {CastObjectToInt} {^Self}
	| int {VMInstance} |
	int := self pop.
	self pushInt: int primitiveValue
!
(reader addMethod: 'visiting')
!
visitDup: anObject {Dup} {^Self}
	| v |
	v := self pop.
	self push: v.
	self push: v
!
(reader addMethod: 'visiting')
!
visitDupX1: anObject {DupX1} {^Self}
	| top next |
	top := self pop.
	next := self pop.
	self push: top.
	self push: next.
	self push: top
!
(reader addMethod: 'visiting')
!
visitDupX2: anObject {DupX2} {^Self}
	| top next1 next2 |
	top := self pop.
	next1 := self pop.
	next2 := self pop.
	self push: top.
	self push: next2.
	self push: next1.
	self push: top
!
(reader addMethod: 'visiting')
!
visitDynamicFieldRead: anObject {DynamicFieldRead} {^Self}
	| receiver {VMInstance} |
	receiver := self pop.
	self push: (receiver dynamicInstVarAt: anObject name)
!
(reader addMethod: 'visiting')
!
visitDynamicFieldWrite: anObject {DynamicFieldWrite} {^Self}
	| value receiver {VMInstance} |
	value := self pop.
	receiver := self pop.
	receiver dynamicInstVarAt: anObject name put: value
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalRead: anObject {DynamicGlobalRead} {^Self}
	self push: (self vm
				dynamicGlobalRead: (Reference value: anObject namespace) / anObject name asSymbol)
!
(reader addMethod: 'visiting')
!
visitDynamicGlobalWrite: anObject {DynamicGlobalWrite} {^Self}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitDynamicMessageSend: anObject {DynamicMessageSend} {^Self}
	| arguments receiver {VMAbstractInstance} methodContext {PrimitiveMethodContext | VMMethodContext} |
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := self invokeDynamic: anObject functionName for: receiver.
	methodContext loadArguments: (arguments copyWithFirst: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitDynamicSuperSend: anObject {DynamicSuperSend} {^Self}
	| arguments receiver {VMAbstractInstance} methodContext {PrimitiveMethodContext | VMMethodContext} |
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := receiver invokeDynamicSuper: anObject functionName
				for: (Reference value: anObject superReference).
	methodContext loadArguments: (arguments copyWithFirst: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitExecutePrimitive: anInstruction {ExecutePrimitive} {^Self}
	anInstruction context executeFor: process
!
(reader addMethod: 'visiting')
!
visitExecuteTest: anExecuteTest {ExecuteTest} {^Self}
	process popFrame.
	anExecuteTest test value
!
(reader addMethod: 'visiting')
!
visitFrame: aFrame {Frame} {^Self}
	self pushFrame: aFrame
!
(reader addMethod: 'visiting')
!
visitGetField: anObject {GetField} {^Self}
	| receiver |
	receiver := self pop.
	self push: (receiver fieldAt: anObject name)
!
(reader addMethod: 'visiting')
!
visitGetStatic: anObject {GetStatic} {^Self}
	| field {JVMField} javaClass {Glorp.DatabaseTable | JVMClass} |
	javaClass := self vm classForType: anObject ownerType.
	field := javaClass fieldNamed: anObject name ifAbsent: [self halt].
	self push: ((self vm javaClassInstanceFor: javaClass) getStatic: field varName)
!
(reader addMethod: 'visiting')
!
visitIfBooleanObjectThenElse: anObject {IfBooleanObjectThenElse} {^Self}
	self pop primitiveValue
		ifTrue: [self pushFrame: anObject trueFrame]
		ifFalse: [self pushFrame: anObject falseFrame]
!
(reader addMethod: 'visiting')
!
visitIfBooleanValueThenElse: anObject {IfBooleanValueThenElse} {^X}
	self pop value
		ifTrue: [self pushFrame: anObject trueFrame]
		ifFalse: [self pushFrame: anObject falseFrame]
!
(reader addMethod: 'visiting')
!
visitIfObjectIsNullThenElse: anObject {IfBooleanValueThenElse} {^X}
	self pop isNil
		ifTrue: [self pushFrame: anObject trueFrame]
		ifFalse: [self pushFrame: anObject falseFrame]
!
(reader addMethod: 'visiting')
!
visitILoad: anObject {ILoad} {^Self}
	self push: (self currentContext localAt: anObject index)
!
(reader addMethod: 'visiting')
!
visitIncrementLocal: anObject {IncrementLocal} {^Self}
	self currentContext localAt: anObject index
		put: ((self currentContext localAt: anObject index) incrementWith: anObject increment)
!
(reader addMethod: 'visiting')
!
visitInvokeInterface: anObject {InvokeInterface} {^Self}
	^self visitJVMInstruction: anObject
!
(reader addMethod: 'visiting')
!
visitInvokeSpecial: anObject {InvokeSpecial} {^Self}
	| arguments receiver methodContext {VMMethodContext} method {JVMMethod} |
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
visitInvokeStatic: anObject {InvokeStatic} {^Self}
	| arguments methodContext {PrimitiveMethodContext | VMMethodContext} aJVMClass {SimulatedPrimitives | VMClassInstance | JVMClass} |
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
visitInvokeVirtual: anObject {Object} {^Self}
	| arguments receiver {VMInstance} methodContext {VMMethodContext} |
	arguments := self popArguments: anObject numArgs.
	receiver := self pop.
	methodContext := receiver invokeVirtual: anObject name.
	methodContext loadReceiver: receiver arguments: arguments.
	process pushContext: methodContext
!
(reader addMethod: 'visiting')
!
visitIStore: anObject {IStore} {^Self}
	| value |
	value := self pop.
	self currentContext localAt: anObject index put: value
!
(reader addMethod: 'visiting')
!
visitNewArray: node {NewArray} {^Self}
	node elementType isObjectType ifTrue: [^self produceANewArray: node].
	node elementType isByteType ifTrue: [^self produceByteNewArray: node].
	self halt
!
(reader addMethod: 'visiting')
!
visitNewInstance: anObject {NewInstance} {^Self}
	self push: (self vm createInstance: anObject type)
!
(reader addMethod: 'visiting')
!
visitObjectArrayLoad: anObject {ObjectArrayLoad} {^Self}
	| index array {VMInstance | JavaParser.Expression} |
	index := self pop value.
	array := self pop.
	self push: (array arrayAt: index)
!
(reader addMethod: 'visiting')
!
visitObjectArrayStore: anObject {ObjectArrayStore} {^Self}
	| value index array {VMInstance} |
	value := self pop.
	index := self pop value.
	array := self pop.
	array arrayAt: index put: value
!
(reader addMethod: 'visiting')
!
visitOrThenElse: anObject {OrThenElse} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject left
				test: [self executeOrRight: anObject])
!
(reader addMethod: 'visiting')
!
visitPop: anObject {Pop} {^Self}
	self pop
!
(reader addMethod: 'visiting')
!
visitPopFrame: aPopFrame {PopFrame} {^Self}
	process popFrame
!
(reader addMethod: 'visiting')
!
visitPushBoolean: anObject {PushBoolean} {^Self}
	^self pushBoolean: anObject value
!
(reader addMethod: 'visiting')
!
visitPushChar: anObject {PushChar} {^X}
	self pushChar: anObject value
!
(reader addMethod: 'visiting')
!
visitPushInt: anObject {PushInt} {^Self}
	self pushInt: anObject value
!
(reader addMethod: 'visiting')
!
visitPushNull: anObject {PushNull} {^Self}
	self push: nil
!
(reader addMethod: 'visiting')
!
visitPushString: anObject {PushString} {^Self}
	self push: (self vm createString: anObject value)
!
(reader addMethod: 'visiting')
!
visitPutField: anObject {PutField} {^Self}
	| value receiver {VMInstance | Net.MimeEntity} |
	value := self pop.
	receiver := self pop.
	receiver fieldAt: anObject name put: value
!
(reader addMethod: 'visiting')
!
visitPutStatic: anObject {PutStatic} {^Self}
	| field {JVMField} javaClass {Glorp.DatabaseTable | JVMClass} value |
	value := self pop.
	javaClass := self vm classForType: anObject ownerType.
	field := javaClass fieldNamed: anObject name ifAbsent: [self halt].
	(self vm javaClassInstanceFor: javaClass) putStatic: field varName value: value
!
(reader addMethod: 'visiting')
!
visitReturn: anObject {Return} {^Self}
	process popMethodContext
!
(reader addMethod: 'visiting')
!
visitSubtract: anObject {Subtract} {^Self}
	| right left |
	right := self pop value.
	left := self pop value.
	self pushInt: left - right
!
(reader addMethod: 'visiting')
!
visitTryCatch: anObject {TryCatch} {^X}
	process pushContext: (VMHandlerFrameContext
				parent: self currentContext
				frame: anObject tryFrame
				exception: anObject exception
				catchFrame: anObject catchFrame)
!
(reader addMethod: 'visiting')
!
visitWhileFalseLoop: anObject {WhileFalseLoop} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject testFrame
				test: [self executeWhileFalseTest: anObject])
!
(reader addMethod: 'visiting')
!
visitWhileGreaterThanLoop: anObject {WhileGreaterThanLoop} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject testFrame
				test: [self executeWhileGreaterThanTest: anObject])
!
(reader addMethod: 'visiting')
!
visitWhileLessThanLoop: anObject {WhileLessThanLoop} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject testFrame
				test: [self executeWhileLessThanTest: anObject])
!
(reader addMethod: 'visiting')
!
visitWhileTrueLoop: anObject {WhileTrueLoop} {^Self}
	process pushContext: (VMTestFrameContext
				parent: self currentContext
				frame: anObject testFrame
				test: [self executeWhileTrueTest: anObject])
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
(reader addClassMethod: 'pegon')
!
supertype
	^#{NodeVisitor} => #{Object}
!
(reader addClassMethod: 'pegon')
!
typeParameters
	^#()
!
