(reader defineClass: 'RemoveMethodDiff' superclass: 'org.gravel.parser.MethodDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitRemoveMethodDiff: self
!
