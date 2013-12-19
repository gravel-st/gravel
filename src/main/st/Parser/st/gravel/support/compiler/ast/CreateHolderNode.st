(reader defineClass: 'CreateHolderNode' superclass: 'st.gravel.support.compiler.ast.IntermediateNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitCreateHolderNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: '{ValueHolder new}'
!
(reader addMethod: 'As yet unclassified')
!
isCreateHolderNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Expression}
	^nil
!
