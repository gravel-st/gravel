(reader defineClass: 'LocalReadNode' superclass: 'org.gravel.support.compiler.ast.StateAccessNode')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitLocalReadNode: self
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {Str} {^Self}
	name := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{'.
	aStream
		nextPutAll: name;
		nextPutAll: '}'
!
(reader addMethod: 'testing')
!
isVariableNode {^Bool}
	^true
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
	
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^name = aString
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Str]}
	^#('name')
!
(reader addClassMethod: 'instance creation')
!
name: aString {Str} {^LocalReadNode}
	^self new initializeName: aString
!
