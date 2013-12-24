(reader defineClass: 'IntermediateNodeRewriter' superclass: 'st.gravel.support.compiler.ast.MessageSendRewriter')
!
(reader addMethod: 'initialize-release')
!
initializeSpecialSelectors {^Self}
	specialSelectors := Dictionary new.
	specialSelectors at: #ifTrue:
		put: [:node {MessageNode} | self produce: node receiver ifTrue: node argument].
	specialSelectors at: #ifFalse:
		put: [:node {MessageNode} | self produce: node receiver ifFalse: node argument].
	specialSelectors at: #ifTrue:ifFalse:
		put: 
			[:node {MessageNode} |
			self
				produce: node receiver
				ifTrue: node arguments first
				ifFalse: node arguments second].
	specialSelectors at: #ifFalse:ifTrue:
		put: 
			[:node {MessageNode} |
			self
				produce: node receiver
				ifTrue: node arguments second
				ifFalse: node arguments first].
	specialSelectors at: #whileTrue
		put: [:node {MessageNode} | self produce_whileTrue: node receiver].
	specialSelectors at: #whileFalse
		put: [:node {MessageNode} | self produce_whileFalse: node receiver].
	specialSelectors at: #whileTrue:
		put: [:node {MessageNode} | self produce: node receiver whileTrue: node arguments first].
	specialSelectors at: #whileFalse:
		put: [:node {MessageNode} | self produce: node receiver whileFalse: node arguments first].
	specialSelectors at: #to:do:
		put: 
			[:node {MessageNode} |
			self
				produce: node receiver
				to: node arguments first
				do: node arguments second].
	specialSelectors at: #to:by:do:
		put: 
			[:node {MessageNode} |
			self
				produce: node receiver
				to: node arguments first
				by: node arguments second
				do: node arguments third].
	specialSelectors at: #==
		put: [:node {MessageNode} | self produce: node receiver identityEquals: node arguments first].
	specialSelectors at: #and:
		put: [:node {MessageNode} | self produce: node receiver and: node arguments first].
	specialSelectors at: #or:
		put: [:node {MessageNode} | self produce: node receiver or: node arguments first].
	specialSelectors at: #basicSize
		put: [:node {MessageNode} | self produce_basicSize: node receiver].
	specialSelectors at: #basicAt:
		put: [:node {MessageNode} | self produce: node receiver basicAt: node arguments first].
	specialSelectors at: #basicAt:put:
		put: 
			[:node {MessageNode} |
			self
				produce: node receiver
				basicAt: node arguments first
				put: node arguments second].
	specialSelectors at: #isNil put: [:node {MessageNode} | self produce_isNil: node receiver]
!
(reader addMethod: 'As yet unclassified')
!
nilReturningBlockNode {^BlockNode}
	^BlockNode expression: NilLiteralNode new returnType: TypeVariableNode nil
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} and: testExpr {Expression} {^BooleanAndNode}
	| testBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	^BooleanAndNode left: (self visit: receiver) right: (self visit: testBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Expression} basicAt: index {Expression} {^ArrayAtNode}
	^ArrayAtNode receiver: (self visit: receiver) index: (self visit: index)
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Expression} basicAt: index {Expression} put: value {Expression} {^ArrayAtPutNode}
	^ArrayAtPutNode
		receiver: (self visit: receiver)
		index: (self visit: index)
		value: (self visit: value)
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} identityEquals: anObject {Node} {^IdentityComparisonNode}
	^IdentityComparisonNode left: (self visit: receiver) right: (self visit: anObject)
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} ifFalse: aBlockNode {Expression} {^IfTrueIfFalseNode}
	^self
		produce: receiver
		ifTrue: self nilReturningBlockNode
		ifFalse: aBlockNode
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} ifTrue: aBlockNode {Expression} {^IfTrueIfFalseNode}
	^self
		produce: receiver
		ifTrue: aBlockNode
		ifFalse: self nilReturningBlockNode
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} ifTrue: trueExpr {Expression} ifFalse: falseExpr {Expression} {^IfTrueIfFalseNode}
	| trueBlockNode {BlockNode} falseBlockNode {BlockNode} |
	trueExpr isBlockNode ifFalse: [^nil].
	falseExpr isBlockNode ifFalse: [^nil].
	trueBlockNode := trueExpr.
	falseBlockNode := falseExpr.
	^IfTrueIfFalseNode
		test: (self visit: receiver)
		trueSequence: (self visit: trueBlockNode body)
		falseSequence: (self visit: falseBlockNode body)
		returnType: (TypeOrNode left: trueBlockNode returnType right: falseBlockNode returnType)
!
(reader addMethod: 'As yet unclassified')
!
produce: receiver {Node} or: testExpr {Expression} {^BooleanOrNode}
	| testBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	^BooleanOrNode left: (self visit: receiver) right: (self visit: testBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce: start {Expression} to: stop {Expression} by: step {Expression} do: loopExpr {Expression} {^ToDoNode}
	| loopBlockNode {BlockNode} |
	loopExpr isBlockNode ifFalse: [^nil].
	loopBlockNode := loopExpr.
	^ToDoNode
		start: (self visit: start)
		stop: (self visit: stop)
		step: (self visit: step)
		counterName: loopBlockNode arguments first name
		doSequence: (self visit: loopBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce: start {Expression} to: stop {Expression} do: loopExpr {Expression} {^ToDoNode}
	| loopBlockNode {BlockNode} |
	loopExpr isBlockNode ifFalse: [^nil].
	loopBlockNode := loopExpr.
	^ToDoNode
		start: (self visit: start)
		stop: (self visit: stop)
		step: (IntegerLiteralNode integer: 1)
		counterName: loopBlockNode arguments first name
		doSequence: (self visit: loopBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce: testExpr {Expression} whileFalse: loopExpr {Expression} {^WhileFalseNode}
	| testBlockNode {BlockNode} loopBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	loopExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	loopBlockNode := loopExpr.
	^WhileFalseNode testSequence: (self visit: testBlockNode body)
		doSequence: (self visit: loopBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce: testExpr {Expression} whileTrue: loopExpr {Expression} {^WhileTrueNode}
	| testBlockNode {BlockNode} loopBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	loopExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	loopBlockNode := loopExpr.
	^WhileTrueNode testSequence: (self visit: testBlockNode body)
		doSequence: (self visit: loopBlockNode body)
!
(reader addMethod: 'As yet unclassified')
!
produce_basicSize: expression {Expression} {^ArraySizeNode}
	^ArraySizeNode receiver: (self visit: expression)
!
(reader addMethod: 'As yet unclassified')
!
produce_isNil: expression {Expression} {^IsNilNode}
	^IsNilNode receiver: (self visit: expression)
!
(reader addMethod: 'As yet unclassified')
!
produce_whileFalse: testExpr {Expression} {^WhileFalseNode}
	| testBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	^WhileFalseNode testSequence: (self visit: testBlockNode body) doSequence: nil
!
(reader addMethod: 'As yet unclassified')
!
produce_whileTrue: testExpr {Expression} {^WhileTrueNode}
	| testBlockNode {BlockNode} |
	testExpr isBlockNode ifFalse: [^nil].
	testBlockNode := testExpr.
	^WhileTrueNode testSequence: (self visit: testBlockNode body) doSequence: nil
!
