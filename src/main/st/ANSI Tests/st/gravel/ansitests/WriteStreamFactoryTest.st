(reader defineClass: 'WriteStreamFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterACollection.
			self assert: (self valueIsKindOfWriteStream: res)]
!
