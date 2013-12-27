(reader defineClass: 'WarningTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue defaultAction]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Warning new
!
(reader addClassMethod: 'testing')
!
isAbstract
	^true
!
