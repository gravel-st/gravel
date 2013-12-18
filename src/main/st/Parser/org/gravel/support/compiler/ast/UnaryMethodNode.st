(reader defineClass: 'UnaryMethodNode' superclass: 'org.gravel.support.compiler.ast.MethodNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitUnaryMethodNode: self
!
(reader addMethod: 'As yet unclassified')
!
arguments {^Arr[VariableDeclarationNode]}
	^#()
!
(reader addMethod: 'As yet unclassified')
!
argumentsDo: aBlock {[VariableDeclarationNode, ^Object]}
	
!
(reader addMethod: 'As yet unclassified')
!
hasCompleteArgumentSignature {^Boolean}
	^true
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: body
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^0
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^1
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WriteStream[Char]} {^Self}
	aStream nextPutAll: selector.
	self returnTypeAndBodySourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	returnType isNil ifFalse: [returnType typeDefsDo: aBlock]
!
(reader addClassMethod: 'instance creation')
!
returnExpression: expression {Expression} {^Instance}
	^self
		selector: 'value'
		body: (SequenceNode statement: (ReturnNode value: expression))
		returnType: nil
		pragmas: #()
		protocol: 'evaluating'
!
