(reader defineClass: 'PuttableStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_cr
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue cr]
!
(reader addMethod: 'tests')
!
test_flush
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue flush]
!
(reader addMethod: 'tests')
!
test_nextPutAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue nextPutAll: self parameterACollection]
!
(reader addMethod: 'tests')
!
test_nextPut_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue nextPut: self parameterAnObject]
!
(reader addMethod: 'tests')
!
test_space
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue space]
!
(reader addMethod: 'tests')
!
test_tab
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue tab]
!
