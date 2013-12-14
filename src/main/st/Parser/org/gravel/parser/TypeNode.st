(reader defineClass: 'TypeNode' superclass: 'org.gravel.parser.Node')
!
(reader addMethod: 'comparing')
!
= anObject {Object} {^Bool}
	^self class = anObject class
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitTypeNode: self
!
(reader addMethod: 'As yet unclassified')
!
asClassTypeNode {^ClassTypeNode}
	^ClassTypeNode node: self
!
(reader addMethod: 'As yet unclassified')
!
asDefNode {^TypeDefNode}
	^TypeDefNode node: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isNilType {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isOptional {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
mandatory {^TypeNode}
	^self
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	self innerSourceOn: aStream
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
| aTypeNode {TypeNode} {^TypeNode}
	self = aTypeNode ifTrue: [^self].
	^TypeOrNode left: self right: aTypeNode
!
