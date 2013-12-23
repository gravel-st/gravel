(reader defineClass: 'ByteArrayFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_new_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new: self parameterCount.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_withAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue withAll: self parameterNewElements.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterElement1.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterElement1 with: self parameterElement2.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterElement1
						with: self parameterElement3
						with: self parameterElement2.
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterElement1
						with: self parameterElement3
						with: self parameterElement4
						with: self parameterElement2.
			self assert: (self valueIsKindOfByteArray: res)]
!
