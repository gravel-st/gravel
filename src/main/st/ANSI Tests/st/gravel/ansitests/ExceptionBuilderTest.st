(reader defineClass: 'ExceptionBuilderTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_messageText_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue messageText: self parameterSignalerText.
			self assert: (self valueIsKindOfExceptionBuilder: res)]
!
