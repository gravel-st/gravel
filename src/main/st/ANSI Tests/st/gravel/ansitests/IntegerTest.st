(reader defineClass: 'IntegerTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterBase
	^16
!
(reader addMethod: 'As yet unclassified')
!
parameterIndex
	^23
!
(reader addMethod: 'As yet unclassified')
!
parameterMask
	^170
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^7
!
(reader addMethod: 'As yet unclassified')
!
parameterScale
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterShift
	^-4
!
(reader addMethod: 'As yet unclassified')
!
parameterValue
	^1
!
(reader addMethod: 'tests')
!
test_allMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue allMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_anyMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue anyMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_asScaledDecimal_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asScaledDecimal: self parameterScale.
			self assert: (self valueIsKindOfScaledDecimal: res)]
!
(reader addMethod: 'tests')
!
test_bitAnd_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAnd: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitAt_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAt: self parameterIndex.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitAt_put_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitAt: self parameterIndex put: self parameterValue.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitOr_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitOr: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitShift_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitShift: self parameterShift.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_bitShift_2
	self assert: (65536 bitShift: -16) = 1.
	self assert: (65537 bitShift: -16) = 1.
	self assert: (65532 bitShift: -16) = 0
!
(reader addMethod: 'tests')
!
test_bitXor_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue bitXor: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_even
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue even.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_factorial
	| res |
	res := 10 factorial.
	self assert: (self valueIsKindOfInteger: res)
!
(reader addMethod: 'tests')
!
test_gcd_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue gcd: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_highBit
	self valuesDo: 
			[:testValue |
			testValue positive
				ifTrue: 
					[| res |
					res := testValue highBit.
					self assert: (self valueIsKindOfInteger: res)]]
!
(reader addMethod: 'tests')
!
test_highBit0
	self assert: 0 highBit = 0
!
(reader addMethod: 'tests')
!
test_highBit2
	self assert: 2 highBit = 2
!
(reader addMethod: 'tests')
!
test_highBit536870911
	self assert: 536870911 highBit = 29
!
(reader addMethod: 'tests')
!
test_highBit536870912
	self assert: 536870912 highBit = 30
!
(reader addMethod: 'tests')
!
test_highBit53687091200
	self assert: 53687091200 highBit = 36
!
(reader addMethod: 'tests')
!
test_lcm_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue lcm: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_noMask_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue noMask: self parameterMask.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_odd
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue odd.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_printOn_base_showRadix_
	self valuesDo: 
			[:testValue |
			testValue
				printOn: (WriteStream on: String new)
				base: 16
				showRadix: true]
!
(reader addMethod: 'tests')
!
test_printStringRadix_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printStringRadix: self parameterBase.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 1.
	aBlock value: -1.
	aBlock value: 3485792834759872345907.
	aBlock value: 1234324.
	aBlock value: -48592837213134123312
!
