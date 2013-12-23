(reader defineClass: 'FailedMessageTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_arguments
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue arguments.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_selector
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue selector.
			self assert: (self valueIsKindOfSelector: res)]
!
