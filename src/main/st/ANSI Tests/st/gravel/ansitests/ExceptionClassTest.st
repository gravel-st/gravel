(reader defineClass: 'ExceptionClassTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_handles_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue handles: self parameterException.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfException: res)]
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
