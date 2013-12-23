(reader defineClass: 'StringTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_asString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asString.
			self assert: (self valueIsKindOfString: res)]
!
