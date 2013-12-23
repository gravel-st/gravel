(reader defineClass: 'ReadStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_next_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue next: self parameterAmount.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_upTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue upTo: self parameterAnObject.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
