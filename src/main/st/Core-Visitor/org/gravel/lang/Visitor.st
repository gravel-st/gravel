(reader defineClass: 'Visitor' superclass: 'org.gravel.lang.Object')
!
(reader addMethod: 'visiting')
!
visit: anObject
	^anObject accept: self
!
(reader addClassMethod: 'visiting')
!
visit: anObject
	^self new visit: anObject
!
