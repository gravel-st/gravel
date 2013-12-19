(reader defineClass: 'ClassTypeNode' superclass: 'st.gravel.support.compiler.ast.TypeNode')
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
	^visitor visitClassTypeNode: self
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
	aStream nextPutAll: ' class'
!
(reader addMethod: 'As yet unclassified')
!
instanceType {^TypeNode}
	^node
!
(reader addMethod: 'As yet unclassified')
!
isNilType {^Bool}
	^false
!
(reader addMethod: 'accessing')
!
node {^TypeNode}
	^node
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^node referencesSelfOrInstanceType
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	
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
