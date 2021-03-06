(reader defineClass: 'CharacterTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_asLowercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asLowercase.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_asString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asString.
			self assert: (self valueIsKindOfString: res)]
!
(reader addMethod: 'tests')
!
test_asUppercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asUppercase.
			self assert: (self valueIsKindOfCharacter: res)]
!
(reader addMethod: 'tests')
!
test_codePoint
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue codePoint.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue = self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isAlphaNumeric
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isAlphaNumeric.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isDigit
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isDigit.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isLetter
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isLetter.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isLowercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isLowercase.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isUppercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isUppercase.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	'abcde$_' do: aBlock
!
