(reader defineClass: 'ErrorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue defaultAction]
!
(reader addMethod: 'tests')
!
test_isResumable
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isResumable.
			self assert: (self valueIsKindOfBoolean: res)]
!
