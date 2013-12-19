(reader defineClass: 'Magnitude' superclass: 'org.gravel.lang.Object')
!
(reader addSimpleTrait: 'org.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'org.gravel.lang.Comparable class')
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
