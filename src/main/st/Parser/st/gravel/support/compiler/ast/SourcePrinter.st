(reader defineClass: 'SourcePrinter' superclass: 'st.gravel.support.compiler.ast.NodeVisitor')
!
(reader addInstVar: 'stream' type: 'WriteStream[Character]')
!
(reader addInstVar: 'precedence' type: 'Nil | Integer')
!
(reader addInstVar: 'indentation' type: 'Integer')
!
(reader addInstVar: 'emphasis' type: 'Nil | Symbol')
!
(reader addMethod: 'visiting')
!
crtab: i {Int} {^Self}
	stream cr.
	1 to: i do: [:x {Int} | stream tab]
!
(reader addMethod: 'visiting')
!
emphasis: anEmphasis {Sym | Nil} while: aBlock {[^Object]} {^Self}
	| old {Sym | Nil} |
	old := emphasis.
	emphasis := anEmphasis.
	aBlock value.
	emphasis := old
!
(reader addMethod: 'visiting')
!
indent: aLevel {Int} do: aBlock {[^Object]} {^Self}
	| old {Int} |
	old := indentation.
	indentation := indentation + aLevel.
	aBlock value.
	indentation := old
!
(reader addMethod: 'visiting')
!
indentDo: aBlock {[^Object]} {^Self}
	self indent: 1 do: aBlock
!
(reader addMethod: 'initialize-release')
!
initializeStream: aWriteStream {WStream[Char]} precedence: anUndefinedObject {Int | Nil} indentation: anInteger {Int} emphasis: anUndefinedObject2 {Sym | Nil} {^Self}
	stream := aWriteStream.
	precedence := anUndefinedObject.
	indentation := anInteger.
	emphasis := anUndefinedObject2.
	self initialize
!
(reader addMethod: 'visiting')
!
printArguments: args {Arr[VariableDeclarationNode]} {^Bool}
	args isEmpty ifTrue: [^false].
	args do: 
			[:arg {VariableDeclarationNode} |
			stream nextPut: $:.
			self visit: arg]
		separatedBy: [stream space].
	^true
!
(reader addMethod: 'visiting')
!
printAssignmentNode: aNode {AssignmentNode} {^Self}
	self visit: aNode variable.
	stream nextPutAll: ' := '.
	self indent: 2 do: [self visit: aNode value]
!
(reader addMethod: 'visiting')
!
printBlockBody: aSequenceNode {SequenceNode} {^Self}
	| indent {Bool} |
	indent := false.
	self printComment: aSequenceNode comment.
	aSequenceNode temporaries isEmpty
		ifFalse: 
			[indent ifTrue: [self crtab: indentation].
			self printTemporaries: aSequenceNode temporaries.
			indent := true].
	self printStatements: aSequenceNode statements indent: indent
!
(reader addMethod: 'visiting')
!
printCascadeNode: aCascadeNode {CascadeNode} {^Self}
	self
		visit: aCascadeNode receiver
		precedence: 0
		indentation: indentation.
	1 to: aCascadeNode messages size
		do: 
			[:i {Int} |
			self printMessage: (aCascadeNode messages at: i).
			i < aCascadeNode messages size ifTrue: [stream nextPut: $;]]
!
(reader addMethod: 'visiting')
!
printComment: comment {Arr[Str] | Nil} {^Bool}
	(comment isNil or: [comment isEmpty]) ifTrue: [^false].
	comment do: 
			[:each {Str} |
			self crtab: indentation.
			stream
				nextPut: $";
				nextPutAll: each;
				nextPut: $"].
	^true
!
(reader addMethod: 'visiting')
!
printCommentOf: aNode {Node} {^Self}
	(self printComment: aNode comment) ifTrue: [self crtab: indentation]
!
(reader addMethod: 'visiting')
!
printDeclaredReturnType: aTypeNode {TypeNode} {^Bool}
	aTypeNode isNil ifTrue: [^false].
	stream nextPutAll: ' {^'.
	self visit: aTypeNode.
	stream nextPut: $}.
	^true
!
(reader addMethod: 'visiting')
!
printMessage: message {MessageNode} {^Self}
	| prev {Expression} arg {Expression} indent {Int} thisKey {Str} keywords {Arr[Str]} |
	message arguments size = 0
		ifTrue: 
			[stream
				space;
				nextPutAll: message selector.
			^self].
	keywords := message keywords.
	prev := message receiver.
	1 to: message arguments size
		do: 
			[:part {Int} |
			arg := message arguments at: part.
			thisKey := keywords at: part.
			(prev isBlockNode or: 
					[(prev isMessageNode and: [prev precedence >= 3]) or: 
							[(arg isBlockNode and: [({BlockNode} arg) isComplex and: [thisKey ~= 'do:']]) or: 
									[message arguments size > 2
										or: [#('ifTrue:ifFalse:' 'ifFalse:ifTrue:') includes: message selector]]]])
				ifTrue: 
					[self crtab: indentation + 1.
					indent := 1]
				ifFalse: 
					[stream space.
					indent := 0].
			stream
				nextPutAll: thisKey;
				space.
			self
				visit: arg
				precedence: (message precedence = 2 ifTrue: [1] ifFalse: [message precedence])
				indentation: indentation + indent.
			prev := arg]
!
(reader addMethod: 'visiting')
!
printPragmas: pragmas {Arr[PragmaNode]} {^Self}
	pragmas do: 
			[:each {PragmaNode} |
			self crtab: indentation.
			self visit: each]
!
(reader addMethod: 'visiting')
!
printStatements: stmts {Arr[Statement]} indent: aBoolean {Bool} {^Self}
	| show {Int} thisStatement {Statement} indent {Bool} |
	indent := aBoolean.
	show := stmts size.
	1 to: show
		do: 
			[:i {Int} |
			thisStatement := stmts at: i.
			thisStatement comment size > 0
				ifTrue: 
					[i = 1 ifTrue: [self crtab: indentation].
					stream tab].
			indent ifTrue: [self crtab: indentation].
			self visit: thisStatement.
			i < show ifTrue: [stream nextPut: $.].
			indent := true]
!
(reader addMethod: 'visiting')
!
printTemporaries: aCollection {Arr[VariableDeclarationNode]} {^Self}
	stream nextPutAll: '| '.
	aCollection do: 
			[:temp {VariableDeclarationNode} |
			self visit: temp.
			stream space].
	stream nextPut: $|
!
(reader addMethod: 'visiting')
!
printTypeCastOf: aNode {Node} using: aBlock {[^Object]} {^Self}
	aBlock value
!
(reader addMethod: 'visiting')
!
printTypeNode: aNode {TypeNode} {^Self}
	stream nextPut: ${.
	self visit: aNode.
	stream nextPut: $}
!
(reader addMethod: 'visiting')
!
printValueNode: aNode {Node} using: aBlock {[^Object]} parenthesize: aBool {Bool} {^Self}
	self printCommentOf: aNode.
	self printTypeCastOf: aNode using: [self when: aBool parenthesize: aBlock]
!
(reader addMethod: 'visiting')
!
pvtSetPrecedence: anIntegerOrNil {Int | Nil} indentation: aLevel {Int} emphasis: anObject {Sym | Nil} {^Self}
	precedence := anIntegerOrNil.
	indentation := aLevel.
	emphasis := anObject
!
(reader addMethod: 'visiting')
!
pvtVisit: anObject {Node} {^Self}
	anObject isNil ifTrue: [^self].
	anObject accept: self.
	^self
!
(reader addMethod: 'visiting')
!
visit: aNode {Node} {^Self}
	precedence := nil.
	self pvtVisit: aNode
!
(reader addMethod: 'visiting')
!
visit: aNode {Node} precedence: anIntegerOrNil {Int | Nil} {^Self}
	self visit: aNode precedence: anIntegerOrNil indentation: indentation
!
(reader addMethod: 'visiting')
!
visit: aNode {Node} precedence: anIntegerOrNil {Int | Nil} indentation: aLevel {Int} {^Self}
	self
		visit: aNode
		precedence: anIntegerOrNil
		indentation: aLevel
		emphasis: emphasis
!
(reader addMethod: 'visiting')
!
visit: aNode {Node} precedence: anIntegerOrNil {Int | Nil} indentation: aLevel {Int} emphasis: anObject {Sym | Nil} {^Self}
	(self copy pvtSetPrecedence: anIntegerOrNil indentation: aLevel emphasis: anObject)
		pvtVisit: aNode
!
(reader addMethod: 'visiting')
!
visitArrayLiteralNode: anObject {ArrayLiteralNode} {^Self}
	stream nextPutAll: '#('.
	anObject elements do: [:each {LiteralNode} | self visit: each] separatedBy: [stream space].
	stream nextPut: $)
!
(reader addMethod: 'visiting')
!
visitAssignmentNode: aNode {AssignmentNode} {^Self}
	self
		printValueNode: aNode
		using: [self printAssignmentNode: aNode]
		parenthesize: (precedence notNil and: [precedence < 4])
!
(reader addMethod: 'visiting')
!
visitBlockNode: aNode {BlockNode} {^Self}
	self
		printValueNode: aNode
		using: 
			[| hasArgs {Bool} hasDeclaredReturnType {Bool} |
			aNode isComplex ifTrue: [self crtab: indentation].
			stream nextPut: $[.
			hasArgs := self printArguments: aNode arguments.
			hasDeclaredReturnType := self printDeclaredReturnType: aNode returnType.
			(hasArgs or: [hasDeclaredReturnType])
				ifTrue: 
					[stream
						space;
						nextPutAll: '| '].
			aNode isComplex ifTrue: [self crtab: indentation].
			self visit: aNode body.
			stream nextPut: $]]
		parenthesize: false
!
(reader addMethod: 'visiting typenodes')
!
visitBlockTypeNode: aNode {BlockTypeNode} {^Self}
	stream nextPut: $[.
	aNode arguments
		do: [:each {TypeNode} | each isNil ifTrue: [stream nextPutAll: 'Unknown'] ifFalse: [self visit: each]]
		separatedBy: 
			[stream nextPut: $,.
			stream space].
	aNode returnType notNil
		ifTrue: 
			[aNode arguments notEmpty
				ifTrue: 
					[stream nextPut: $,.
					stream space].
			self visit: aNode returnType].
	stream nextPut: $]
!
(reader addMethod: 'visiting')
!
visitBooleanLiteralNode: anObject {BooleanLiteralNode} {^Self}
	anObject value ifTrue: [stream nextPutAll: 'true'] ifFalse: [stream nextPutAll: 'false']
!
(reader addMethod: 'visiting typenodes')
!
visitBottomTypeNode: anObject {BottomTypeNode} {^Self}
	stream nextPutAll: 'Bottom'
!
(reader addMethod: 'visiting')
!
visitByteArrayLiteralNode: anObject {ByteArrayLiteralNode} {^Self}
	stream nextPutAll: '#['.
	anObject value do: [:each {Int} | stream print: (each bitAnd: 255)]
		separatedBy: [stream space].
	stream nextPut: $]
!
(reader addMethod: 'visiting')
!
visitCascadeNode: aNode {CascadeNode} {^Self}
	| parenthesize {Bool} |
	parenthesize := precedence notNil and: [precedence < 4].
	parenthesize ifTrue: [stream nextPut: $(].
	self printCascadeNode: aNode.
	parenthesize ifTrue: [stream nextPut: $)]
!
(reader addMethod: 'visiting')
!
visitCharacterLiteralNode: aNode {CharacterLiteralNode} {^Self}
	stream
		nextPut: $$;
		nextPut: aNode value
!
(reader addMethod: 'visiting typenodes')
!
visitClassTypeNode: anObject {ClassTypeNode} {^Self}
	self visit: anObject node.
	stream nextPutAll: ' class'
!
(reader addMethod: 'visiting')
!
visitDoubleLiteralNode: anObject {DoubleLiteralNode} {^Self}
	stream nextPutAll: anObject valueString
!
(reader addMethod: 'visiting')
!
visitFixedPointLiteralNode: anObject {FixedPointLiteralNode} {^Self}
	stream nextPutAll: anObject valueString
!
(reader addMethod: 'visiting')
!
visitFloatLiteralNode: anObject {FloatLiteralNode} {^Self}
	stream nextPutAll: anObject valueString
!
(reader addMethod: 'visiting typenodes')
!
visitGenericTypeVariableNode: aNode {GenericTypeVariableNode} {^Self}
	self visit: aNode root.
	stream nextPut: $[.
	aNode arguments do: [:each {TypeNode} | self visit: each]
		separatedBy: 
			[stream nextPut: $,.
			stream space].
	stream nextPut: $]
!
(reader addMethod: 'visiting typenodes')
!
visitInstanceTypeNode: anObject {InstanceTypeNode} {^Self}
	stream nextPutAll: 'Instance'
!
(reader addMethod: 'visiting')
!
visitIntegerLiteralNode: anObject {IntegerLiteralNode} {^Self}
	stream print: anObject integer
!
(reader addMethod: 'visiting')
!
visitIntermediateNode: anObject {IntermediateNode} {^Self}
	self visit: anObject unoptimized
!
(reader addMethod: 'visiting')
!
visitIntermediateStatement: anObject {IntermediateStatement} {^Self}
	self visit: anObject unoptimized
!
(reader addMethod: 'visiting')
!
visitMessageNode: aNode {MessageNode} {^Self}
	| parenthesize {Bool} |
	parenthesize := precedence notNil and: 
					[aNode precedence > precedence or: [precedence = 3 and: [aNode precedence = precedence]]].
	self
		printValueNode: aNode
		using: 
			[self visit: aNode receiver precedence: aNode precedence.
			self printMessage: aNode]
		parenthesize: parenthesize
!
(reader addMethod: 'visiting')
!
visitMethodNode: aNode {MethodNode} {^Self}
	self emphasis: #bold
		while: 
			[aNode precedence = 1
				ifTrue: [stream nextPutAll: aNode selector]
				ifFalse: 
					[aNode keywords
						with: aNode arguments
						do: 
							[:s {Str} :arg {VariableDeclarationNode} |
							stream
								nextPutAll: s;
								space.
							self visit: arg]
						separatedBy: [stream space]]].
	self printDeclaredReturnType: aNode returnType.
	self indentDo: [self printComment: aNode comment].
	self indentDo: [self printPragmas: aNode pragmas].
	aNode body isEmpty ifTrue: [^self].
	self indentDo: 
			[self crtab: indentation.
			self printBlockBody: aNode body]
!
(reader addMethod: 'visiting typenodes')
!
visitNamespacedTypeVariableNode: anObject {NamespacedTypeVariableNode} {^Self}
	anObject path do: [:each {Str} | stream nextPutAll: each]
		separatedBy: [stream nextPut: $.]
!
(reader addMethod: 'visiting')
!
visitNamespacedVariableNode: anObject {NamespacedVariableNode} {^Self}
	anObject path do: [:each {Str} | stream nextPutAll: each]
		separatedBy: [stream nextPut: $.]
!
(reader addMethod: 'visiting')
!
visitNilLiteralNode: anObject {NilLiteralNode} {^Self}
	stream nextPutAll: 'nil'
!
(reader addMethod: 'visiting')
!
visitPragmaNode: aPragmaNode {PragmaNode} {^Self}
	| aNode {MessageNode} |
	stream nextPut: $<.
	aNode := aPragmaNode expression.
	aNode arguments size = 0
		ifTrue: [stream nextPutAll: aNode selector]
		ifFalse: 
			[aNode keywords
				with: aNode arguments
				do: 
					[:key {Str} :value {Expression} |
					stream
						nextPutAll: key;
						space.
					self visit: value]
				separatedBy: [stream space]].
	stream nextPut: $>
!
(reader addMethod: 'visiting')
!
visitReferenceLiteralNode: anObject {ReferenceLiteralNode} {^Self}
	stream nextPutAll: '#{'.
	anObject path do: [:each {Str} | stream nextPutAll: each]
		separatedBy: [stream nextPut: $.].
	stream nextPut: $}
!
(reader addMethod: 'visiting')
!
visitReturnNode: aNode {ReturnNode} {^Self}
	self printCommentOf: aNode.
	stream nextPut: $^.
	self visit: aNode value
!
(reader addMethod: 'visiting typenodes')
!
visitSelfTypeNode: anObject {SelfTypeNode} {^Self}
	stream nextPutAll: 'Self'
!
(reader addMethod: 'visiting')
!
visitSequenceNode: aNode {SequenceNode} {^Self}
	self printBlockBody: aNode
!
(reader addMethod: 'visiting')
!
visitStringLiteralNode: anObject {StringLiteralNode} {^Self}
	stream nextPut: $'.
	anObject value do: 
			[:ch {Character} |
			stream nextPut: ch.
			ch == $' ifTrue: [stream nextPut: $']].
	stream nextPut: $'
!
(reader addMethod: 'visiting')
!
visitSymbolLiteralNode: anObject {SymbolLiteralNode} {^Self}
	stream print: anObject value
!
(reader addMethod: 'visiting typenodes')
!
visitTypeDefNode: anObject {TypeDefNode} {^Self}
	self visit: anObject node.
	stream nextPutAll: ' def'
!
(reader addMethod: 'visiting typenodes')
!
visitTypeOrNode: anObject {TypeOrNode} {^Self}
	self visit: anObject left.
	stream nextPutAll: ' | '.
	self visit: anObject right
!
(reader addMethod: 'visiting typenodes')
!
visitTypeVariableNode: anObject {TypeVariableNode} {^Self}
	stream nextPutAll: anObject name
!
(reader addMethod: 'visiting')
!
visitVariableDeclarationNode: anObject {VariableDeclarationNode} {^Self}
	stream nextPutAll: anObject name.
	anObject type isNil
		ifFalse: 
			[stream space.
			self printTypeNode: anObject type]
!
(reader addMethod: 'visiting')
!
visitVariableNode: anObject {VariableNode} {^Self}
	stream nextPutAll: anObject name
!
(reader addMethod: 'visiting')
!
when: aBoolean {Bool} parenthesize: aBlock {[^Object]} {^Self}
	aBoolean
		ifFalse: [aBlock value]
		ifTrue: 
			[stream nextPut: $(.
			aBlock value.
			stream nextPut: $)]
!
(reader addClassMethod: 'instance creation')
!
on: aStream {WStream[Char]} {^SourcePrinter[Object]}
	^self
		stream: aStream
		precedence: nil
		indentation: 0
		emphasis: nil
!
(reader addClassMethod: 'instance creation')
!
stream: aWriteStream {WStream[Char]} precedence: anUndefinedObject {Int | Nil} indentation: anInteger {Int} emphasis: anUndefinedObject2 {Sym | Nil} {^SourcePrinter[Object]}
	^self new
		initializeStream: aWriteStream
		precedence: anUndefinedObject
		indentation: anInteger
		emphasis: anUndefinedObject2
!
(reader addClassMethod: 'pegon')
!
supertype
	^#{NodeVisitor} => #{Object}
!
