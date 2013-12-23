(reader defineClass: 'CharacterFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_codePoint_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue codePoint: self parameterInteger.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_cr
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue cr.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_lf
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue lf.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_space
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue space.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_tab
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue tab.
			self assert: (self valueIsKindOfCharacter: res)]
!
