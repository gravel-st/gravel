(reader defineClass: 'AddClassDiff' superclass: 'org.gravel.parser.NewClassDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitAddClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode withClassDescriptionNode: classNode
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^classNode isNil not and: [classNode isNilClass]
!
(reader addMethod: 'As yet unclassified')
!
withDiff: aDiff {Diff} {^Diff}
	^aDiff withAddClassDiff: self
!
