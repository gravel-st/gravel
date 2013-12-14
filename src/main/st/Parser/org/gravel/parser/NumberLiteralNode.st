(reader defineClass: 'NumberLiteralNode' superclass: 'org.gravel.parser.LiteralNode')
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
