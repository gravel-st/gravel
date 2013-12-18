(reader defineClass: 'BlockNode' superclass: 'org.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'arguments')
!
(reader addInstVar: 'body')
!
(reader addInstVar: 'returnType')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: 
			[arguments = anObject arguments
				and: [body = anObject body and: [returnType = anObject returnType]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBlockNode: self
!
(reader addMethod: 'accessing')
!
arguments {^Array[VariableDeclarationNode]}
	^arguments
!
(reader addMethod: 'As yet unclassified')
!
asSimpleExpression {^Statement}
	self assert: self isSimpleExpressionBlock.
	^body asSimpleExpression
!
(reader addMethod: 'accessing')
!
body {^SequenceNode}
	^body
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^((super hash bitXor: arguments hash) bitXor: body hash) bitXor: returnType hash
!
(reader addMethod: 'initialize-release')
!
initializeArguments: anArray {Array[VariableDeclarationNode]} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} {^Self}
	arguments := anArray.
	body := aSequenceNode.
	returnType := anUndefinedObject.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $[.
	arguments isEmpty
		ifFalse: 
			[arguments do: 
					[:arg {VariableDeclarationNode} |
					aStream nextPut: $:.
					arg sourceOn: aStream.
					aStream space].
			aStream nextPut: $|].
	body sourceOn: aStream.
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
isBlockNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isBlockNodeWithReturnStatements {^Bool}
	body allNodesDo: [:node {Node} | node isReturnNode ifTrue: [^true]].
	^false
!
(reader addMethod: 'As yet unclassified')
!
isComplex {^Bool}
	^body isComplex
!
(reader addMethod: 'As yet unclassified')
!
isSimpleExpressionBlock {^Bool}
	^self body isSimpleExpressionSequence
!
(reader addMethod: 'As yet unclassified')
!
needsBrackets {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: body
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^arguments size
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^0
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
(reader addMethod: 'As yet unclassified')
!
signature {^BlockTypeNode}
	^BlockTypeNode
		arguments: (arguments collect: [:each {VariableDeclarationNode} | each type])
		returnType: returnType
!
(reader addClassMethod: 'instance creation')
!
arguments: anArray {Array[VariableDeclarationNode]} body: aSequenceNode {SequenceNode} returnType: anUndefinedObject {TypeNode} {^Instance}
	^self new initializeArguments: anArray body: aSequenceNode returnType: anUndefinedObject
!
(reader addClassMethod: 'instance creation')
!
body: aSequenceNode {SequenceNode} {^Instance}
	^self arguments: #() body: aSequenceNode returnType: nil
!
(reader addClassMethod: 'instance creation')
!
expression: aNode {Node} {^BlockNode}
	^self
		arguments: #()
		body: (SequenceNode statement: aNode)
		returnType: nil
!
(reader addClassMethod: 'instance creation')
!
expression: aNode {Node} returnType: returnType {TypeNode} {^BlockNode}
	^self
		arguments: #()
		body: (SequenceNode statement: aNode)
		returnType: returnType
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Array[VariableDeclarationNode], SequenceNode, TypeNode]}
	^#('arguments' 'body' 'returnType')
!
