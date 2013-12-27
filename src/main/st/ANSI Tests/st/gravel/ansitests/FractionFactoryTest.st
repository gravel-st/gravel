(reader defineClass: 'FractionFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterBottom
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterTop
	^2
!
(reader addMethod: 'tests')
!
test_numerator_denominator_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue numerator: self parameterTop denominator: self parameterBottom.
			self assert: (self valueIsKindOfFraction: res) | (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Fraction
!
