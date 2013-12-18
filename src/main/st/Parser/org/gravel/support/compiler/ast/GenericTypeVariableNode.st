(reader defineClass: 'GenericTypeVariableNode' superclass: 'org.gravel.support.compiler.ast.TypeNode')
!
(reader addInstVar: 'root')
!
(reader addInstVar: 'arguments')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject and: [root = anObject root and: [arguments = anObject arguments]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitGenericTypeVariableNode: self
!
(reader addMethod: 'accessing')
!
argument {^TypeNode}
	^arguments first
!
(reader addMethod: 'accessing')
!
arguments {^Array[TypeNode]}
	^arguments
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: root hash) bitXor: arguments hash
!
(reader addMethod: 'initialize-release')
!
initializeRoot: aTypeVariableNode {TypeNode} arguments: anArray {Array[TypeNode]} {^Self}
	root := aTypeVariableNode.
	arguments := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	root sourceOn: aStream.
	aStream nextPut: $[.
	arguments do: [:arg {TypeNode} | arg sourceOn: aStream]
		separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
isGenericTypeVariableNode {^Bool}
	^true
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^root referencesSelfOrInstanceType
		or: [arguments anySatisfy: [:type {TypeNode} | type referencesSelfOrInstanceType]]
!
(reader addMethod: 'accessing')
!
root {^TypeNode}
	^root
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	root typeDefsDo: aBlock.
	arguments do: [:each {TypeNode} | each typeDefsDo: aBlock]
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[TypeNode, Array[TypeNode]]}
	^#('root' 'arguments')
!
(reader addClassMethod: 'instance creation')
!
root: aTypeVariableNode {TypeNode} arguments: anArray {Array[TypeNode]} {^Instance}
	^self new initializeRoot: aTypeVariableNode arguments: anArray
!
