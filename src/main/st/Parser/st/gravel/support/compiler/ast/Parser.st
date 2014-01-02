(reader defineClass: 'Parser' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'stream')
!
(reader addInstVar: 'sourceFile')
!
(reader addMethod: 'As yet unclassified')
!
atEnd {^Bool}
	^stream atEnd
!
(reader addMethod: 'As yet unclassified')
!
eatComment {^Int}
	| i {Int} |
	i := 1.
	stream next.
	[stream atEnd] whileFalse: 
			[| ch {Char} |
			i := i + 1.
			ch := stream next.
			ch = $" ifTrue: [(stream peekFor: $") ifTrue: [i := i + 1] ifFalse: [^i]]].
	ParseError raise
!
(reader addMethod: 'As yet unclassified')
!
eatWhitespace {^Int}
	| i {Int} |
	i := 0.
	[stream atEnd not and: [stream peek isWhitespace]] whileTrue: 
			[stream next.
			i := i + 1].
	(stream atEnd not and: [stream peek = $"])
		ifTrue: 
			[i := i + self eatComment.
			i := i + self eatWhitespace].
	^i
!
(reader addMethod: 'initialize-release')
!
initializeStream: aReadStream {RStream[Char]} sourceFile: aSourceFile {SourceFile | Nil} {^Self}
	sourceFile := aSourceFile.
	stream := aReadStream.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isBinarySelectorChar: ch {Char | Nil} {^Bool}
	ch isNil ifTrue: [^false].
	^#($~ $@ $% $& $* $- $+ $= $| $\ $< $> $, $? $/) includes: ch
!
(reader addMethod: 'As yet unclassified')
!
isLetter: ch {Character} {^Bool}
	^(ch between: $A and: $Z) or: [ch between: $a and: $z]
!
(reader addMethod: 'As yet unclassified')
!
isUnderscore: ch {Character} {^Bool}
	^ch = $_
!
(reader addMethod: 'As yet unclassified')
!
parseArray {^ArrayLiteralNode}
	| elements {Arr[LiteralNode]} ch {Character} |
	stream next.
	elements := #().
	self eatWhitespace.
	[stream peekFor: $)] whileFalse: 
			[ch := stream peek.
			ch = $#
				ifTrue: [elements := elements copyWith: self parseHashedLiteral]
				ifFalse: 
					[ch = $(
						ifTrue: [elements := elements copyWith: self parseArray]
						ifFalse: 
							[ch = $'
								ifTrue: [elements := elements copyWith: self parseString]
								ifFalse: 
									[ch = $$
										ifTrue: [elements := elements copyWith: self parseCharacter]
										ifFalse: 
											[ch = $-
												ifTrue: [elements := elements copyWith: self parseNegativeNumber]
												ifFalse: 
													[(ch between: $0 and: $9)
														ifTrue: [elements := elements copyWith: self parseNumber]
														ifFalse: [elements := elements copyWith: self parseSymbolNoHash]]]]]].
			self eatWhitespace].
	^ArrayLiteralNode elements: elements
!
(reader addMethod: 'As yet unclassified')
!
parseAssignment: aNode {Expression} {^AssignmentNode}
	| value {Expression} |
	self assert: aNode isAssignable.
	value := self parseAssignmentOrExpression.
	^AssignmentNode variable: aNode value: value
!
(reader addMethod: 'As yet unclassified')
!
parseAssignmentOrExpression {^Expression}
	| rec {Expression} start {Int} |
	start := stream position.
	rec := self parseExpression.
	self eatWhitespace.
	(stream peekFor: $:)
		ifTrue: 
			[self assert: (stream peekFor: $=).
			^self setSourcePosition: start node: (self parseAssignment: rec)].
	^self setSourcePosition: start node: rec
!
(reader addMethod: 'As yet unclassified')
!
parseBang {^Self}
	self eatWhitespace.
	self assert: stream next = $!.
	self eatWhitespace
!
(reader addMethod: 'As yet unclassified')
!
parseBinaryMessageChain: aString {Str} receiver: rec {Expression} {^Expression}
	| arg {Expression} receiver {BinaryMessageNode} |
	self eatWhitespace.
	arg := self parseUnaryMessage.
	self eatWhitespace.
	receiver := BinaryMessageNode receiver: rec selector: aString argument: arg.
	^self parseBinaryOrUnaryMessage: receiver
!
(reader addMethod: 'As yet unclassified')
!
parseBinaryMessageSelector {^String | Nil}
	| ch {Character | Nil} str {WriteStream[Character]} |
	ch := stream peek.
	(self isBinarySelectorChar: ch) ifFalse: [^nil].
	str := WriteStream on: String new.
	
	[str nextPut: stream next.
	ch := stream peek.
	self isBinarySelectorChar: ch] whileTrue.
	^str contents
!
(reader addMethod: 'parsing methods')
!
parseBinaryMethod: aString {Str} {^BinaryMethodNode}
	| argument {VariableDeclarationNode} body {SequenceNode} returnType {TypeNode} pragmas {Array[PragmaNode]} |
	self eatWhitespace.
	argument := self parseVariableDeclaration.
	returnType := self parseReturnType.
	pragmas := self readPragmas.
	body := self
				parseSequenceNode: [:extraPragmas {Arr[PragmaNode]} | pragmas := pragmas copyWithAll: extraPragmas].
	^BinaryMethodNode
		selector: aString
		argument: argument
		body: body
		returnType: returnType
		pragmas: pragmas
		protocol: nil
!
(reader addMethod: 'As yet unclassified')
!
parseBinaryOrUnaryMessage {^Expression}
	| receiver {Expression | Nil} |
	receiver := self parseOperand.
	^self parseBinaryOrUnaryMessage: receiver
!
(reader addMethod: 'As yet unclassified')
!
parseBinaryOrUnaryMessage: receiver {Expression} {^Expression}
	| res {Str | Nil} |
	self eatWhitespace.
	res := self parseIdentifier.
	res isNil
		ifFalse: 
			[(stream peekFor: $:)
				ifTrue: 
					[stream skip: -1 - res size.
					^receiver]
				ifFalse: 
					[^self parseBinaryOrUnaryMessage: (UnaryMessageNode receiver: receiver selector: res)]].
	res := self parseBinaryMessageSelector.
	res isNil ifFalse: [^self parseBinaryMessageChain: res receiver: receiver].
	^receiver
!
(reader addMethod: 'As yet unclassified')
!
parseBlock {^BlockNode}
	| arguments {Array[VariableDeclarationNode]} bn {BlockNode} returnType {TypeNode} start {Int} |
	start := stream position.
	stream next.
	self eatWhitespace.
	arguments := #().
	(stream peekFor: $:)
		ifTrue: 
			[
			[self eatWhitespace.
			arguments := arguments copyWith: self parseVariableDeclaration.
			self eatWhitespace.
			stream peekFor: $:]
					whileTrue.
			returnType := self parseReturnType.
			self eatWhitespace.
			(stream peekFor: $])
				ifTrue: 
					[^BlockNode
						arguments: arguments
						body: SequenceNode empty
						returnType: returnType].
			self assert: (stream peekFor: $|)]
		ifFalse: 
			[returnType := self parseReturnType.
			returnType isNil
				ifFalse: 
					[self eatWhitespace.
					self assert: (stream peekFor: $|)]].
	bn := BlockNode
				arguments: arguments
				body: (self
						parseSequenceNode: [:extraPragmas {Arr[PragmaNode]} | self error: 'Extra pragmas not allowed'])
				returnType: returnType.
	self assert: (stream peekFor: $]).
	^self setSourcePosition: start node: bn
!
(reader addMethod: 'As yet unclassified')
!
parseByteArray {^ByteArrayLiteralNode}
	| bytes {ByteArray} |
	stream next.
	self eatWhitespace.
	bytes := #[].
	[stream peekFor: $]] whileFalse: 
			[bytes := bytes copyWith: self readInteger asSmallInteger.
			self eatWhitespace].
	^ByteArrayLiteralNode value: bytes
!
(reader addMethod: 'As yet unclassified')
!
parseCharacter {^CharacterLiteralNode}
	stream next.
	^CharacterLiteralNode value: stream next
!
(reader addMethod: 'As yet unclassified')
!
parseExpression {^Expression}
	| receiver {Expression} start {Int} |
	start := stream position.
	self eatWhitespace.
	receiver := self parseOperand.
	^self setSourcePosition: start
		node: (self parseMessageChain: (self setSourcePosition: start node: receiver))
!
(reader addMethod: 'As yet unclassified')
!
parseHashedLiteral {^LiteralNode}
	| ch {Character} |
	stream next.
	ch := stream peek.
	(self isLetter: ch) ifTrue: [^self parseSymbolNoHash: self parseIdentifier].
	^self parseHashedLiteralNoHash
!
(reader addMethod: 'As yet unclassified')
!
parseHashedLiteralNoHash {^LiteralNode}
	| ch {Character | Nil} |
	ch := stream peek.
	ch = $( ifTrue: [^self parseArray].
	ch = $' ifTrue: [^SymbolLiteralNode value: self readString asSymbol].
	ch = $[ ifTrue: [^self parseByteArray].
	ch = ${ ifTrue: [^self parseReference].
	(self isBinarySelectorChar: ch)
		ifTrue: [^SymbolLiteralNode value: self parseBinaryMessageSelector asSymbol].
	^self parseSymbolNoHash
!
(reader addMethod: 'As yet unclassified')
!
parseIdentifier {^String | Nil}
	| ch {Character | Nil} wStr {WriteStream[Character]} |
	ch := self peekLetter ifNil: [self peekUnderscore].
	ch isNil ifTrue: [^nil].
	wStr := WriteStream on: String new.
	wStr nextPut: ch.
	ch := self peekLetterDigitOrUnderscore.
	[ch isNil] whileFalse: 
			[wStr nextPut: ch.
			ch := self peekLetterDigitOrUnderscore].
	^wStr contents
!
(reader addMethod: 'As yet unclassified')
!
parseKeywordIdentifier {^String | Nil}
	| res {String | Nil} |
	res := self parseIdentifier.
	res isNil ifTrue: [^nil].
	(stream peekFor: $:)
		ifFalse: 
			[stream skip: 0 - res size.
			^nil].
	(stream peekFor: $=)
		ifTrue: 
			[stream skip: -2 - res size.
			^nil].
	^res copyWith: $:
!
(reader addMethod: 'As yet unclassified')
!
parseKeywordMessageChain: aString {Str} receiver: receiver {Expression} {^Expression}
	| res {Str | Nil} str {WStream[Char]} arguments {OrdColl[Expression]} |
	str := WriteStream on: String new.
	str
		nextPutAll: aString;
		nextPut: $:.
	arguments := OrderedCollection new.
	self eatWhitespace.
	arguments add: self parseBinaryOrUnaryMessage.
	self eatWhitespace.
	res := self parseIdentifier.
	[res isNil] whileFalse: 
			[self assert: (stream peekFor: $:).
			str
				nextPutAll: res;
				nextPut: $:.
			self eatWhitespace.
			arguments add: self parseBinaryOrUnaryMessage.
			self eatWhitespace.
			res := self parseIdentifier].
	^KeywordMessageNode
		receiver: receiver
		selector: str contents
		arguments: arguments asArray
!
(reader addMethod: 'parsing methods')
!
parseKeywordMethod: aString {String} {^KeywordMethodNode}
	| res {String | Nil} str {WriteStream[Character]} arguments {SeqColl[VariableDeclarationNode]} body {SequenceNode} returnType {TypeNode} pragmas {Array[PragmaNode]} |
	str := WriteStream on: String new.
	str
		nextPutAll: aString;
		nextPut: $:.
	arguments := OrderedCollection new.
	self eatWhitespace.
	arguments add: self parseVariableDeclaration.
	self eatWhitespace.
	res := self parseKeywordIdentifier.
	[res isNil] whileFalse: 
			[str nextPutAll: res.
			self eatWhitespace.
			arguments add: self parseVariableDeclaration.
			self eatWhitespace.
			res := self parseKeywordIdentifier].
	returnType := self parseReturnType.
	pragmas := self readPragmas.
	body := self
				parseSequenceNode: [:extraPragmas {Arr[PragmaNode]} | pragmas := pragmas copyWithAll: extraPragmas].
	^KeywordMethodNode
		selector: str contents asString
		arguments: arguments asArray
		body: body
		returnType: returnType
		pragmas: pragmas
		protocol: nil
!
(reader addMethod: 'As yet unclassified')
!
parseMessageChain: receiver {Expression} {^Expression}
	| exp {Expression} messages {OrdColl[MessageNode]} |
	exp := self parseNoCascadeMessageChain: receiver.
	self eatWhitespace.
	(stream peekFor: $;)
		ifTrue: 
			[| baseMsg {MessageNode} |
			messages := OrderedCollection new.
			baseMsg := exp.
			messages add: baseMsg.
			
			[| msg {MessageNode} |
			msg := self parseNoCascadeMessageChain: baseMsg receiver.
			messages add: msg.
			stream peekFor: $;]
					whileTrue.
			^CascadeNode messages: messages asArray].
	^exp
!
(reader addMethod: 'parsing methods')
!
parseMethod {^MethodNode | Nil}
	| res {Str | Nil} start {Int} |
	start := stream position.
	self eatWhitespace.
	res := self parseIdentifier.
	res isNil
		ifFalse: 
			[^self setSourcePosition: start
				node: ((stream peekFor: $:)
						ifTrue: [self parseKeywordMethod: res]
						ifFalse: [self parseUnaryMethod: res])].
	res := self parseBinaryMessageSelector.
	res isNil ifFalse: [^self setSourcePosition: start node: (self parseBinaryMethod: res)].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
parseNegativeNumber {^NumberLiteralNode | Nil}
	stream next.
	stream peek isDigit
		ifFalse: 
			[stream skip: -1.
			^nil].
	^self parseNumber negated
!
(reader addMethod: 'As yet unclassified')
!
parseNestedExpression {^Expression}
	| exp {Expression} start {Int} typeCast {TypeNode | Nil} |
	start := stream position.
	stream next.
	self eatWhitespace.
	typeCast := (stream peekFor: ${) ifTrue: [self parseTypeExpressionAndClose] ifFalse: [nil].
	exp := self parseAssignmentOrExpression.
	typeCast isNil ifFalse: [exp := TypeCast type: typeCast expression: exp].
	self eatWhitespace.
	self assert: (stream peekFor: $)).
	^self setSourcePosition: start node: exp
!
(reader addMethod: 'As yet unclassified')
!
parseNoCascadeMessageChain: receiver {Expression} {^Expression}
	| res {Str | Nil} |
	self eatWhitespace.
	res := self parseIdentifier.
	res isNil
		ifFalse: 
			[^(stream peekFor: $:)
				ifTrue: [self parseKeywordMessageChain: res receiver: receiver]
				ifFalse: 
					[self parseNoCascadeMessageChain: (UnaryMessageNode receiver: receiver selector: res)]].
	res := self parseBinaryMessageSelector.
	res isNil
		ifFalse: 
			[^self parseNoCascadeMessageChain: (self parseBinaryMessageChain: res receiver: receiver)].
	^receiver
!
(reader addMethod: 'As yet unclassified')
!
parseNumber {^NumberLiteralNode}
	| value {LargeInteger} fractionString {Str | Nil} |
	value := self readInteger: 10.
	(stream peekFor: $r)
		ifTrue: [^IntegerLiteralNode integer: (self readInteger: value asSmallInteger)].
	fractionString := nil.
	(stream peekFor: $.)
		ifTrue: 
			[fractionString := self readDigits.
			fractionString isEmpty
				ifTrue: 
					[stream skip: -1.
					^IntegerLiteralNode integer: value]].
	(stream peekFor: $e)
		ifTrue: 
			[| exSign {Int} exponent {LargeInteger} |
			exSign := (stream peekFor: $-) ifTrue: [-1] ifFalse: [1].
			exponent := (self readInteger: 10) * exSign.
			^FloatLiteralNode integer: value fractionString: fractionString exponent: exponent]
		ifFalse: 
			[(stream peekFor: $s)
				ifTrue: 
					[| scale {Int} |
					scale := (self readInteger: 10) asSmallInteger.
					fractionString isNil ifTrue: [fractionString := ''].
					scale := scale max: fractionString size.
					^FixedPointLiteralNode integer: value fractionString: fractionString scale: scale]].
	^fractionString isNil
		ifTrue: [IntegerLiteralNode integer: value]
		ifFalse: [FloatLiteralNode integer: value fractionString: fractionString exponent: nil]
!
(reader addMethod: 'As yet unclassified')
!
parseOperand {^Expression | Nil}
	| ch {Character | Nil} |
	ch := stream peek.
	ch isDigit ifTrue: [^self parseNumber].
	ch = $- ifTrue: [^self parseNegativeNumber].
	ch = $$ ifTrue: [^self parseCharacter].
	ch = $' ifTrue: [^self parseString].
	ch = $# ifTrue: [^self parseHashedLiteral].
	ch = $[ ifTrue: [^self parseBlock].
	ch = $( ifTrue: [^self parseNestedExpression].
	^self parseVariable
!
(reader addMethod: 'As yet unclassified')
!
parseReference {^ReferenceLiteralNode}
	| elements {Arr[Str]} |
	stream next.
	elements := #().
	[stream peekFor: $}] whileFalse: 
			[elements := elements copyWith: self parseIdentifier.
			stream peekFor: $.].
	^ReferenceLiteralNode path: elements
!
(reader addMethod: 'As yet unclassified')
!
parseReturnType {^TypeNode | Nil}
	self eatWhitespace.
	(stream peekFor: ${)
		ifTrue: 
			[self eatWhitespace.
			self assert: (stream peekFor: $^).
			^self parseTypeExpressionAndClose].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
parseSequence {^SequenceNode}
	^self parseSequenceNode: [:pragmas {Arr[PragmaNode]} | ]
!
(reader addMethod: 'As yet unclassified')
!
parseSequenceNode: extraPragmaBlock {[Arr[PragmaNode], ^Object]} {^SequenceNode}
	| temporaries {Array[VariableDeclarationNode]} statements {Array[Statement]} statement {Statement | Nil} start {Int} pragmas {Arr[PragmaNode]} |
	start := stream position.
	self eatWhitespace.
	temporaries := #().
	(stream peekFor: $|)
		ifTrue: 
			[self eatWhitespace.
			[stream peekFor: $|] whileFalse: 
					[self eatWhitespace.
					temporaries := temporaries copyWith: self parseVariableDeclaration.
					self eatWhitespace]].
	pragmas := self readPragmas.
	pragmas isEmpty ifFalse: [extraPragmaBlock value: pragmas].
	statements := #().
	statement := self parseStatement.
	self eatWhitespace.
	[statement isNil] whileFalse: 
			[statements := statements copyWith: statement.
			stream peekFor: $..
			statement := self parseStatement.
			self eatWhitespace].
	^self setSourcePosition: start
		node: (SequenceNode temporaries: temporaries statements: statements)
!
(reader addMethod: 'As yet unclassified')
!
parseStatement {^Statement | Nil}
	| start {Int} |
	start := stream position.
	self eatWhitespace.
	stream atEnd ifTrue: [^nil].
	(stream peekFor: $^)
		ifTrue: 
			[^self setSourcePosition: start node: (ReturnNode value: self parseAssignmentOrExpression)].
	^self setSourcePosition: start node: self parseAssignmentOrExpression
!
(reader addMethod: 'As yet unclassified')
!
parseString {^StringLiteralNode}
	^StringLiteralNode value: self readString
!
(reader addMethod: 'As yet unclassified')
!
parseSymbolNoHash {^LiteralNode}
	| id {Str} |
	id := self parseIdentifier.
	id = 'nil' ifTrue: [^NilLiteralNode new].
	id = 'true' ifTrue: [^BooleanLiteralNode value: true].
	id = 'false' ifTrue: [^BooleanLiteralNode value: false].
	id isNil
		ifTrue: 
			[| bin {Str | Nil} |
			bin := self parseBinaryMessageSelector.
			self assert: bin notNil.
			^SymbolLiteralNode value: bin asSymbol].
	^self parseSymbolNoHash: id
!
(reader addMethod: 'As yet unclassified')
!
parseSymbolNoHash: start {Str} {^SymbolLiteralNode}
	| id {Str} t {Str} |
	id := start.
	(stream peekFor: $:)
		ifTrue: 
			[id := id copyWith: $:.
			
			[t := self parseKeywordIdentifier.
			t notNil ifTrue: [id := id , t].
			t notNil]
					whileTrue].
	^SymbolLiteralNode value: id asSymbol
!
(reader addMethod: 'As yet unclassified')
!
parseTypeExpressionAndClose {^TypeNode}
	| exp {TypeNode} |
	exp := self parseTypeNode.
	self assert: (stream peekFor: $}).
	^exp
!
(reader addMethod: 'As yet unclassified')
!
parseTypeExpressionBlockAndClose {^BlockTypeNode}
	| args {Array[TypeNode]} returnType {TypeNode | Nil} |
	args := #().
	returnType := nil.
	
	[self eatWhitespace.
	(stream peekFor: $^)
		ifTrue: [returnType := self parseTypeNode]
		ifFalse: [args := args copyWith: self parseTypeNode].
	self eatWhitespace.
	stream peekFor: $,]
			whileTrue.
	self assert: (stream peekFor: $]).
	^BlockTypeNode arguments: args returnType: returnType
!
(reader addMethod: 'As yet unclassified')
!
parseTypeExpressionListAndClose {^Arr[TypeNode]}
	| block {BlockTypeNode} |
	block := self parseTypeExpressionBlockAndClose.
	self assert: block returnType isNil.
	^block arguments
!
(reader addMethod: 'As yet unclassified')
!
parseTypeNode {^TypeNode}
	| exp {TypeNode} |
	exp := self parseTypeOperand.
	self eatWhitespace.
	[stream peekFor: $|] whileTrue: 
			[exp := exp | self parseTypeOperand.
			self eatWhitespace].
	^exp
!
(reader addMethod: 'As yet unclassified')
!
parseTypeOperand {^TypeNode}
	| id {Str | Nil} base {TypeNode} args {Arr[TypeNode]} exp {TypeNode} |
	self eatWhitespace.
	id := self parseIdentifier.
	id isNil
		ifFalse: 
			[(stream peekFor: $.)
				ifTrue: 
					[| arr {Arr[Str | Nil]} |
					arr := Array with: id with: self parseIdentifier.
					[stream peekFor: $.] whileTrue: [arr := arr copyWith: self parseIdentifier].
					base := NamespacedTypeVariableNode path: arr]
				ifFalse: 
					[id = 'Self'
						ifTrue: [base := SelfTypeNode new]
						ifFalse: 
							[id = 'Instance'
								ifTrue: [base := InstanceTypeNode new]
								ifFalse: [base := TypeVariableNode name: id]]].
			self eatWhitespace.
			(stream peekFor: $[)
				ifTrue: 
					[args := self parseTypeExpressionListAndClose.
					exp := GenericTypeVariableNode root: base arguments: args]
				ifFalse: [exp := base].
			self eatWhitespace.
			stream peek = $d
				ifTrue: 
					[| defString {Str} |
					defString := stream next: 3.
					self assert: defString = 'def'.
					^exp asDefNode]
				ifFalse: [^exp]].
	(stream peekFor: $[) ifTrue: [^self parseTypeExpressionBlockAndClose].
	ParseError raise
!
(reader addMethod: 'As yet unclassified')
!
parseUnaryMessage {^Expression}
	| receiver {Expression} |
	receiver := self parseOperand.
	^self parseUnaryMessage: receiver
!
(reader addMethod: 'As yet unclassified')
!
parseUnaryMessage: receiver {Expression} {^Expression}
	| res {Str | Nil} |
	self eatWhitespace.
	res := self parseIdentifier.
	res isNil
		ifFalse: 
			[(stream peekFor: $:)
				ifTrue: 
					[stream skip: -1 - res size.
					^receiver]
				ifFalse: [^self parseUnaryMessage: (UnaryMessageNode receiver: receiver selector: res)]].
	^receiver
!
(reader addMethod: 'parsing methods')
!
parseUnaryMethod: aString {Str} {^MethodNode}
	| body {SequenceNode} returnType {TypeNode | Nil} pragmas {Array[PragmaNode]} |
	returnType := self parseReturnType.
	pragmas := self readPragmas.
	body := self
				parseSequenceNode: [:extraPragmas {Arr[PragmaNode]} | pragmas := pragmas copyWithAll: extraPragmas].
	^UnaryMethodNode
		selector: aString
		body: body
		returnType: returnType
		pragmas: pragmas
		protocol: nil
!
(reader addMethod: 'As yet unclassified')
!
parseVariable {^Expression | Nil}
	| name {Str | Nil} |
	name := self parseIdentifier.
	name isNil ifTrue: [^nil].
	name = 'nil' ifTrue: [^NilLiteralNode new].
	name = 'true' ifTrue: [^BooleanLiteralNode value: true].
	name = 'false' ifTrue: [^BooleanLiteralNode value: false].
	(stream peekFor: $.)
		ifTrue: 
			[| path {Array[String]} |
			(stream atEnd not and: 
					[| ch {Character | Nil} |
					ch := stream peek.
					(self isLetter: ch) or: [self isUnderscore: ch]])
				ifTrue: 
					[path := Array with: name.
					
					[| identifier {Str | Nil} |
					identifier := self parseIdentifier.
					identifier isNil ifFalse: [path := path copyWith: identifier].
					stream peekFor: $.]
							whileTrue.
					^NamespacedVariableNode path: path]
				ifFalse: [stream skip: -1]].
	^VariableNode name: name
!
(reader addMethod: 'As yet unclassified')
!
parseVariableDeclaration {^VariableDeclarationNode}
	| varName {Str} type {TypeNode} wsWidth {Int} start {Int} |
	start := stream position.
	varName := self parseIdentifier.
	self eatWhitespace.
	type := nil.
	stream peek = ${
		ifTrue: 
			[stream next.
			wsWidth := self eatWhitespace.
			stream peek = $^
				ifTrue: [stream skip: -1 - wsWidth]
				ifFalse: [type := self parseTypeExpressionAndClose]].
	^self setSourcePosition: start node: (VariableDeclarationNode name: varName type: type)
!
(reader addMethod: 'As yet unclassified')
!
peekDigit {^Char | Nil}
	| ch {Char | Nil} |
	ch := stream peek.
	ch isNil ifTrue: [^nil].
	(ch between: $0 and: $9) ifTrue: [^stream next].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
peekLetter {^Char | Nil}
	| ch {Char | Nil} |
	ch := stream peek.
	ch isNil ifTrue: [^nil].
	(self isLetter: ch) ifTrue: [^stream next].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
peekLetterDigitOrUnderscore {^Character | Nil}
	| letter {Char | Nil} |
	letter := self peekLetter.
	letter isNil ifFalse: [^letter].
	^self peekDigit ifNil: [self peekUnderscore]
!
(reader addMethod: 'As yet unclassified')
!
peekUnderscore {^Char | Nil}
	| ch {Char | Nil} |
	ch := stream peek.
	ch isNil ifTrue: [^nil].
	(self isUnderscore: ch) ifTrue: [^stream next].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
position {^Int}
	^stream position
!
(reader addMethod: 'As yet unclassified')
!
readDigits {^Str}
	| str {WriteStream[Character]} |
	str := WriteStream on: String new.
	
	[stream atEnd not and: 
			[| v {Int} |
			v := stream peek digitValue.
			v >= 0 and: [v <= 10]]]
			whileTrue: [str nextPut: stream next].
	^str contents
!
(reader addMethod: 'As yet unclassified')
!
readInteger {^LargeInteger}
	| value {LargeInteger} |
	value := self readInteger: 10.
	(stream peekFor: $r) ifTrue: [^self readInteger: value asSmallInteger].
	^value
!
(reader addMethod: 'As yet unclassified')
!
readInteger: base {Int} {^LargeInteger}
	| value {LargeInteger} |
	value := 0.
	
	[stream atEnd not and: 
			[| v {Int} |
			v := stream peek digitValue.
			v >= 0 and: [v <= base]]]
			whileTrue: [value := value * base + stream next digitValue].
	^value
!
(reader addMethod: 'parsing methods')
!
readPragma {^PragmaNode}
	| res {Str} |
	self eatWhitespace.
	res := self parseIdentifier.
	self assert: res notNil.
	(stream peekFor: $:)
		ifTrue: 
			[| sel {Str} arguments {Arr[Expression]} |
			sel := res copyWith: $:.
			self eatWhitespace.
			arguments := Array with: self parseOperand.
			self eatWhitespace.
			res := self parseIdentifier.
			[res isNil] whileFalse: 
					[self assert: (stream peekFor: $:).
					sel := sel , res copyWith: $:.
					self eatWhitespace.
					arguments := arguments copyWith: self parseOperand.
					self eatWhitespace.
					res := self parseIdentifier].
			self assert: (stream peekFor: $>).
			^PragmaNode expression: (KeywordMessageNode
						receiver: NilLiteralNode new
						selector: sel
						arguments: arguments)]
		ifFalse: 
			[self eatWhitespace.
			self assert: (stream peekFor: $>).
			^PragmaNode expression: (UnaryMessageNode receiver: NilLiteralNode new selector: res)]
!
(reader addMethod: 'parsing methods')
!
readPragmas {^Arr[PragmaNode]}
	| pragmas {Arr[PragmaNode]} |
	pragmas := #().
	self eatWhitespace.
	[stream peekFor: $<] whileTrue: 
			[pragmas := pragmas copyWith: self readPragma.
			self eatWhitespace].
	^pragmas
!
(reader addMethod: 'As yet unclassified')
!
readString {^Str}
	| str {WriteStream[Character]} |
	str := WriteStream on: String new.
	stream next.
	[stream atEnd] whileFalse: 
			[(stream peekFor: $')
				ifTrue: [(stream peekFor: $') ifTrue: [str nextPut: $'] ifFalse: [^str contents]]
				ifFalse: [str nextPut: stream next]].
	ParseError raise
!
(reader addMethod: 'As yet unclassified')
!
setSourcePosition: start {Int} node: aNode {Node} {^Node}
	| stop {Int} |
	sourceFile isNil ifTrue: [^aNode].
	aNode isNil ifTrue: [^nil].
	stop := stream position.
	^aNode withSourcePosition: (sourceFile from: start to: stop)
!
(reader addMethod: 'accessing')
!
stream {^RStream[Char]}
	^stream
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[ReadStream[Character], SourceFile]}
	^#('stream' 'sourceFile')
!
(reader addClassMethod: 'As yet unclassified')
!
parseExpression: aString {Str} {^Expression | Nil}
	| parser {Parser} res {Expression | Nil} |
	parser := self source: aString.
	res := parser parseExpression.
	self assert: parser atEnd.
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
parseMethod: aString {Str} {^MethodNode | Nil}
	| parser {Parser} res {MethodNode | Nil} |
	parser := self source: aString.
	res := parser parseMethod.
	self assert: parser atEnd.
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
parseMethod: aString {Str} sourceFile: sourceFile {SourceFile | Nil} {^MethodNode | Nil}
	| parser {Parser} res {MethodNode | Nil} |
	parser := self source: aString sourceFile: sourceFile.
	res := parser parseMethod.
	self assert: parser atEnd.
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
parseSequence: aString {Str} {^SequenceNode | Nil}
	| parser {Parser} res {SequenceNode | Nil} |
	parser := self source: aString.
	res := parser parseSequence.
	self assert: parser atEnd.
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
parseTypeNode: aString {Str} {^TypeNode | Nil}
	| parser {Parser} res {TypeNode | Nil} |
	parser := self source: aString.
	res := parser parseTypeNode.
	self assert: parser atEnd.
	^res
!
(reader addClassMethod: 'As yet unclassified')
!
source: aString {Str} {^Parser}
	^self stream: (ReadStream on: aString asString) sourceFile: nil
!
(reader addClassMethod: 'As yet unclassified')
!
source: aString {Str} sourceFile: sourceFile {SourceFile | Nil} {^Parser}
	^self stream: (ReadStream on: aString asString) sourceFile: sourceFile
!
(reader addClassMethod: 'instance creation')
!
stream: aReadStream {RStream[Char]} sourceFile: sourceFile {SourceFile | Nil} {^Parser}
	^self new initializeStream: aReadStream sourceFile: sourceFile
!
