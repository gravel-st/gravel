(reader defineClass: 'ZeroDivideFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_dividend_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dividend: self parameterArgument.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_signal
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue signal.
			self assert: (self valueIsKindOfObject: res)]
!
