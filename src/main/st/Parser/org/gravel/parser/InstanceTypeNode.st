(reader defineClass: 'InstanceTypeNode' superclass: 'org.gravel.parser.TypeNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitInstanceTypeNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: 'Instance'
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
