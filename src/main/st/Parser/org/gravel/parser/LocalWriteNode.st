(reader defineClass: 'LocalWriteNode' superclass: 'org.gravel.parser.StateAccessNode')
!
(reader addInstVar: 'name')
!
(reader addInstVar: 'value')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitLocalWriteNode: self
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {Str} value: anUnaryMessageNode {Expression} {^Self}
	name := aString.
	value := anUnaryMessageNode.
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
(reader addMethod: 'As yet unclassified')
!
localVarNamesDo: aBlock {[Str, ^Object]} {^Self}
	aBlock value: name
!
(reader addMethod: 'accessing')
!
name {^Str}
	^name
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
instVarTypes {^[Str, Expression]}
	^#('name' 'value')
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} value: anUnaryMessageNode {Expression} {^LocalWriteNode}
	^self new initializeName: aString value: anUnaryMessageNode
!
