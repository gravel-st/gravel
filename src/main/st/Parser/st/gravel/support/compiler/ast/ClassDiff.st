(reader defineClass: 'ClassDiff' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'visitor')
!
accept: visitor {DiffVisitor} {^DiffVisitor}
	^visitor visitClassDiff: self
!
(reader addMethod: 'As yet unclassified')
!
beStatic {^Self}
	self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
isEmpty {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isNewClassDiff {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
isStatic {^Bool}
	^self isStaticDefault
!
(reader addMethod: 'initialize-release')
!
isStaticDefault {^Bool}
	^false
!
(reader addMethod: 'As yet unclassified')
!
reference {^Reference | Nil}
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
superclassReference {^Reference | Nil}
	^self subclassResponsibility
!
