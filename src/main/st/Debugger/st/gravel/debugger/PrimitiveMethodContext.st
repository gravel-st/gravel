(reader defineClass: 'PrimitiveMethodContext' superclass: 'st.gravel.debugger.VMContext')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'arguments')
!
(reader addInstVar: 'process')
!
(reader addInstVar: 'simPrefix')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitPrimitiveMethodContext: self
!
(reader addMethod: 'As yet unclassified')
!
answerArray: aValue
	process answer: (process vm createArrayInstance: aValue)
!
(reader addMethod: 'As yet unclassified')
!
answerBoolean: aValue
	process answer: (process vm createBoolean: aValue)
!
(reader addMethod: 'As yet unclassified')
!
answerInteger: aValue
	process answer: (process vm createInteger: aValue)
!
(reader addMethod: 'As yet unclassified')
!
answerString: aValue
	process answer: (process vm createString: aValue)
!
(reader addMethod: 'As yet unclassified')
!
answerSymbol: aValue
	process answer: (process vm createSymbol: aValue)
!
(reader addMethod: 'As yet unclassified')
!
currentInstruction
	^self
!
(reader addMethod: 'As yet unclassified')
!
executeFor: aVMProcess
	process := aVMProcess.
	self perform: ('prim_' , simPrefix , '_' , name) asSymbol
!
(reader addMethod: 'As yet unclassified')
!
incrementIP
	
!
(reader addMethod: 'initialize-release')
!
initializeSimPrefix: aString name: aString2
	simPrefix := aString.
	name := aString2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
loadArguments: anArray
	arguments := anArray
!
(reader addMethod: 'accessing')
!
name
	^name
!
(reader addMethod: 'As yet unclassified')
!
prim_ArrayExtensions_newInstance_
	^self answerArray: (Array new: arguments second primitiveValue)
!
(reader addMethod: 'As yet unclassified')
!
prim_ArrayExtensions_size
	self answerInteger: arguments first primitiveValue size
!
(reader addMethod: 'As yet unclassified')
!
prim_ExceptionExtensions_ensure_
	| methodContext newUnwindContext |
	methodContext := arguments first invokeValue.
	newUnwindContext := arguments second invokeValue.
	methodContext unwindContext: newUnwindContext.
	process pushContext: methodContext
!
(reader addMethod: 'As yet unclassified')
!
prim_ExceptionExtensions_on_do_
	| methodContext |
	methodContext := arguments first invokeValue.
	process pushContext: methodContext
!
(reader addMethod: 'As yet unclassified')
!
prim_IntegerExtensions_integerDivision_
	self answerInteger: arguments first primitiveValue // arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_IntegerExtensions_isSmallerThan_
	self answerBoolean: arguments first primitiveValue < arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_IntegerExtensions_minus_
	self answerInteger: arguments first primitiveValue - arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_IntegerExtensions_plus_
	self answerInteger: arguments first primitiveValue + arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_Integer_equals
	self answerBoolean: arguments first primitiveValue = arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_sortsLowerThan_
	self answerBoolean: arguments first primitiveValue < arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_Symbol_asString
	self answerString: arguments first primitiveValue asString
!
(reader addMethod: 'As yet unclassified')
!
prim_Symbol_value
	self answerSymbol: arguments first primitiveValue asSymbol
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream
		nextPutAll: 'simPrefix: ';
		print: simPrefix.
	aStream
		nextPutAll: ', name: ';
		print: name.
	aStream nextPut: $]
!
(reader addMethod: 'accessing')
!
simPrefix
	^simPrefix
!
(reader addClassMethod: 'instance creation')
!
simPrefix: aString name: aString2
	^self new initializeSimPrefix: aString name: aString2
!
