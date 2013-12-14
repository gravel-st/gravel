(reader defineClass: 'GlobalWriteNode' superclass: 'org.gravel.parser.StateAccessNode')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'value')
!
(reader addInstVar: 'namespace')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitGlobalWriteNode: self
!
(reader addMethod: 'testing')
!
globalNamespace {^AbsoluteReference}
	^namespace
!
(reader addMethod: 'testing')
!
globalVarName {^Str}
	^name
!
(reader addMethod: 'initialize-release')
!
initializeNamespace: aReference {AbsoluteReference} name: aString {Str} value: anExpression {Expression} {^Self}
	namespace := aReference.
	name := aString.
	value := anExpression.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	aStream
		nextPutAll: name;
		nextPutAll: ' := '.
	value sourceOn: aStream.
	aStream nextPutAll: '}'
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
!
(reader addMethod: 'accessing')
!
namespace {^AbsoluteReference}
	^namespace
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]} {^Self}
	aBlock value: value
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^name = aString
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
instVarTypes {^[Str, Expression, AbsoluteReference]}
	^#('name' 'value' 'namespace')
!
(reader addClassMethod: 'instance creation')
!
namespace: aReference {AbsoluteReference} name: aString {Str} value: anExpression {Expression} {^GlobalWriteNode}
	^self new initializeNamespace: aReference name: aString value: anExpression
!
