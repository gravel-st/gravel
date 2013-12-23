(reader defineClass: 'NilTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_printString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printString.
			self assert: (self valueIsKindOfReadableString: res)]
!
