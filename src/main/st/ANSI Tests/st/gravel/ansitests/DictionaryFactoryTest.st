(reader defineClass: 'DictionaryFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfDictionary: res)]
!
(reader addMethod: 'tests')
!
test_new_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new: self parameterCount.
			self assert: (self valueIsKindOfDictionary: res)]
!
(reader addMethod: 'tests')
!
test_withAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue withAll: self parameterNewElements.
			self assert: (self valueIsKindOfDictionary: res)]
!
