(reader defineClass: 'RationalTest' superclass: 'st.gravel.ansitests.ANSITest')
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
