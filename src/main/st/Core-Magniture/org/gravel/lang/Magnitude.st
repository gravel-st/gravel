(reader defineClass: 'Magnitude' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.Comparable')
!
(reader addMethod: 'gravel')
!
< aMagnitude
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
asString
	^self printString
!
