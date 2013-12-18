(reader defineClass: 'WrapJavaclassDiff' superclass: 'org.gravel.support.compiler.ast.NewClassDiff')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitWrapJavaclassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	
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
