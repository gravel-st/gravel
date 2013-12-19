(reader defineClass: 'BottomTypeNode' superclass: 'st.gravel.support.compiler.ast.TypeNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitBottomTypeNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: 'Bottom'
!
(reader addMethod: 'As yet unclassified')
!
isBottomTypeNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
typeDefsDo: aBlock {[TypeNode, ^Any]} {^Self}
	
!
(reader addMethod: 'As yet unclassified')
!
| aTypeNode {TypeNode} {^TypeNode}
	^aTypeNode
!
