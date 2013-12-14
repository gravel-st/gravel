(reader defineClass: 'WrapJavaclassDiff' superclass: 'org.gravel.parser.NewClassDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitWrapJavaclassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
applyOnSystemNode: aSystemNode {SystemNode} {^SystemNode}
	^aSystemNode withClassDescriptionNode: classNode
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^true
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^true
!
