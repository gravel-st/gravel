(reader defineClass: 'NilLiteralNode' superclass: 'st.gravel.support.compiler.ast.LiteralNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNilLiteralNode: self
!
(reader addMethod: 'As yet unclassified')
!
innerSourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPutAll: 'nil'
!
(reader addMethod: 'As yet unclassified')
!
isNilLiteralNode {^Bool}
	^true
!
(reader addMethod: 'accessing')
!
value {^Nil}
	^nil
!
