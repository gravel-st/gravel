(reader defineClass: 'AddInstVarDiff' superclass: 'org.gravel.parser.InstVarDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitAddInstVarDiff: self
!
