(reader defineClass: 'MagnitudeTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_between_and_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue between: self parameterMax and: self parameterMin.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_less
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue < self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_less_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue <= self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_max_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue max: self parameterOperand.
			self assert: (self valueIsKindOfMagnitude: res)]
!
(reader addMethod: 'tests')
!
test_min_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue min: self parameterOperand.
			self assert: (self valueIsKindOfMagnitude: res)]
!
(reader addMethod: 'tests')
!
test_more
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue > self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_more_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue >= self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
