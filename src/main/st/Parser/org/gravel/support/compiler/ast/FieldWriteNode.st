(reader defineClass: 'FieldWriteNode' superclass: 'org.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'owner')
!
(reader addInstVar: 'field')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitFieldWriteNode: self
!
(reader addMethod: 'accessing')
!
field {^Str}
	^field
!
(reader addMethod: 'initialize-release')
!
initializeOwner: anExpression {Expression} field: aString {Str} value: aVariableNode {Expression} {^Self}
	owner := anExpression.
	field := aString.
	value := aVariableNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	owner sourceOn: aStream.
	aStream
		nextPutAll: '.';
		nextPutAll: field;
		nextPutAll: ' := '.
	value sourceOn: aStream.
	aStream nextPutAll: '}'
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^field
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: owner.
	aBlock value: value
!
(reader addMethod: 'accessing')
!
owner {^Expression}
	^owner
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^field = aString
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^AssignmentNode variable: (VariableNode name: self name) value: value
!
(reader addMethod: 'accessing')
!
value {^Expression}
	^value
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Expression, Str, Expression]}
	^#('owner' 'field' 'value')
!
(reader addClassMethod: 'instance creation')
!
owner: anExpression {Expression} field: aString {Str} value: aVariableNode {Expression} {^FieldWriteNode}
	^self new initializeOwner: anExpression field: aString value: aVariableNode
!
