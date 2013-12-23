(reader defineClass: 'FractionFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_numerator_denominator_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue numerator: self parameterBottom denominator: self parameterTop.
			self assert: (self valueIsKindOfFraction: res).
			self assert: (self valueIsKindOfInteger: res)]
!
