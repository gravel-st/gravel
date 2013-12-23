(reader defineClass: 'MessageNotUnderstoodSelectorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_handles_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue handles: self parameterException.
			self assert: (self valueIsKindOfBoolean: res)]
!
