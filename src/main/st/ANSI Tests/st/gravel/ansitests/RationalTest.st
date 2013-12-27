(reader defineClass: 'RationalTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_denominator
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue denominator.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_numerator
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue numerator.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 1.
	aBlock value: 3 / 7
!
