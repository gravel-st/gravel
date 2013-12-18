(reader defineClass: 'MethodNode' superclass: 'org.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'selector')
!
(reader addInstVar: 'returnType')
!
(reader addInstVar: 'body')
!
(reader addInstVar: 'pragmas')
!
(reader addInstVar: 'protocol')
!
(reader addInstVar: 'nlrMarker')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: 
			[selector = anObject selector and: 
					[returnType = anObject returnType
						and: [body = anObject body and: [pragmas = anObject pragmas]]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitMethodNode: self
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[VariableDeclarationNode]}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
body {^SequenceNode}
	^body
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteArgumentSignature {^Boolean}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteReturnSignature {^Boolean}
	^returnType notNil or: [body returnsNothingButSelf]
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteSignature {^Boolean}
	^self hasCompleteArgumentSignature and: [self hasCompleteReturnSignature]
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(((super hash bitXor: selector hash) bitXor: returnType hash) bitXor: body hash)
		bitXor: pragmas hash
!
(reader addMethod: 'As yet unclassified')
!
hasNonLocalReturns {^Bool}
	body statements do: 
			[:rootStmt {Statement} |
			rootStmt
				allNodesDo: [:node {Node} | node isBlockNodeWithReturnStatements ifTrue: [^true]]].
	^false
!
(reader addMethod: 'initialize-release')
!
initializeSelector: aString {String} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocolString {Str} nlrMarker: anObject {Str} {^Self}
	selector := aString.
	body := aSequenceNode.
	returnType := anUndefinedObject.
	pragmas := anArray.
	protocol := protocolString.
	nlrMarker := anObject.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
isTraitRequirement {^Bool}
	^body statements size = 1 and: [body statements first isTraitRequirementMessage]
!
(reader addMethod: 'accessing')
!
keywords {^Arr[String]}
	^selector asSymbol keywords
!
(reader addMethod: 'accessing')
!
localPrimitiveIn: className {Str} nameNode: argument {StringLiteralNode} {^Arr[Str]}
	^Array with: className with: argument value
!
(reader addMethod: 'accessing')
!
nlrMarker {^Str}
	^nlrMarker
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
ofTrait: aReference {Reference} {^Self}
	^self withPropertyAt: #trait put: (StringLiteralNode value: aReference printString)
!
(reader addMethod: 'As yet unclassified')
!
pragmaPropertyAt: aKey {Sym} ifAbsent: aBlock {[^Object]} {^Object}
	| pr {PragmaNode} |
	pr := pragmas detect: [:each {PragmaNode} | each isPropertyPragmaAt: aKey]
				ifNone: [^aBlock value].
	^({LiteralNode} pr expression arguments second) value
!
(reader addMethod: 'accessing')
!
pragmas {^Array[PragmaNode]}
	^pragmas
!
(reader addMethod: 'As yet unclassified')
!
precedence {^Int}
	^self subclassResponsibility
!
(reader addMethod: 'accessing')
!
primitiveIn: className {Str} {^Arr[Str]}
	| pragma {PragmaNode | Nil} argument {Expression} arrayNode {ArrayLiteralNode} |
	pragma := self primitivePragma.
	pragma isNil ifTrue: [^nil].
	argument := pragma expression argument.
	argument isStringLiteralNode
		ifTrue: [^self localPrimitiveIn: className nameNode: argument].
	argument isArrayLiteralNode ifFalse: [^nil].
	arrayNode := argument.
	^arrayNode value collect: 
			[:e {Object} |
			| str {Str} |
			str := e.
			str]
!
(reader addMethod: 'accessing')
!
primitivePragma {^PragmaNode | Nil}
	^pragmas detect: [:e {PragmaNode} | e expression selector = 'primitive:'] ifNone: [nil]
!
(reader addMethod: 'accessing')
!
protocol {^Str}
	^protocol
!
(reader addMethod: 'As yet unclassified')
!
pvtSetBody: aSequenceNode {SequenceNode} {^Self}
	body := aSequenceNode
!
(reader addMethod: 'As yet unclassified')
!
pvtSetNlrMarker: anObject {Str} {^Self}
	nlrMarker := anObject
!
(reader addMethod: 'As yet unclassified')
!
pvtSetPragmas: anArray {Array[PragmaNode]} {^Self}
	pragmas := anArray
!
(reader addMethod: 'As yet unclassified')
!
pvtSetProtocol: aString {Str} {^Self}
	protocol := aString
!
(reader addMethod: 'As yet unclassified')
!
referencesSelfOrInstanceType {^Bool}
	^returnType notNil and: [returnType referencesSelfOrInstanceType]
!
(reader addMethod: 'accessing')
!
returnType {^TypeNode}
	^returnType
!
(reader addMethod: 'printing')
!
returnTypeAndBodySourceOn: aStream {WStream[Char]} {^Self}
	returnType isNil
		ifFalse: 
			[aStream
				space;
				nextPutAll: '{^'.
			returnType sourceOn: aStream.
			aStream nextPut: $}].
	pragmas do: 
			[:each {PragmaNode} |
			aStream
				cr;
				space.
			each sourceOn: aStream].
	body methodSourceOn: aStream
!
(reader addMethod: 'accessing')
!
selector {^String}
	^selector
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
updatePragmas: aBlock {[PragmaNode, ^PragmaNode]} {^Self}
	^self withPragmas: (pragmas collect: aBlock)
!
(reader addMethod: 'As yet unclassified')
!
withBody: aSequenceNode {SequenceNode} {^Self}
	^self copy pvtSetBody: aSequenceNode
!
(reader addMethod: 'As yet unclassified')
!
withNlrMarker: anObject {Str} {^Self}
	^self copy pvtSetNlrMarker: anObject
!
(reader addMethod: 'As yet unclassified')
!
withPragmas: anArray {Array[PragmaNode]} {^Self}
	^self copy pvtSetPragmas: anArray
!
(reader addMethod: 'As yet unclassified')
!
withPropertyAt: aKey {Sym} put: aValue {Expression} {^Self}
	(pragmas contains: [:each {PragmaNode} | each isPropertyPragmaAt: aKey])
		ifTrue: 
			[^self updatePragmas: 
					[:each {PragmaNode} |
					(each isPropertyPragmaAt: aKey)
						ifTrue: [each withArguments: (Array with: (SymbolLiteralNode value: aKey) with: aValue)]
						ifFalse: [each]]]
		ifFalse: 
			[^self withPragmas: (pragmas
						copyWith: (PragmaNode expression: (KeywordMessageNode
										receiver: NilLiteralNode new
										selector: 'propertyAt:put:'
										arguments: (Array with: (SymbolLiteralNode value: aKey) with: aValue))))]
!
(reader addMethod: 'As yet unclassified')
!
withProtocol: aString {Str} {^Self}
	^self copy pvtSetProtocol: aString
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String, TypeNode, SequenceNode, Array[PragmaNode], Str, Str]}
	^#('selector' 'returnType' 'body' 'pragmas' 'protocol' 'nlrMarker')
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocol {Str} {^Instance}
	^self
		selector: aString
		body: aSequenceNode
		returnType: anUndefinedObject
		pragmas: anArray
		protocol: protocol
		nlrMarker: nil
!
(reader addClassMethod: 'instance creation')
!
selector: aString {String} body: aSequenceNode {SequenceNode} returnType: returnType {TypeNode} pragmas: anArray {Array[PragmaNode]} protocol: protocol {Str} nlrMarker: nlrMarker {Str | Nil} {^Instance}
	^self new
		initializeSelector: aString
		body: aSequenceNode
		returnType: returnType
		pragmas: anArray
		protocol: protocol
		nlrMarker: nlrMarker
!
