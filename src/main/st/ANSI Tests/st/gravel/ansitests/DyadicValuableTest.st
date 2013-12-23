(reader defineClass: 'DyadicValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
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
test_value_value_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue value: self parameterArgument1 value: self parameterArgument2.
			self assert: (self valueIsKindOfANY: res)]
!
