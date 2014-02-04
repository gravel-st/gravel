(reader defineClass: 'FieldWriteNode' superclass: 'st.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'owner' type: 'Expression')
!
(reader addInstVar: 'field' type: 'String')
!
(reader addInstVar: 'value' type: 'Expression')
!
(reader addInstVar: 'type' type: 'TypeNode')
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
initializeOwner: anExpression {Expression} field: aString {Str} type: anObject {TypeNode} value: aVariableNode {Expression} {^Self}
	owner := anExpression.
	field := aString.
	type := anObject.
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
(reader addMethod: 'accessing')
!
type {^TypeNode}
	^type
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
(reader addClassMethod: 'instance creation')
!
owner: owner {Expression} field: field {Str} type: type {TypeNode} value: value {Expression} {^FieldWriteNode}
	^self new
		initializeOwner: owner
		field: field
		type: type
		value: value
!
