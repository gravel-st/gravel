(reader defineClass: 'ExceptionSignalerTest' superclass: 'st.gravel.ansitests.ANSITest')
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
(reader addMethod: 'tests')
!
test_signal_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue signal: self parameterSignalerText.
			self assert: (self valueIsKindOfObject: res)]
!
