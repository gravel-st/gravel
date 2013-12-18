(reader defineClass: 'MessageSendRewriter' superclass: 'org.gravel.support.compiler.ast.NodeCopier')
!
(reader addInstVar: 'specialSelectors')
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	self initializeSpecialSelectors
!
(reader addMethod: 'initialize-release')
!
initializeSpecialSelectors {^Self}
	self subclassResponsibility
!
(reader addMethod: 'visiting')
!
visitBinaryMessageNode: anObject {BinaryMessageNode} {^Statement}
	| selector {Sym} res {[MessageNode, ^Statement] | Nil} |
	selector := anObject selector asSymbol.
	res := specialSelectors at: selector ifAbsent: [].
	res isNil ifFalse: [^res value: anObject].
	^super visitBinaryMessageNode: anObject
!
(reader addMethod: 'visiting')
!
visitCascadeNode: anObject {CascadeNode} {^Expression}
	| expressions {Arr[Expression]} |
	expressions := anObject messages collect: [:each {MessageNode} | self visit: each].
	(expressions contains: [:each {Expression} | each isMessageNode not])
		ifTrue: [^InlineExpressionCollection expressions: expressions].
	^CascadeNode messages: (expressions collect: [:each {Expression} | each])
!
(reader addMethod: 'visiting')
!
visitKeywordMessageNode: anObject {KeywordMessageNode} {^Statement}
	| selector {Sym} res {[MessageNode, ^Statement] | Nil} |
	selector := anObject selector asSymbol.
	res := specialSelectors at: selector ifAbsent: [].
	res isNil ifFalse: [^res value: anObject].
	^super visitKeywordMessageNode: anObject
!
(reader addMethod: 'visiting')
!
visitUnaryMessageNode: anObject {UnaryMessageNode} {^Statement}
	| selector {Sym} res {[MessageNode, ^Statement] | Nil} |
	selector := anObject selector asSymbol.
	res := specialSelectors at: selector ifAbsent: [].
	res isNil ifFalse: [^res value: anObject].
	^super visitUnaryMessageNode: anObject
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Dict[Sym, [MessageNode, ^Statement]]]}
	^#('specialSelectors')
!
