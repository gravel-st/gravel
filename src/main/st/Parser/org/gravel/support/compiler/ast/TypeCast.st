(reader defineClass: 'TypeCast' superclass: 'org.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'type')
!
(reader addInstVar: 'expression')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTypeCast: self
!
(reader addMethod: 'accessing')
!
expression {^Expression}
	^expression
!
(reader addMethod: 'initialize-release')
!
initializeType: aTypeVariableNode {TypeNode} expression: aVariableNode {Expression} {^Self}
	type := aTypeVariableNode.
	expression := aVariableNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '({'.
	type sourceOn: aStream.
	aStream nextPutAll: '} '.
	expression innerSourceOn: aStream.
	aStream nextPutAll: ')'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: type.
	aBlock value: expression
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^0
!
(reader addMethod: 'accessing')
!
type {^TypeNode}
	^type
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[TypeNode, Expression]}
	^#('type' 'expression')
!
(reader addClassMethod: 'instance creation')
!
type: aTypeVariableNode {TypeNode} expression: aVariableNode {Expression} {^TypeCast}
	^self new initializeType: aTypeVariableNode expression: aVariableNode
!
