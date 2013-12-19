(reader defineClass: 'ArrayLiteralNode' superclass: 'st.gravel.support.compiler.ast.LiteralNode')
!
(reader addInstVar: 'elements')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^super = anObject and: [elements = anObject elements]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitArrayLiteralNode: self
!
(reader addMethod: 'accessing')
!
elements {^Array[LiteralNode]}
	^elements
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^super hash bitXor: elements hash
!
(reader addMethod: 'initialize-release')
!
initializeElements: anArray {Array[LiteralNode]} {^Self}
	elements := anArray.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '#('.
	elements do: [:each {LiteralNode} | each sourceOn: aStream] separatedBy: [aStream space].
	aStream nextPut: $)
!
(reader addMethod: 'As yet unclassified')
!
isArrayLiteralNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	elements do: aBlock
!
(reader addMethod: 'accessing')
!
value {^Arr[Object]}
	^elements collect: [:each {LiteralNode} | each value]
!
(reader addClassMethod: 'instance creation')
!
elements: anArray {Array[LiteralNode]} {^Instance}
	^self new initializeElements: anArray
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Array[LiteralNode]]}
	^#('elements')
!
(reader addClassMethod: 'instance creation')
!
with: arg1 {LiteralNode} with: arg2 {LiteralNode} {^ArrayLiteralNode}
	^self elements: (Array with: arg1 with: arg2)
!
