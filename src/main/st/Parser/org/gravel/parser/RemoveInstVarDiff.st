(reader defineClass: 'RemoveInstVarDiff' superclass: 'org.gravel.parser.InstVarDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitRemoveInstVarDiff: self
!
