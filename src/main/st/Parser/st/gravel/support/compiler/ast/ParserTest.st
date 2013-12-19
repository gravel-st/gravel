(reader defineClass: 'ParserTest' superclass: 'st.gravel.sunit.TestCase')
!
(reader addMethod: 'tests')
!
testAssignmentExpression {^Self}
	| node {Statement | Nil} |
	node := (Parser source: ' foo := 7 ') parseStatement.
	self assert: node class = AssignmentNode.
	self assert: 'foo := 7' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testAssignmentExpressionInBlock
	| node {Statement | Nil} |
	node := (Parser source: '[ foo := 7 ]') parseStatement.
	self assert: node class = BlockNode.
	self assert: '[foo := 7]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParse2ArgBlockEmpty1
	| node {BlockNode | Nil} |
	node := (Parser source: '[:a :b  | ]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '[:a :b | ]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParse2ArgBlockEmpty2
	| node {Statement | Nil} |
	node := (Parser source: '[:a :b ]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '[:a :b | ]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParse2ArgBlockNoTemps
	| node {Statement | Nil} |
	node := (Parser source: '[:a :b  | a foo. b bar]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[:a :b | 
a foo.
b bar]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParse2ArgBlockNoTempsDotEnd
	| node {Statement | Nil} |
	node := (Parser source: '[:a :b  | a foo. b bar.]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[:a :b | 
a foo.
b bar]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParse2ArgBlockWithTemps
	| node {Statement | Nil} |
	node := (Parser source: '[:a :b  | | c | a foo. b bar. c foo]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[:a :b | 
| c |
a foo.
b bar.
c foo]' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseBinaryExpression
	| node {Statement | Nil} |
	node := (Parser source: ' 3 + 7 ') parseExpression.
	self assert: node class = BinaryMessageNode.
	self assert: '3 + 7' equals: node prettySourceString
!
(reader addMethod: 'tests methods')
!
testParseBinaryMethod {^Self}
	| node {BinaryMethodNode | Nil} |
	node := Parser parseMethod: '+ arg ^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseBinaryUnaryExpression
	| node {Statement | Nil} |
	node := (Parser source: ' 3 bar + 2 + 1 foo') parseExpression.
	self assert: node class = BinaryMessageNode.
	self assert: '3 bar + 2 + 1 foo' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseByteArray
	| node {ByteArrayLiteralNode | Nil} |
	node := (Parser source: '#[1 2 3]') parseExpression.
	self assert: node class = ByteArrayLiteralNode.
	self assert: '#[1 2 3]' equals: node prettySourceString.
	self assert: node value = #[1 2 3]
!
(reader addMethod: 'tests')
!
testParseByteArrayHighValues
	| node {ByteArrayLiteralNode | Nil} |
	node := (Parser source: '#[0 127 128 129 255 0]') parseExpression.
	self assert: node class = ByteArrayLiteralNode.
	self assert: '#[0 127 128 129 255 0]' equals: node prettySourceString.
	self assert: node value = #[0 127 128 129 255 0]
!
(reader addMethod: 'tests')
!
testParseCascade
	| node {Statement | Nil} |
	node := (Parser source: '3 foo + 2
		+ 3;
		bar: 2;
		baz: 3;
		baz: 4;
		boo')
				parseExpression.
	self assert: CascadeNode equals: node class.
	self assert: '(3 foo + 2) + 3; bar: 2; baz: 3; baz: 4; boo'
		equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseChar
	| node {CharacterLiteralNode | Nil} |
	node := (Parser source: '$a') parseExpression.
	self assert: node class = CharacterLiteralNode.
	self assert: '$a' equals: node prettySourceString.
	self assert: node value = $a
!
(reader addMethod: 'tests blocks')
!
testParseEmptyBlock
	| node {Statement | Nil} |
	node := (Parser source: '[]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '[]' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseFixedPoint
	| node {FixedPointLiteralNode | Nil} |
	node := (Parser source: '12345.0067s') parseExpression.
	self assert: FixedPointLiteralNode equals: node class.
	self assert: 12345.0067s equals: node value
!
(reader addMethod: 'tests')
!
testParseFloat
	| node {FloatLiteralNode | Nil} |
	node := (Parser source: '123412341345145145123412341234.003213123123') parseExpression.
	self assert: FloatLiteralNode equals: node class.
	self
		assert: '123412341345145145123412341234.003213123123'
		equals: node value
		delta: '0.000000001'
!
(reader addMethod: 'tests')
!
testParseFloatWithExponent
	| node {FloatLiteralNode | Nil} |
	node := (Parser source: '1.23412e29') parseExpression.
	self assert: FloatLiteralNode equals: node class.
	self
		assert: '1.23412e29'
		equals: node value
		delta: '0.000000001'
!
(reader addMethod: 'tests')
!
testParseFloatWithNegativeExponent
	| node {FloatLiteralNode | Nil} |
	node := (Parser source: '1.23412e-29') parseExpression.
	self assert: FloatLiteralNode equals: node class.
	self
		assert: '1.23412e-29'
		equals: node value
		delta: '0.000000001'
!
(reader addMethod: 'tests')
!
testParseHexInteger
	| node {IntegerLiteralNode | Nil} |
	node := (Parser source: '16rFF') parseExpression.
	self assert: IntegerLiteralNode equals: node class.
	self assert: 255 equals: node value
!
(reader addMethod: 'tests')
!
testParseInteger
	| node {IntegerLiteralNode | Nil} |
	node := (Parser source: '123') parseExpression.
	self assert: IntegerLiteralNode equals: node class.
	self assert: 123 equals: node value
!
(reader addMethod: 'tests')
!
testParseIntegerSpace
	| node {IntegerLiteralNode | Nil} |
	node := (Parser source: '123 ') parseExpression.
	self assert: IntegerLiteralNode equals: node class.
	self assert: 123 equals: node value
!
(reader addMethod: 'tests')
!
testParseKeywordBinaryUnaryExpression1
	| node {Statement | Nil} |
	node := (Parser
				source: '2 bar + 7 foo: 7 bar: 4 baz foo: 2 + 1 boo: 3 foo + 2 roo: 3 + 2 foo noo: 3 hoo + 2 joo')
					parseExpression.
	self assert: node class = KeywordMessageNode.
	self
		assert: '2 bar + 7
	foo: 7
	bar: 4 baz
	foo: 2 + 1
	boo: 3 foo + 2
	roo: 3 + 2 foo
	noo: 3 hoo + 2 joo'
		equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseKeywordBinaryUnaryExpression2
	| node {Statement | Nil} |
	node := (Parser
				source: '2 bar foo: 7 bar: 4 baz foo: 2 + 1 boo: 3 foo + 2 roo: 3 + 2 foo noo: 3 hoo + 2 joo')
					parseExpression.
	self assert: node class = KeywordMessageNode.
	self
		assert: '2 bar
	foo: 7
	bar: 4 baz
	foo: 2 + 1
	boo: 3 foo + 2
	roo: 3 + 2 foo
	noo: 3 hoo + 2 joo'
		equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseKeywordBinaryUnaryExpression3
	| node {Statement | Nil} |
	node := (Parser
				source: '2 + 7 foo: 7 bar: 4 baz foo: 2 + 1 boo: 3 foo + 2 roo: 3 + 2 foo noo: 3 hoo + 2 joo')
					parseExpression.
	self assert: node class = KeywordMessageNode.
	self
		assert: '2 + 7
	foo: 7
	bar: 4 baz
	foo: 2 + 1
	boo: 3 foo + 2
	roo: 3 + 2 foo
	noo: 3 hoo + 2 joo'
		equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseKeywordBinaryUnaryExpression4
	| node {Statement | Nil} |
	node := (Parser
				source: '2 + 7 bar foo: 7 bar: 4 baz foo: 2 + 1 boo: 3 foo + 2 roo: 3 + 2 foo noo: 3 hoo + 2 joo')
					parseExpression.
	self assert: node class = KeywordMessageNode.
	self
		assert: '2 + 7 bar
	foo: 7
	bar: 4 baz
	foo: 2 + 1
	boo: 3 foo + 2
	roo: 3 + 2 foo
	noo: 3 hoo + 2 joo'
		equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseKeywordExpression
	| node {Statement | Nil} |
	node := (Parser source: ' 3 foo: 7 bar: 4 ') parseExpression.
	self assert: KeywordMessageNode equals: node class.
	self assert: '3 foo: 7 bar: 4' equals: node prettySourceString
!
(reader addMethod: 'tests methods')
!
testParseKeywordMethod1
	| node {KeywordMethodNode | Nil} |
	node := Parser parseMethod: 'foo: arg1 ^bar'.
	self assert: node class = KeywordMethodNode.
	self assert: 'foo: arg1
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests methods')
!
testParseKeywordMethod2
	| node {KeywordMethodNode | Nil} |
	node := Parser parseMethod: 'foo: arg1 bar: arg2 ^bar'.
	self assert: node class = KeywordMethodNode.
	self assert: 'foo: arg1 bar: arg2
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseLiteralArray
	| node {ArrayLiteralNode} |
	node := (Parser source: '#(#foo foo ''foo'' 1 (a b c) #( a b c) ((x)) () #[1 2 3])')
				parseExpression.
	self assert: node class = ArrayLiteralNode.
	self assert: '#(#foo #foo ''foo'' 1 #(#a #b #c) #(#a #b #c) #(#(#x)) #() #[1 2 3])'
		equals: node prettySourceString.
	self assert: node value size = 9
!
(reader addMethod: 'test types')
!
testParseMethodWithArgAndReturnType
	| node {BinaryMethodNode} |
	node := Parser parseMethod: '+ arg {String} {^String}^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg {String} {^String}
	^bar' equals: node prettySourceString.
	self assert: node argument type notNil.
	self assert: node returnType notNil
!
(reader addMethod: 'test types')
!
testParseMethodWithArgType
	| node {BinaryMethodNode} |
	node := Parser parseMethod: '+ arg {String} ^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg {String}
	^bar' equals: node prettySourceString.
	self assert: node argument type notNil.
	self assert: node returnType isNil
!
(reader addMethod: 'test types')
!
testParseMethodWithReturnType
	| node {BinaryMethodNode} |
	node := Parser parseMethod: '+ arg {^String} ^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg {^String}
	^bar' equals: node prettySourceString
!
(reader addMethod: 'test types')
!
testParseMethodWithReturnTypeWithSpace
	| node {BinaryMethodNode} |
	node := Parser parseMethod: '+ arg {^ String} ^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg {^String}
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseNamespacedVariable
	| node {NamespacedVariableNode | Nil} |
	node := (Parser source: ' foo.bar.baz ') parseExpression.
	self assert: NamespacedVariableNode equals: node class.
	self assert: 'foo.bar.baz' equals: node prettySourceString.
	self assert: #('foo' 'bar' 'baz') equals: node path
!
(reader addMethod: 'tests')
!
testParseNegativeInteger
	| node {IntegerLiteralNode | Nil} |
	node := (Parser source: '-123') parseExpression.
	self assert: IntegerLiteralNode equals: node class.
	self assert: -123 equals: node value
!
(reader addMethod: 'tests')
!
testParseNestedExpression
	| node {Statement | Nil} |
	node := (Parser source: ' 3 + (4 + 5) ') parseExpression.
	self assert: node class = BinaryMessageNode.
	self assert: '3 + (4 + 5)' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParseNilaryBlockNoTemps
	| node {Statement | Nil} |
	node := (Parser source: '[1 foo. 2 bar]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[
1 foo.
2 bar]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParseNilaryBlockWithTemps
	| node {Statement | Nil} |
	node := (Parser source: '[| a b | a foo. b bar]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[
| a b |
a foo.
b bar]' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseNilInArray1
	| node {ArrayLiteralNode | Nil} |
	node := (Parser source: '#(nil)') parseExpression.
	self assert: ArrayLiteralNode equals: node class.
	self assert: nil equals: node value first
!
(reader addMethod: 'test types')
!
testParseOrType
	| node {BinaryMethodNode} |
	node := Parser parseMethod: '+ arg {String | Nil} ^bar'.
	self assert: node class = BinaryMethodNode.
	self assert: '+ arg {String | Nil}
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseReturn
	| node {Statement | Nil} |
	node := (Parser source: '[:a | ^a]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '[:a | ^a]' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseString1
	| node {StringLiteralNode | Nil} |
	node := (Parser source: '''fromage''') parseExpression.
	self assert: node class = StringLiteralNode.
	self assert: node value = 'fromage'
!
(reader addMethod: 'tests')
!
testParseString2
	| node {StringLiteralNode | Nil} |
	node := (Parser source: '''from''''age''') parseExpression.
	self assert: node class = StringLiteralNode.
	self assert: node value = 'from''age'
!
(reader addMethod: 'tests')
!
testParseSymbol1
	| node {SymbolLiteralNode | Nil} |
	node := (Parser source: '#''from''''age''') parseExpression.
	self assert: node class = SymbolLiteralNode.
	self assert: node value = #'from''age'
!
(reader addMethod: 'tests')
!
testParseSymbol2
	| node {SymbolLiteralNode | Nil} |
	node := (Parser source: '#foo') parseExpression.
	self assert: node class = SymbolLiteralNode.
	self assert: node value = #foo
!
(reader addMethod: 'tests blocks')
!
testParseUnaryBlockNoTemps
	| node {Statement | Nil} |
	node := (Parser source: '[:a | a foo. 2 bar]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[:a | 
a foo.
2 bar]' equals: node prettySourceString
!
(reader addMethod: 'tests blocks')
!
testParseUnaryBlockWithTemps
	| node {Statement | Nil} |
	node := (Parser source: '[:a | | b | a foo. b bar]') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[:a | 
| b |
a foo.
b bar]' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseUnaryExpression
	| node {UnaryMessageNode | Nil} |
	node := (Parser source: ' 3 foo ') parseExpression.
	self assert: node class = UnaryMessageNode.
	self assert: '3 foo' equals: node prettySourceString
!
(reader addMethod: 'tests methods')
!
testParseUnaryMethod
	| node {UnaryMethodNode | Nil} |
	node := Parser parseMethod: 'foo self baz. ^bar'.
	self assert: node class = UnaryMethodNode.
	self assert: 'foo
	self baz.
	^bar' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseVariable
	| node {VariableNode | Nil} |
	node := (Parser source: ' foo ') parseExpression.
	self assert: node class = VariableNode.
	self assert: 'foo' equals: node prettySourceString
!
(reader addMethod: 'tests')
!
testParseVariableDot
	| node {BlockNode | Nil} |
	node := (Parser source: ' [foo. bar] ') parseExpression.
	self assert: node class = BlockNode.
	self assert: '
[
foo.
bar]' equals: node prettySourceString
!
