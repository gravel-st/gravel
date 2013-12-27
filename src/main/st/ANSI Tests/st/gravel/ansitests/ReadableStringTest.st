(reader defineClass: 'ReadableStringTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterNewElement
	^$d
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^'def'
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElement
	^$c
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElements
	^'def'
!
(reader addMethod: 'As yet unclassified')
!
parameterSeparators
	self halt
!
(reader addMethod: 'As yet unclassified')
!
parameterStart
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterStop
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElement
	^$b
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElements
	^'c'
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
			res := testValue copyReplaceAll: self parameterTargetElements
						with: self parameterReplacementElements.
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
			res := testValue copyReplacing: self parameterTargetElement
						withObject: self parameterReplacementElement.
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
	| res |
	res := 'ab,cd|ef' subStrings: ',|'.
	self assert: res asArray = #('ab' 'cd' 'ef')
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 'abc'.
	aBlock value: #abc
!
