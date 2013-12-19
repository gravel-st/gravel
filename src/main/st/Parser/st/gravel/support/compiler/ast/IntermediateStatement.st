(reader defineClass: 'IntermediateStatement' superclass: 'st.gravel.support.compiler.ast.Statement')
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
