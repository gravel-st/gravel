(reader defineClass: 'ExceptionSetTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , self parameterAnotherException.
			self assert: (self valueIsKindOfExceptionSet: res)]
!
