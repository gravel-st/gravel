(reader defineClass: 'LiteralNode' superclass: 'st.gravel.support.compiler.ast.Expression')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitLiteralNode: self
!
(reader addMethod: 'As yet unclassified')
!
needsBrackets {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
nodesDo: aBlock {[Node, ^Object]}
	
!
(reader addMethod: 'accessing')
!
precedence {^Int}
	^0
!
(reader addMethod: 'accessing')
!
value {^Object}
	^self subclassResponsibility
!
