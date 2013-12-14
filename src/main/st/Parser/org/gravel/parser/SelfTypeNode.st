(reader defineClass: 'SelfTypeNode' superclass: 'org.gravel.parser.TypeNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitSelfTypeNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: 'Self'
!
(reader addMethod: 'As yet unclassified')
!
isSelfTypeNode {^Bool}
	^true
!
(reader addMethod: 'testing')
!
referencesSelfOrInstanceType {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	
!
