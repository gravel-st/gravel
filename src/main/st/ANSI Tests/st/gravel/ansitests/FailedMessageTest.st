(reader defineClass: 'FailedMessageTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	[1 zork] on: MessageNotUnderstood do: [:ex | aBlock value: ex parameter]
!
