(reader defineClass: 'CollectionStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_contents
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue contents.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
