(reader defineClass: 'InstanceCreationNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addInstVar: 'reference' type: 'AbsoluteReference')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitInstanceCreationNode: self
!
(reader addMethod: 'initialize-release')
!
initializeReference: anAbsoluteReference {AbsoluteReference} {^Self}
	reference := anAbsoluteReference.
	self initialize
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream
		nextPutAll: '{';
		nextPutAll: reference printString;
		nextPutAll: ' basicNew}'
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
reference {^AbsoluteReference}
	^reference
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^nil
!
(reader addClassMethod: 'instance creation')
!
reference: anAbsoluteReference {AbsoluteReference} {^InstanceCreationNode}
	^self new initializeReference: anAbsoluteReference
!
