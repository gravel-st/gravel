(reader defineClass: 'IntegerTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_allMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue allMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_anyMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue anyMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_asScaledDecimal_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asScaledDecimal: self parameterScale.
			self assert: (self valueIsKindOfScaledDecimal: res)]
!
(reader addMethod: 'tests')
!
test_bitAnd_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAnd: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitAt_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAt: self parameterIndex.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitAt_put_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAt: self parameterIndex put: self parameterValue.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitOr_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitOr: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitShift_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitShift: self parameterShift.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitXor_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitXor: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_even
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue even.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_factorial
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue factorial.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_gcd_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue gcd: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_highBit
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue highBit.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_lcm_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue lcm: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_noMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue noMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_odd
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue odd.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_printOn_base_showRadix_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						printOn: self parameterFlag
						base: self parameterBase
						showRadix: self parameterOutput]
!
(reader addMethod: 'tests')
!
test_printStringRadix_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printStringRadix: self parameterBase.
			self assert: (self valueIsKindOfReadableString: res)]
!
