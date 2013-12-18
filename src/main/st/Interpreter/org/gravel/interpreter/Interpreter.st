(reader defineClass: 'Interpreter' superclass: 'org.gravel.support.compiler.ast.NodeVisitor')
!
(reader addInstVar: 'parent')
!
(reader addInstVar: 'localVariables')
!
(reader addClassInstVar: 'specialSelectors')
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitInterpreter: self
!
(reader addMethod: 'accessing')
!
createVariable: varName
	self createVariable: varName value: nil
!
(reader addMethod: 'accessing')
!
createVariable: varName value: aValue
	localVariables at: varName put: aValue
!
(reader addMethod: 'accessing')
!
froamge: body
	| res |
	body temporaries do: [:t | self createVariable: t name].
	res := nil.
	body statements do: [:s | res := self visit: s].
	^res
!
(reader addMethod: 'initialize-release')
!
initialize
	localVariables := Dictionary new
!
(reader addMethod: 'initialize-release')
!
initializeParent: anInterpreter
	parent := anInterpreter.
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
(reader addMethod: 'visiting')
!
produce: rec ifFalse: arg
	^(self visit: rec) ifTrue: [nil] ifFalse: [(self visit: arg) value]
!
(reader addMethod: 'visiting')
!
produce: rec ifTrue: arg
	^(self visit: rec) ifTrue: [(self visit: arg) value] ifFalse: [nil]
!
(reader addMethod: 'visiting')
!
produce: rec ifTrue: arg1 ifFalse: arg2
	^(self visit: rec) ifTrue: [(self visit: arg1) value] ifFalse: [(self visit: arg2) value]
!
(reader addMethod: 'visiting')
!
produce: rec message: aMessageNode
	| args |
	args := aMessageNode arguments collect: [:each | self visit: each].
	^rec perform: aMessageNode selector asSymbol withArguments: args
!
(reader addMethod: 'visiting')
!
variableAt: varName ifAbsent: aBlock
	^localVariables at: varName
		ifAbsent: 
			[parent isNil ifTrue: [aBlock value] ifFalse: [parent variableAt: varName ifAbsent: aBlock]]
!
(reader addMethod: 'visiting')
!
variableAt: varName put: aValue
	((localVariables includesKey: varName) or: [parent isNil])
		ifTrue: [^localVariables at: varName put: aValue].
	^parent variableAt: varName put: aValue
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: anObject
	| value |
	value := self visit: anObject value.
	self variableAt: anObject variable name put: value.
	^value
!
(reader addMethod: 'visiting')
!
visitBlockNode: anObject {BlockNode} {^X}
	^InterpretedBlock blockNode: anObject parentInterpreter: self
!
(reader addMethod: 'visiting')
!
visitCascadeNode: anObject
	| rec res |
	rec := self visit: anObject receiver.
	anObject messages do: [:msg | res := self produce: rec message: msg].
	^res
!
(reader addMethod: 'visiting')
!
visitLiteralNode: anObject {LiteralNode} {^X}
	^anObject value
!
(reader addMethod: 'visiting')
!
visitMessageNode: aMessageNode {MessageNode} {^X}
	| rec block |
	block := self class specialSelectors at: aMessageNode selector asSymbol
				ifAbsent: 
					[rec := self visit: aMessageNode receiver.
					^self produce: rec message: aMessageNode].
	^block value: self value: aMessageNode
!
(reader addMethod: 'visiting')
!
visitSequenceNode: aSequenceNode
	| res |
	aSequenceNode temporaries do: [:t | self createVariable: t name].
	res := nil.
	aSequenceNode statements do: [:s | res := self visit: s].
	^res
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject
	^self variableAt: anObject name ifAbsent: [nil]
!
(reader addClassMethod: 'instance creation')
!
buildSpecialSelectors
	^(Dictionary new)
		at: #ifTrue: put: [:i :msg | i produce: msg receiver ifTrue: msg arguments first];
		at: #ifFalse: put: [:i :msg | i produce: msg receiver ifFalse: msg arguments first];
		at: #ifTrue:ifFalse:
			put: 
				[:i :msg |
				i
					produce: msg receiver
					ifTrue: msg arguments first
					ifFalse: msg arguments second];
		at: #ifFalse:ifTrue:
			put: 
				[:i :msg |
				i
					produce: msg receiver
					ifTrue: msg arguments second
					ifFalse: msg arguments first];
		yourself
!
(reader addClassMethod: 'As yet unclassified')
!
evaluate: aString
	^self visit: (Parser parseExpression: aString)
!
(reader addClassMethod: 'instance creation')
!
parent: anInterpreter
	^self new initializeParent: anInterpreter
!
(reader addClassMethod: 'instance creation')
!
specialSelectors
	specialSelectors isNil ifTrue: [specialSelectors := self buildSpecialSelectors].
	^specialSelectors
!
