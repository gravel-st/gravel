(reader defineClass: 'BlockTypeNode' superclass: 'org.gravel.support.compiler.ast.TypeNode')
!
(reader addInstVar: 'arguments')
!
(reader addInstVar: 'returnType')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject
		and: [arguments = anObject arguments and: [returnType = anObject returnType]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBlockTypeNode: self
!
(reader addMethod: 'accessing')
!
arguments {^Array[TypeNode]}
	^arguments
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: arguments hash) bitXor: returnType hash
!
(reader addMethod: 'initialize-release')
!
initializeArguments: anArray {Array[TypeNode]} returnType: anUndefinedObject {TypeNode | Nil} {^Self}
	arguments := anArray.
	returnType := anUndefinedObject.
	self initialize
!
(reader addMethod: 'accessing')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $[.
	arguments do: [:arg {TypeNode} | arg sourceOn: aStream]
		separatedBy: [aStream nextPutAll: ', '].
	returnType isNil
		ifFalse: 
			[arguments isEmpty ifFalse: [aStream nextPutAll: ', '].
			aStream nextPut: $^.
			returnType sourceOn: aStream].
	aStream nextPut: $]
!
(reader addMethod: 'As yet unclassified')
!
isBlockTypeNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
numArgs {^Int}
	^arguments size
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^returnType referencesSelfOrInstanceType
		or: [arguments anySatisfy: [:type {TypeNode} | type referencesSelfOrInstanceType]]
!
(reader addMethod: 'accessing')
!
returnType {^TypeNode | Nil}
	^returnType
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	arguments do: [:each {TypeNode} | each typeDefsDo: aBlock].
	returnType isNil ifFalse: [returnType typeDefsDo: aBlock]
!
(reader addMethod: 'As yet unclassified')
!
withReturnType: aTypeNode {TypeNode} {^BlockTypeNode}
	^self class arguments: arguments returnType: aTypeNode
!
(reader addClassMethod: 'instance creation')
!
arguments: anArray {Array[TypeNode]} returnType: anUndefinedObject {TypeNode | Nil} {^Instance}
	^self new initializeArguments: anArray returnType: anUndefinedObject
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[Array[TypeNode], TypeNode | Nil]}
	^#('arguments' 'returnType')
!
