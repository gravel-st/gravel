(reader defineClass: 'LiteralSendInlinerTest' superclass: 'org.gravel.sunit.TestCase')
!
(reader addMethod: 'As yet unclassified')
!
test2
	| method res |
	method := Parser
				parseMethod: 'do: aBlock
	1 to: (self size) by: 1 do: [:each |  [:elem || result_0 |
 first value ifTrue: [ first value: false] ifFalse: [| result |
 result := (stream space).
 result].
 result_0 := (stream nextPutAll: elem).
 result_0] value: (self at: each)]'.
	res := LiteralSendInliner inline: method.
	self assert: res sourceString
				= ' stream nextPut: $<;  nextPutAll: aString;  space.
 (classes isEmpty) ifFalse: [ stream nextPutAll: ''class="''.
 classes do: [:each | stream nextPutAll: each] separatedBy: [ stream space].
 stream nextPutAll: ''" ''.
 classes := #()].
 aDictionary keysAndValuesDo: [:k :v | stream nextPutAll: k;  nextPutAll: ''="'';  nextPutAll: (v asString);  nextPutAll: ''" ''].
 false ifTrue: [ stream nextPutAll: ''/>''] ifFalse: [| t_0 result |
 stream nextPut: $>.
 t_0 := (elem printString).
 result := (self foo: (t_0 , ''fromage'')).
 result.
 stream nextPutAll: ''</'';  nextPutAll: aString;  nextPut: $>]'
!
(reader addMethod: 'As yet unclassified')
!
testBlockInliningMultiExpressionAndTemps
	| method block res body |
	method := Parser
				parseMethod: 'collect: aBlock  
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection'.
	block := Parser
				parseExpression: '[:elem | | t | t :=  elem printString.
t , ''fromage''
]'.
	body := method body.
	body := VariableNodeReplacer
				in: body
				replace: 'self'
				with: (VariableNode name: 'receiver').
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: body replace: 'aBlock' with: block).
	self assert: res sourceString
				= '| newCollection |
 newCollection := ((receiver species) new).
 receiver do: [:each || t_0 result |
 t_0 := (each printString).
 result := (t_0 , ''fromage'').
 newCollection add: result].
 ^newCollection'
!
(reader addMethod: 'As yet unclassified')
!
testBlockInliningMultiExpressionNoTemps
	| method block res |
	method := Parser
				parseMethod: 'collect: aBlock  
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection'.
	block := Parser parseExpression: '[:elem | elem bar. elem printString]'.
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: method replace: 'aBlock' with: block).
	self assert: res sourceString
				= 'collect: aBlock| newCollection |
	newCollection := ((self species) new).
	self do: [:each || result |
 each bar.
 result := (each printString).
 newCollection add: result].
	^newCollection'
!
(reader addMethod: 'As yet unclassified')
!
testBlockInliningSingleExpressionNoTemps
	| method block res |
	method := Parser
				parseMethod: 'collect: aBlock  
	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection'.
	block := Parser parseExpression: '[:elem | elem printString]'.
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: method replace: 'aBlock' with: block).
	self assert: res sourceString
				= 'collect: aBlock| newCollection |
	newCollection := ((self species) new).
	self do: [:each || result |
 result := (each printString).
 newCollection add: result].
	^newCollection'
!
(reader addMethod: 'As yet unclassified')
!
testInlineBlockWithRenameArg
	| method block res body |
	method := Parser
				parseMethod: 'do: aBlock
	self coll do: [:each | 
self foo: each bar: aBlock]'.
	block := Parser parseExpression: '[:each | self bar: each]'.
	body := method body.
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: body replace: 'aBlock' with: block).
	self assert: res sourceString
				= ' (self coll) do: [:each | self foo: each bar: [:each_0 | self bar: each_0]]'
!
(reader addMethod: 'As yet unclassified')
!
testInlineTwoBlocks
	| method block res body |
	method := Parser
				parseMethod: 'tag: aString attributes: aDictionary do: aBlock
	stream nextPut: $<;  nextPutAll: aString;  space.
	(classes isEmpty) ifFalse: [ stream nextPutAll: ''class="''.
 classes do: [:each | stream nextPutAll: each] separatedBy: [ stream space].
 stream nextPutAll: ''" ''.
 classes := #()].
	aDictionary keysAndValuesDo: [:k :v | stream nextPutAll: k;  nextPutAll: ''="'';  nextPutAll: (v asString);  nextPutAll: ''" ''].
	(aBlock isNil) ifTrue: [ stream nextPutAll: ''/>''] ifFalse: [ stream nextPut: $>.
 aBlock value.
 stream nextPutAll: ''</'';  nextPutAll: aString;  nextPut: $>]'.
	block := Parser
				parseExpression: '[ | t | t :=  elem printString.
self foo: (t , ''fromage'')
]'.
	body := method body.
	body := VariableNodeReplacer
				in: body
				replace: 'self'
				with: (VariableNode name: 'receiver').
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: body replace: 'aBlock' with: block).
	self assert: res sourceString
				= ' stream nextPut: $<;  nextPutAll: aString;  space.
 (classes isEmpty) ifFalse: [ stream nextPutAll: ''class="''.
 classes do: [:each | stream nextPutAll: each] separatedBy: [ stream space].
 stream nextPutAll: ''" ''.
 classes := #()].
 aDictionary keysAndValuesDo: [:k :v | stream nextPutAll: k;  nextPutAll: ''="'';  nextPutAll: (v asString);  nextPutAll: ''" ''].
 false ifTrue: [ stream nextPutAll: ''/>''] ifFalse: [| t_0 result |
 stream nextPut: $>.
 t_0 := (elem printString).
 result := (self foo: (t_0 , ''fromage'')).
 result.
 stream nextPutAll: ''</'';  nextPutAll: aString;  nextPut: $>]'
!
(reader addMethod: 'As yet unclassified')
!
testInlineTwoBlocksNested
	| method block res body |
	method := Parser
				parseMethod: 'tag: aString attributes: aDictionary do: aBlock
	stream nextPut: $<;  nextPutAll: aString;  space.
	(classes isEmpty) ifFalse: [ stream nextPutAll: ''class="''.
 classes do: [:each | stream nextPutAll: each] separatedBy: [ stream space].
 stream nextPutAll: ''" ''.
 classes := #()].
	aDictionary keysAndValuesDo: [:k :v | stream nextPutAll: k;  nextPutAll: ''="'';  nextPutAll: (v asString);  nextPutAll: ''" ''].
	(aBlock isNil) ifTrue: [ stream nextPutAll: ''/>''] ifFalse: [ stream nextPut: $>.
 aBlock value.
 stream nextPutAll: ''</'';  nextPutAll: aString;  nextPut: $>]'.
	block := Parser
				parseExpression: '[ | t | t :=  elem printString.
self foo: (t , ''fromage'')
]'.
	body := method body.
	body := VariableNodeReplacer
				in: body
				replace: 'self'
				with: (VariableNode name: 'receiver').
	res := LiteralSendInliner
				inline: (VariableNodeReplacer in: body replace: 'aBlock' with: block).
	self assert: res sourceString
				= ' stream nextPut: $<;  nextPutAll: aString;  space.
 (classes isEmpty) ifFalse: [ stream nextPutAll: ''class="''.
 classes do: [:each | stream nextPutAll: each] separatedBy: [ stream space].
 stream nextPutAll: ''" ''.
 classes := #()].
 aDictionary keysAndValuesDo: [:k :v | stream nextPutAll: k;  nextPutAll: ''="'';  nextPutAll: (v asString);  nextPutAll: ''" ''].
 false ifTrue: [ stream nextPutAll: ''/>''] ifFalse: [| t_0 result |
 stream nextPut: $>.
 t_0 := (elem printString).
 result := (self foo: (t_0 , ''fromage'')).
 result.
 stream nextPutAll: ''</'';  nextPutAll: aString;  nextPut: $>]'
!
