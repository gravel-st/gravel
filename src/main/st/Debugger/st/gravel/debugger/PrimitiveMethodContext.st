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
answerInteger: anInteger
	process answer: (process vm createInteger: anInteger)
!
(reader addMethod: 'As yet unclassified')
!
answerSymbol: anInteger
	process answer: (process vm createSymbol: anInteger)
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
prim_ArrayExtensions_size
	self answerInteger: arguments first primitiveValue size
!
(reader addMethod: 'As yet unclassified')
!
prim_IntegerExtensions_plus_
	self answerInteger: arguments first primitiveValue + arguments second primitiveValue
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
