(reader defineClass: 'WarningTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue defaultAction]
!
