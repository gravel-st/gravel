(reader defineClass: 'HolderDeclarationNode' superclass: 'st.gravel.support.compiler.ast.VariableDeclarationNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitHolderDeclarationNode: self
!
(reader addMethod: 'As yet unclassified')
!
asVariableNode {^Expression}
	^ReadHolderNode varName: name
!
(reader addMethod: 'testing')
!
isHolderDeclarationNode {^Bool}
	^true
!
(reader addMethod: 'As yet unclassified')
!
sourceOn: aStream {WStream[Char]} {^Self}
	aStream nextPut: $[.
	super sourceOn: aStream.
	aStream nextPut: $]
!
