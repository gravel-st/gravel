(reader defineClass: 'FileStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_contents
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue contents.
			self assert: (self valueIsKindOfString: res)]
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (EncodedStream on: (ReadStream on: #[102 114 111 109 97 103 101])
				encodedBy: UTF8StreamEncoder new)
!
(reader addClassMethod: 'testing')
!
isAbstract
	^true
!
