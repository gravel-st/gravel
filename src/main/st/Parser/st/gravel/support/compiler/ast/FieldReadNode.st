(reader defineClass: 'FieldReadNode' superclass: 'st.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'owner' type: 'Expression')
!
(reader addInstVar: 'field' type: 'String')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitFieldReadNode: self
!
(reader addMethod: 'accessing')
!
field {^Str}
	^field
!
(reader addMethod: 'initialize-release')
!
initializeOwner: anExpression {Expression} field: aString {Str} {^Self}
	owner := anExpression.
	field := aString.
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
		nextPutAll: '}'
!
(reader addMethod: 'As yet unclassified')
!
name {^Str}
	^field
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	aBlock value: owner
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
(reader addClassMethod: 'instance creation')
!
owner: anExpression {Expression} field: aString {Str} {^FieldReadNode}
	^self new initializeOwner: anExpression field: aString
!
