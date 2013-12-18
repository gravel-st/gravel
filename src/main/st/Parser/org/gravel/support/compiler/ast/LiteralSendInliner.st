(reader defineClass: 'LiteralSendInliner' superclass: 'org.gravel.support.compiler.ast.MessageSendRewriter')
!
(reader addInstVar: 'extraEmits')
!
(reader addInstVar: 'extraTemps')
!
(reader addInstVar: 'nodesToCheck')
!
(reader addInstVar: 'generatedTemps')
!
(reader addInstVar: 'localNlrMarker')
!
(reader addMethod: 'As yet unclassified')
!
addUsedNode: aNode {Node} {^Self}
	nodesToCheck add: aNode
!
(reader addMethod: 'As yet unclassified')
!
extraEmit: aStatement {Statement} {^Self}
	extraEmits add: aStatement
!
(reader addMethod: 'As yet unclassified')
!
extraTemp: aVariableDeclarationNode {VariableDeclarationNode} {^Self}
	extraTemps add: aVariableDeclarationNode
!
(reader addMethod: 'As yet unclassified')
!
in: stmt {Statement} replaceAll: arguments {Arr[VariableDeclarationNode]} with: values {Arr[Expression]} {^Statement}
	| start {Statement} |
	start := stmt.
	arguments with: values
		do: 
			[:arg {VariableDeclarationNode} :val {Expression} |
			start := VariableNodeReplacer
						in: start
						replace: arg name
						with: val].
	^start
!
(reader addMethod: 'As yet unclassified')
!
initializeRoot: aNode {Node} {^Self}
	nodesToCheck := OrderedCollection new.
	generatedTemps := Set new.
	self addUsedNode: aNode
!
(reader addMethod: 'initialize-release')
!
initializeSpecialSelectors {^Self}
	specialSelectors := Dictionary new.
	specialSelectors at: #isNil put: [:node {MessageNode} | self produce_isNil: node receiver].
	specialSelectors at: #value put: [:node {MessageNode} | self produce_value: node receiver].
	specialSelectors at: #value:
		put: [:node {MessageNode} | self produce: node receiver value: node argument]
!
(reader addMethod: 'As yet unclassified')
!
inline: aMethodNode {MethodNode} {^MethodNode}
	self initializeRoot: aMethodNode.
	^self visit: aMethodNode
!
(reader addMethod: 'As yet unclassified')
!
newTemp: isHolder {Bool} suggestion: suggestion {Str} {^VariableNode}
	| temp {Str} |
	temp := self newTempName: suggestion.
	self extraTemp: (isHolder
				ifTrue: [HolderDeclarationNode name: temp]
				ifFalse: [VariableDeclarationNode name: temp]).
	^VariableNode name: temp
!
(reader addMethod: 'As yet unclassified')
!
newTempName: suggestion {Str} {^Str}
	| temp {Str} idx {Int} |
	temp := suggestion.
	idx := 0.
	[self varNameIsUsed: temp] whileTrue: 
			[temp := suggestion , '_' , idx printString.
			idx := idx + 1.
			self varNameIsUsed: temp].
	generatedTemps add: temp.
	^temp
!
(reader addMethod: 'As yet unclassified')
!
newTempSuggestion: suggestion {Str} {^VariableNode}
	^self newTemp: false suggestion: suggestion
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Expression} value: arg1 {Expression} {^Statement}
	receiver isBlockNode ifTrue: [^self produceBlock: receiver arguments: (Array with: arg1)].
	^receiver send: 'value:' with: arg1
!
(reader addMethod: 'As yet unclassified')
!
produceBlock: block {BlockNode} arguments: arguments {Arr[Expression]} {^Statement}
	| body {SequenceNode} stmts {Arr[Statement]} argTemps {Arr[Expression]} result {VariableNode} lastStatement {Statement} |
	body := block body.
	body statements isEmpty ifTrue: [^NilLiteralNode new].
	block body temporaries do: 
			[:temp {VariableDeclarationNode} |
			body := VariableRenamer
						in: body
						rename: temp name
						to: (self newTempSuggestion: temp name) name].
	argTemps := arguments collect: 
					[:each {Expression} |
					each isVariableNode
						ifTrue: [each]
						ifFalse: 
							[| t {VariableNode} |
							t := self newTempSuggestion: 'extract'.
							self extraEmit: (LocalWriteNode name: t name value: each).
							t]].
	stmts := body statements.
	1 to: stmts size - 1
		do: 
			[:i {Int} |
			| stmt {Statement} |
			stmt := stmts at: i.
			self extraEmit: (self
						in: stmt
						replaceAll: block arguments
						with: argTemps)].
	lastStatement := self
				in: stmts last
				replaceAll: block arguments
				with: argTemps.
	lastStatement isReturnNode ifTrue: [^lastStatement].
	result := self newTempSuggestion: 'result'.
	self extraEmit: (result assign: lastStatement).
	^result
!
(reader addMethod: 'visiting')
!
produceNlrMarkerDefinition: aString {Str} for: aMethodNode {MethodNode} {^Str}
	localNlrMarker := aString.
	^aString
!
(reader addMethod: 'As yet unclassified')
!
produce_isNil: receiver {Expression} {^Expression}
	receiver isBlockNode ifTrue: [^BooleanLiteralNode false].
	^receiver send: 'isNil'
!
(reader addMethod: 'As yet unclassified')
!
produce_value: receiver {Expression} {^Statement}
	receiver isBlockNode ifTrue: [^self produceBlock: receiver arguments: #()].
	^receiver send: 'value'
!
(reader addMethod: 'As yet unclassified')
!
varNameIsUsed: temp {Str} {^Bool}
	^temp = 'self' or: 
			[(generatedTemps includes: temp)
				or: [nodesToCheck anySatisfy: [:node {Node} | node hierarchyReferencesVariable: temp]]]
!
(reader addMethod: 'visiting')
!
visitNonLocalReturnNode: anObject {NonLocalReturnNode} {^Statement}
	| value {Statement} |
	value := self visit: anObject value.
	value isNonLocalReturnNode ifTrue: [^value].
	value isReturnNode ifTrue: [value := value returnValue].
	(localNlrMarker notNil and: [localNlrMarker = anObject marker])
		ifTrue: [^ReturnNode value: value].
	^NonLocalReturnNode marker: anObject marker value: value
!
(reader addMethod: 'visiting')
!
visitReturnNode: anObject {ReturnNode} {^Statement}
	| value {Statement} |
	value := self visit: anObject value.
	value isReturnNode ifTrue: [^value].
	^ReturnNode value: value
!
(reader addMethod: 'visiting')
!
visitSequenceNode: anObject {SequenceNode} {^SequenceNode}
	| temporaries {OrdColl[VariableDeclarationNode]} statements {OrdColl[Statement]} oldExtraTemps {OrdColl[VariableDeclarationNode]} |
	temporaries := OrderedCollection new.
	statements := OrderedCollection new.
	anObject temporaries do: 
			[:each {VariableDeclarationNode} |
			| newTemp {VariableDeclarationNode} |
			newTemp := self visit: each.
			temporaries add: newTemp].
	anObject statements do: 
			[:each {Statement} |
			| res {Statement} oldExtraEmits {OrdColl[Statement]} |
			oldExtraEmits := extraEmits.
			oldExtraTemps := extraTemps.
			extraEmits := OrderedCollection new.
			extraTemps := OrderedCollection new.
			res := self visit: each.
			statements addAll: extraEmits.
			temporaries := temporaries copyWithAll: extraTemps.
			extraEmits := oldExtraEmits.
			extraTemps := oldExtraTemps.
			statements add: res].
	^SequenceNode temporaries: temporaries asArray statements: statements asArray
!
(reader addClassMethod: 'As yet unclassified')
!
inline: aMethodNode {MethodNode} {^MethodNode}
	^self new inline: aMethodNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[OrderedCollection[Statement], OrderedCollection[VariableDeclarationNode], OrdColl[Node], Set[Str], Str | Nil]}
	^#('extraEmits' 'extraTemps' 'nodesToCheck' 'generatedTemps' 'localNlrMarker')
!
