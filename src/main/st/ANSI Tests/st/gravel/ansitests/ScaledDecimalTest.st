(reader defineClass: 'ScaledDecimalTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_scale
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue scale.
			self assert: (self valueIsKindOfInteger: res)]
!
