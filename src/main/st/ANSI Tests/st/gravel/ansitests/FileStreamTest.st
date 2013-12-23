(reader defineClass: 'FileStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_contents
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue contents.
			self assert: (self valueIsKindOfString: res).
			self assert: (self valueIsKindOfByteArray: res)]
!
(reader addMethod: 'tests')
!
test_externalType
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue externalType.
			self assert: (self valueIsKindOfSymbol: res)]
!
(reader addMethod: 'tests')
!
test_isBinary
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isBinary.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isText
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isText.
			self assert: (self valueIsKindOfBoolean: res)]
!
