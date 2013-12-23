(reader defineClass: 'NiladicValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
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
test_value
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue value.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_whileFalse
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue whileFalse]
!
(reader addMethod: 'tests')
!
test_whileFalse_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue whileFalse: self parameterIterationBlock]
!
(reader addMethod: 'tests')
!
test_whileTrue
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue whileTrue]
!
(reader addMethod: 'tests')
!
test_whileTrue_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue whileTrue: self parameterIterationBlock]
!
