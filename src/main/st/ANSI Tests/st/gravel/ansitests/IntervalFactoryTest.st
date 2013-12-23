(reader defineClass: 'IntervalFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_from_to_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue from: self parameterStart to: self parameterStop.
			self assert: (self valueIsKindOfInterval: res)]
!
(reader addMethod: 'tests')
!
test_from_to_by_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						from: self parameterStart
						to: self parameterStop
						by: self parameterStep.
			self assert: (self valueIsKindOfInterval: res)]
!
