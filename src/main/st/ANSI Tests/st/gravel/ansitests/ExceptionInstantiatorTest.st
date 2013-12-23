(reader defineClass: 'ExceptionInstantiatorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfExceptionBuilder: res)]
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
