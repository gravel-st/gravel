(reader defineClass: 'VariableNode' superclass: 'org.gravel.parser.Expression')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [name = anObject name]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitVariableNode: self
!
(reader addMethod: 'As yet unclassified')
!
assign: anExpression {Expression} {^AssignmentNode}
	^AssignmentNode variable: self value: anExpression
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: name hash
!
(reader addMethod: 'initialize-release')
!
initializeName: aString {String} {^Self}
	name := aString.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: name
!
(reader addMethod: 'As yet unclassified')
!
isAssignable {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
isSelfNode {^Bool}
	^name = 'self'
!
(reader addMethod: 'As yet unclassified')
!
isSuperNode {^Bool}
	^name = 'super'
!
(reader addMethod: 'As yet unclassified')
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
name {^String}
	^name
!
(reader addMethod: 'As yet unclassified')
!
needsBrackets {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^0
!
(reader addMethod: 'As yet unclassified')
!
referencesVariable: aString {Str} {^Bool}
	^name = aString
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String]}
	^#('name')
!
(reader addClassMethod: 'instance creation')
!
name: aString {String} {^Instance}
	self deny: aString = 'nil'.
	^self new initializeName: aString
!
