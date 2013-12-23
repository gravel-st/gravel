(reader defineClass: 'ReadableStringTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_asLowercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asLowercase.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_asString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asString.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_asSymbol
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSymbol.
			self assert: (self valueIsKindOfSymbol: res)]
!
(reader addMethod: 'tests')
!
test_asUppercase
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asUppercase.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , self parameterOperand.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceAll_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplaceAll: self parameterReplacementElements
						with: self parameterTargetElements.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceFrom_to_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						copyReplaceFrom: self parameterStart
						to: self parameterStop
						with: self parameterReplacementElements.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_copyReplacing_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplacing: self parameterReplacementElement
						withObject: self parameterTargetElement.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_copyWith_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyWith: self parameterNewElement.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_less
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue < self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_less_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue <= self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_more
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue > self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_more_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue >= self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_sameAs_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sameAs: self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_subStrings_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue subStrings: self parameterSeparators.
			self assert: (self valueIsKindOfArray: res)]
!
