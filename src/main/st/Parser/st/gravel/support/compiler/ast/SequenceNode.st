(reader defineClass: 'SequenceNode' superclass: 'st.gravel.support.compiler.ast.Node')
!
(reader addInstVar: 'temporaries' type: 'Array[VariableDeclarationNode]')
!
(reader addInstVar: 'statements' type: 'Array[Statement]')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject
		and: [temporaries = anObject temporaries and: [statements = anObject statements]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSequenceNode: self
!
(reader addMethod: 'accessing')
!
asSimpleExpression {^Statement}
	self assert: self isSimpleExpressionSequence.
	statements isEmpty ifTrue: [^NilLiteralNode new].
	^statements first
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: temporaries hash) bitXor: statements hash
!
(reader addMethod: 'initialize-release')
!
initializeTemporaries: anArray {Array[VariableDeclarationNode]} statements: anArray2 {Array[Statement]} {^Self}
	temporaries := anArray.
	statements := anArray2.
	self initialize
!
(reader addMethod: 'accessing')
!
isComplex {^Bool}
	^statements size > 1 or: [temporaries isEmpty not]
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^statements isEmpty and: [temporaries isEmpty]
!
(reader addMethod: 'As yet unclassified')
!
isNilSequence {^Bool}
	^temporaries isEmpty and: [statements size = 1 and: [statements first isNilLiteralNode]]
!
(reader addMethod: 'accessing')
!
isSimpleExpressionSequence {^Bool}
	^temporaries isEmpty
		and: [statements isEmpty or: [statements size = 1 and: [statements first isReturnNode not]]]
!
(reader addMethod: 'As yet unclassified')
!
methodSourceOn: aStream {WStream[Char]} {^Self}
	self sourceTemporariesOn: aStream.
	statements do: 
			[:stmt {Statement} |
			aStream
				cr;
				tab.
			stmt innerSourceOn: aStream]
		separatedBy: [aStream nextPut: $.]
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	statements do: aBlock
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^temporaries
		anySatisfy: [:temporary {VariableDeclarationNode} | temporary type notNil and: [temporary type referencesSelfOrInstanceType]]
!
(reader addMethod: 'As yet unclassified')
!
returnsNothingButSelf {^Bool}
	self allNodesDo: 
			[:each {Node} |
			each isReturnNode
				ifTrue: 
					[| returnNode {ReturnNode} |
					returnNode := each.
					returnNode value isSelfNode ifFalse: [^false]]].
	^true
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self sourceTemporariesOn: aStream.
	(temporaries notEmpty and: [statements notEmpty]) ifTrue: [aStream cr].
	statements do: 
			[:stmt {Statement} |
			aStream space.
			stmt innerSourceOn: aStream]
		separatedBy: 
			[aStream
				nextPut: $.;
				cr]
!
(reader addMethod: 'As yet unclassified')
!
sourceTemporariesOn: aStream {WStream[Char]} {^Self}
	temporaries isEmpty
		ifFalse: 
			[aStream
				nextPut: $|;
				space.
			temporaries do: 
					[:arg {VariableDeclarationNode} |
					arg sourceOn: aStream.
					aStream space].
			aStream nextPut: $|]
!
(reader addMethod: 'accessing')
!
statements {^Array[Statement]}
	^statements
!
(reader addMethod: 'accessing')
!
temporaries {^Array[VariableDeclarationNode]}
	^temporaries
!
(reader addClassMethod: 'As yet unclassified')
!
empty {^SequenceNode}
	^self temporaries: #() statements: #()
!
(reader addClassMethod: 'instance creation')
!
return: aNode {Expression} {^SequenceNode}
	^self statement: (ReturnNode value: aNode)
!
(reader addClassMethod: 'instance creation')
!
statement: aNode {Statement} {^SequenceNode}
	^self temporaries: #() statements: (Array with: aNode)
!
(reader addClassMethod: 'instance creation')
!
temporaries: anArray {Array[VariableDeclarationNode]} statements: anArray2 {Array[Statement]} {^Instance}
	^self new initializeTemporaries: anArray statements: anArray2
!
