(reader defineClass: 'TypeVariableNode' superclass: 'org.gravel.parser.TypeNode')
!
(reader addInstVar: 'name')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject and: [name = anObject name]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTypeVariableNode: self
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
(reader addMethod: 'testing')
!
isAnyType {^Bool}
	^name = 'Object'
!
(reader addMethod: 'testing')
!
isBooleanType {^Bool}
	^name = 'Boolean'
!
(reader addMethod: 'As yet unclassified')
!
isInstanceType {^Bool}
	^name = 'Instance'
!
(reader addMethod: 'As yet unclassified')
!
isNilType {^Bool}
	^name = 'UndefinedObject'
!
(reader addMethod: 'As yet unclassified')
!
isTypeVariableNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
name {^String}
	^name
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
withTypeArg: aTypeNode {TypeNode} {^GenericTypeVariableNode}
	^GenericTypeVariableNode root: self arguments: (Array with: aTypeNode)
!
(reader addMethod: 'As yet unclassified')
!
withTypeArgs: typeNodes {Arr[TypeNode]} {^GenericTypeVariableNode}
	^GenericTypeVariableNode root: self arguments: typeNodes
!
(reader addClassMethod: 'instance creation')
!
any {^TypeVariableNode}
	^self name: 'Object'
!
(reader addClassMethod: 'instance creation')
!
boolean {^TypeVariableNode}
	^self name: 'Boolean'
!
(reader addClassMethod: 'instance creation')
!
error {^TypeVariableNode}
	^self name: 'Error'
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[String]}
	^#('name')
!
(reader addClassMethod: 'instance creation')
!
int {^TypeVariableNode}
	^self name: 'Integer'
!
(reader addClassMethod: 'instance creation')
!
name: aString {String} {^Instance}
	(#('Self' 'Instance') includes: aString) ifTrue: [ParseError raise].
	^self new initializeName: aString
!
(reader addClassMethod: 'instance creation')
!
nil {^TypeVariableNode}
	^self name: 'UndefinedObject'
!
