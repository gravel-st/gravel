(reader defineClass: 'ZeroDivideTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_dividend
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dividend.
			self assert: (self valueIsKindOfNumber: res)]
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
