(reader defineClass: 'TestGenerator' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'ansiSpec')
!
(reader addInstVar: 'selectorConverter')
!
(reader addMethod: 'As yet unclassified')
!
generateAssertReturnValue: aReturnRuleSpec value: testValue result: result on: str
	aReturnRuleSpec isReturnValuesRuleSpec
		ifTrue: 
			[aReturnRuleSpec values do: 
					[:each |
					str
						nextPutAll: 'self assert: (self valueIsKindOf';
						nextPutAll: (self protocolStringFor: (self protocolAt: each first));
						nextPutAll: ': ('.
					result sourceOn: str.
					str
						nextPutAll: ')).';
						cr].
			^self].
	str nextPutAll: 'self assert: ('.
	result sourceOn: str.
	str
		nextPutAll: ') notNil.';
		cr
!
(reader addMethod: 'As yet unclassified')
!
generateTestClassFor: anAnsiProtocolSpec
	| testClassName cl |
	testClassName := ((self protocolStringFor: anAnsiProtocolSpec) , 'Test') asSymbol.
	cl := Smalltalk.Gravel_st_gravel_ansitests at: testClassName
				ifAbsent: 
					[Smalltalk.Gravel_st_gravel_ansitests
						defineClass: testClassName
						superclass: #{Smalltalk.Gravel_st_gravel_ansitests.ANSITest}
						indexedType: #none
						private: false
						instanceVariableNames: ''
						classInstanceVariableNames: ''
						imports: ''
						category: ''].
	self generateTestSelectorsFor: anAnsiProtocolSpec class: cl
!
(reader addMethod: 'As yet unclassified')
!
generateTests
	ansiSpec := AnsiDB.AnsiProtocol allProtocols.
	ansiSpec protocolsDo: 
			[:each |
			self generateTestClassFor: each.
			self generateValidateMethod: each]
!
(reader addMethod: 'As yet unclassified')
!
generateTestSelectorFor: aMessagePatternSpec class: aClass
	| testSel src |
	testSel := self testSelectorFor: aMessagePatternSpec selector.
	src := String filledBy: 
					[:str |
					str
						nextPutAll: testSel;
						cr;
						tab;
						nextPutAll: '"';
						nextPutAll: aMessagePatternSpec synopsis trimBlanks;
						nextPutAll: '"';
						cr;
						cr;
						tab;
						nextPutAll: '"';
						nextPutAll: aMessagePatternSpec definition trimBlanks;
						nextPutAll: '"';
						cr;
						tab;
						nextPutAll: 'self valuesDo: [:testValue | | res |';
						cr;
						tab;
						nextPutAll: 'res := '.
					(SP.MessageNode
						receiver: (SP.VariableNode name: 'testValue')
						selector: aMessagePatternSpec selector
						arguments: (aMessagePatternSpec parameters
								collect: [:each | (SP.VariableNode name: 'self') send: 'parameter' , each first capitalized]))
							sourceOn: str.
					str
						nextPutAll: '.';
						cr.
					self
						generateAssertReturnValue: aMessagePatternSpec returnRuleSpec
						value: (SP.VariableNode name: 'testValue')
						result: (SP.VariableNode name: 'res')
						on: str.
					str nextPutAll: '].'].
	aClass formatAndCompile: src classified: 'tests'
!
(reader addMethod: 'As yet unclassified')
!
generateTestSelectorsFor: anAnsiProtocolSpec class: aClass
	anAnsiProtocolSpec
		messagePatternsDo: [:each | self generateTestSelectorFor: each class: aClass]
!
(reader addMethod: 'As yet unclassified')
!
generateValidateMethod: anAnsiProtocolSpec
	| value t node sel method |
	value := SP.VariableNode name: 'aValue'.
	node := (ansiSpec classesForProtocol: anAnsiProtocolSpec) inject: nil
				into: 
					[:s :e |
					t := (value send: 'class') send: '=' with: (SP.VariableNode name: e name).
					s isNil ifTrue: [t] ifFalse: [t send: 'or:' with: (SP.BlockNode expression: s)]].
	node isNil ifTrue: [node := SP.BooleanLiteralNode false].
	sel := 'valueIsKindOf' , (self protocolStringFor: anAnsiProtocolSpec) , ':'.
	method := SP.KeywordMethodNode
				selector: sel
				arguments: (Array with: value)
				body: (SP.SequenceNode return: node).
	Smalltalk.Gravel_st_gravel_ansitests.ANSITest formatAndCompile: method sourceString
		classified: 'tests'
!
(reader addMethod: 'As yet unclassified')
!
protocolAt: aString
	^ansiSpec protocolAt: aString asSymbol
!
(reader addMethod: 'As yet unclassified')
!
protocolStringFor: anAnsiProtocolSpec
	^anAnsiProtocolSpec name subStrings join: [:each | each capitalized]
!
(reader addMethod: 'As yet unclassified')
!
selectorConverter
	selectorConverter isNil ifTrue: [selectorConverter := SP.SelectorConverter new].
	^selectorConverter
!
(reader addMethod: 'As yet unclassified')
!
testSelectorFor: sym
	sym isUnary ifTrue: [^'test_' , sym].
	sym isBinary
		ifTrue: 
			[^'test_'
				, ((sym collectAsArray: [:e | self selectorConverter specialCharacterAt: e]) joinWith: '_')].
	^'test_' , (sym keywords join: [:e | e allButLast , '_'])
!
