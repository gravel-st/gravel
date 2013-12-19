(reader defineClass: 'AssignmentNode' superclass: 'st.gravel.support.compiler.ast.Expression')
!
(reader addInstVar: 'variable')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [variable = anObject variable and: [value = anObject value]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitAssignmentNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: variable hash) bitXor: value hash
!
(reader addMethod: 'initialize-release')
!
initializeVariable: aVariableNode {VariableNode} value: aValue {Expression} {^Self}
	variable := aVariableNode.
	value := aValue.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	variable sourceOn: aStream.
	aStream nextPutAll: ' := '.
	value sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
isAssignmentNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: value.
	aBlock value: variable
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^4
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addMethod: 'accessing')
!
variable {^VariableNode}
	^variable
!
(reader addMethod: 'accessing')
!
varName {^String}
	^variable name
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[VariableNode, Expression]}
	^#('variable' 'value')
!
(reader addClassMethod: 'instance creation')
!
variable: aVariableNode {VariableNode} value: anIntegerLiteralNode {Expression} {^Instance}
	^self new initializeVariable: aVariableNode value: anIntegerLiteralNode
!
