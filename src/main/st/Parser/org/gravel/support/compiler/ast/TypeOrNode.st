(reader defineClass: 'TypeOrNode' superclass: 'org.gravel.support.compiler.ast.TypeNode')
!
(reader addInstVar: 'left')
!
(reader addInstVar: 'right')
!
(reader addMethod: 'comparing')
!
= anObject {Obj} {^Bool}
	^super = anObject and: 
			[(left = anObject left and: [right = anObject right])
				or: [right = anObject left and: [left = anObject right]]]
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTypeOrNode: self
!
(reader addMethod: 'comparing')
!
hash {^Int}
	^(super hash bitXor: left hash) bitXor: right hash
!
(reader addMethod: 'initialize-release')
!
initializeLeft: aTypeVariableNode {TypeNode} right: aTypeVariableNode2 {TypeNode} {^Self}
	left := aTypeVariableNode.
	right := aTypeVariableNode2.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	left sourceOn: aStream.
	aStream nextPutAll: ' | '.
	right sourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
isOptional {^Bool}
	^left isNilType or: [left isOptional or: [right isNilType or: [right isOptional]]]
!
(reader addMethod: 'accessing')
!
left {^TypeNode}
	^left
!
(reader addMethod: 'As yet unclassified')
!
mandatory {^TypeNode}
	left isNilType ifTrue: [^right].
	right isNilType ifTrue: [^left].
	^self
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^left referencesSelfOrInstanceType or: [right referencesSelfOrInstanceType]
!
(reader addMethod: 'accessing')
!
right {^TypeNode}
	^right
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	left typeDefsDo: aBlock.
	right typeDefsDo: aBlock
!
(reader addMethod: 'As yet unclassified')
!
| aTypeNode {TypeNode} {^TypeNode}
	left = aTypeNode ifTrue: [^self].
	right = aTypeNode ifTrue: [^self].
	^super | aTypeNode
!
(reader addClassMethod: 'pegon')
!
instVarTypes {^[TypeNode, TypeNode]}
	^#('left' 'right')
!
(reader addClassMethod: 'instance creation')
!
left: aTypeVariableNode {TypeNode} right: aTypeVariableNode2 {TypeNode} {^TypeNode}
	aTypeVariableNode isNil ifTrue: [^aTypeVariableNode2].
	^self new initializeLeft: aTypeVariableNode right: aTypeVariableNode2
!
