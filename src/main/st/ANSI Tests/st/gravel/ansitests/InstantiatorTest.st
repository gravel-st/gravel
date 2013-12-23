(reader defineClass: 'InstantiatorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfObject: res)]
!
