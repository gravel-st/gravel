(reader defineClass: 'NotificationTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue defaultAction.
			self assert: (self valueIsKindOfNil: res)]
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
