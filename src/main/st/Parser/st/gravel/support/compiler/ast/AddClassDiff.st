(reader defineClass: 'AddClassDiff' superclass: 'st.gravel.support.compiler.ast.NewClassDiff')
!
(reader addInstVar: 'isStatic' type: 'Boolean')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitAddClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	isStatic := true
!
(reader addMethod: 'initialize-release')
!
initialize {^Self}
	super initialize.
	isStatic := self isStaticDefault
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^isStatic
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^classNode isNil not and: [classNode isNilClass]
!
