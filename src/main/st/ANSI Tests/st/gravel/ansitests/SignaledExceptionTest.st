(reader defineClass: 'SignaledExceptionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_isNested
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isNested.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_outer
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue outer.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_pass
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue pass]
!
(reader addMethod: 'tests')
!
test_resignalAs_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue resignalAs: self parameterReplacementException]
!
(reader addMethod: 'tests')
!
test_resume
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue resume]
!
(reader addMethod: 'tests')
!
test_resume_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue resume: self parameterResumptionValue]
!
(reader addMethod: 'tests')
!
test_retry
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue retry]
!
(reader addMethod: 'tests')
!
test_retryUsing_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue retryUsing: self parameterAlternativeBlock]
!
(reader addMethod: 'tests')
!
test_return
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue return]
!
(reader addMethod: 'tests')
!
test_return_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue return: self parameterReturnValue]
!
