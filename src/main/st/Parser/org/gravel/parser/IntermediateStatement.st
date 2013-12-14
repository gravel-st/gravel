(reader defineClass: 'IntermediateStatement' superclass: 'org.gravel.parser.Statement')
!
(reader addMethod: 'visitor')
!
accept: visitor {NodeVisitor[X def]} {^X}
	^visitor visitIntermediateStatement: self
!
(reader addMethod: 'As yet unclassified')
!
unoptimized {^Statement}
	^self subclassResponsibility
!
