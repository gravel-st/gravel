(reader defineClass: 'MessageNotUnderstoodTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_isResumable
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isResumable.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_message
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue message.
			self assert: (self valueIsKindOfFailedMessage: res)]
!
(reader addMethod: 'tests')
!
test_receiver
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue receiver.
			self assert: (self valueIsKindOfObject: res)]
!
