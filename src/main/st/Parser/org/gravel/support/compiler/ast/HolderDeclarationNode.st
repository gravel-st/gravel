(reader defineClass: 'HolderDeclarationNode' superclass: 'org.gravel.support.compiler.ast.VariableDeclarationNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitHolderDeclarationNode: self
!
(reader addMethod: 'testing')
!
isHolderDeclarationNode {^Bool}
	^true
!
