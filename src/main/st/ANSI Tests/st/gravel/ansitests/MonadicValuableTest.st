(reader defineClass: 'MonadicValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_argumentCount
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue argumentCount.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_value_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue value: self parameterArgument.
			self assert: (self valueIsKindOfANY: res)]
!
