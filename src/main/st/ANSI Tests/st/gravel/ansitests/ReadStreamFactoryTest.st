(reader defineClass: 'ReadStreamFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_on_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue on: self parameterACollection.
			self assert: (self valueIsKindOfReadStream: res)]
!
