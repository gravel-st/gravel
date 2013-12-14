(reader defineClass: 'TypeDefNode' superclass: 'org.gravel.parser.TypeNode')
!
(reader addInstVar: 'node')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject and: [node = anObject node]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTypeDefNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: node hash
!
(reader addMethod: 'initialize-release')
!
initializeNode: aTypeVariableNode {TypeNode} {^Self}
	node := aTypeVariableNode.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	node innerSourceOn: aStream.
	aStream nextPutAll: ' def'
!
(reader addMethod: 'initialize-release')
!
isTypeDefNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
node {^TypeNode}
	^node
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	aBlock value: node
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[TypeNode]}
	^#('node')
!
(reader addClassMethod: 'instance creation')
!
node: aTypeVariableNode {TypeNode} {^Instance}
	^self new initializeNode: aTypeVariableNode
!
