(reader defineClass: 'NumberLiteralNode' superclass: 'st.gravel.support.compiler.ast.LiteralNode')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitNumberLiteralNode: self
!
(reader addMethod: 'As yet unclassified')
!
negated {^NumberLiteralNode}
	^self subclassResponsibility
!
