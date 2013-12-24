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
answerCharacter: aValue
	aValue isNil
		ifTrue: 
			[process answer: nil.
			^self].
	process answer: (process vm createCharacter: aValue)
!
(reader addMethod: 'As yet unclassified')
!
answerInstance: type primitiveValue: aValue
	process answer: (process vm createInstance: type primitiveValue: aValue)
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
	^ExecutePrimitive context: self
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
prim_ArrayExtensions_replaceFrom_to_with_startingAt_
	| args |
	args := arguments tail collect: [:e | e primitiveValue].
	arguments first primitiveValue perform: #replaceFrom:to:with:startingAt:
		withArguments: args.
	process answer: arguments first
!
(reader addMethod: 'As yet unclassified')
!
prim_ArrayExtensions_size
	self answerInteger: arguments first primitiveValue size
!
(reader addMethod: 'As yet unclassified')
!
prim_CharacterExtensions_digitValue
	self answerInteger: arguments first primitiveValue digitValue
!
(reader addMethod: 'As yet unclassified')
!
prim_CharacterExtensions_isDigit
	self answerBoolean: arguments first primitiveValue isDigit
!
(reader addMethod: 'As yet unclassified')
!
prim_CharacterExtensions_isSmallerThan_
	self answerBoolean: arguments first primitiveValue < arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_CharacterExtensions_isWhitespace
	self answerBoolean: arguments first primitiveValue isWhitespace
!
(reader addMethod: 'As yet unclassified')
!
prim_Character_equals
	| left right |
	left := arguments first.
	right := arguments second.
	self answerBoolean: left primitiveValue = right primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_DictionaryExtensions_at_ifAbsent_
	| marker res |
	marker := Object new.
	res := arguments first primitiveDictionary at: arguments second ifAbsent: [marker].
	res == marker ifTrue: [self halt].
	process answer: res
!
(reader addMethod: 'As yet unclassified')
!
prim_DictionaryExtensions_at_put_
	arguments first primitiveDictionary at: arguments second put: arguments third.
	process answer: arguments third
!
(reader addMethod: 'As yet unclassified')
!
prim_DictionaryExtensions_keysAndValuesDo_
	self halt
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
prim_IntegerExtensions_multiply_
	self answerInteger: arguments first primitiveValue * arguments second primitiveValue
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
prim_ObjectExtensions_identityEquals_
	| left right |
	left := arguments first.
	right := arguments second.
	left isNil ifTrue: [^self answerBoolean: right isNil].
	(left primitiveValue isNil and: [right primitiveValue isNil])
		ifTrue: [self answerBoolean: left == right]
		ifFalse: [self answerBoolean: left primitiveValue == right primitiveValue]
!
(reader addMethod: 'As yet unclassified')
!
prim_ObjectExtensions_perform_
	| receiver selector functionName methodContext |
	receiver := arguments first.
	selector := arguments second primitiveValue.
	functionName := process vm selectorConverter selectorAsFunctionName: selector.
	methodContext := receiver invokeDynamic: functionName.
	methodContext loadArguments: (Array with: receiver).
	process pushContext: methodContext
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_atEnd
	self answerBoolean: arguments first primitiveValue atEnd
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_next
	self answerCharacter: arguments first primitiveValue next
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_peek
	self answerCharacter: arguments first primitiveValue peek
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_peekFor_
	self
		answerBoolean: (arguments first primitiveValue peekFor: arguments second primitiveValue)
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_position
	self answerInteger: arguments first primitiveValue position
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamExtensions_skip_
	arguments first primitiveValue skip: arguments second primitiveValue.
	process answer: arguments first
!
(reader addMethod: 'As yet unclassified')
!
prim_ReadStreamFactory_on_
	self answerInstance: JVMDefinedObjectType charBuffer
		primitiveValue: arguments second primitiveValue readStream
!
(reader addMethod: 'As yet unclassified')
!
prim_SimulatorExtensions_getSystemMapping
	process
		answer: ((process vm createInstance: (JVMDefinedObjectType
						dottedClassName: 'st.gravel.support.compiler.ast.SystemMapping'))
				primitiveValue: process vm systemMapping)
!
(reader addMethod: 'As yet unclassified')
!
prim_StringBuilder_toString
	self answerString: arguments first primitiveValue contents
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_at_
	self
		answerCharacter: (arguments first primitiveValue at: arguments second primitiveValue)
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_newInstance_
	self answerString: (String new: arguments second primitiveValue)
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_size
	self answerInteger: arguments first primitiveValue size
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_sortsLowerThan_
	self answerBoolean: arguments first primitiveValue < arguments second primitiveValue
!
(reader addMethod: 'As yet unclassified')
!
prim_StringExtensions_tokensBasedOn_
	^self
		answerArray: ((arguments first primitiveValue
				tokensBasedOn: arguments second primitiveValue) asArray
				collect: [:each | process vm createString: each])
!
(reader addMethod: 'As yet unclassified')
!
prim_SymbolExtensions_newInstance_
	self answerSymbol: arguments second primitiveValue asSymbol
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
(reader addMethod: 'As yet unclassified')
!
prim_WriteStreamExtensions_nextPutAll_
	arguments first primitiveValue nextPutAll: arguments second primitiveValue.
	process answer: arguments first
!
(reader addMethod: 'As yet unclassified')
!
prim_WriteStreamExtensions_nextPut_
	arguments first primitiveValue nextPut: arguments second primitiveValue.
	process answer: arguments first
!
(reader addMethod: 'As yet unclassified')
!
prim_WriteStreamFactory_on_
	self answerInstance: JVMDefinedObjectType stringBuilder
		primitiveValue: (WriteStream on: arguments second primitiveValue)
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
