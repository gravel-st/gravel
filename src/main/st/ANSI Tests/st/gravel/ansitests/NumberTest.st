(reader defineClass: 'NumberTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterFactor
	^10
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterOperation
	^[:e | e printString]
!
(reader addMethod: 'As yet unclassified')
!
parameterScale
	^4
!
(reader addMethod: 'As yet unclassified')
!
parameterStep
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterStop
	^3
!
(reader addMethod: 'tests')
!
test_abs
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue abs.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_asFloat
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asFloat.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_asFloatD
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asFloatD.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_asFloatE
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asFloatE.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_asFloatQ
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asFloatQ.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_asFraction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asFraction.
			self assert: (self valueIsKindOfRational: res)]
!
(reader addMethod: 'tests')
!
test_asInteger
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asInteger.
			self assert: (self valueIsKindOfInteger: res)]
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
test_backslash_backslash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue \\ self parameterOperand.
			self assert: res notNil]
!
(reader addMethod: 'tests')
!
test_ceiling
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ceiling.
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
test_floor
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue floor.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_fractionPart
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue fractionPart.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_integerPart
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue integerPart.
			self assert: res notNil]
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
test_minus
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue - self parameterOperand.
			self assert: res notNil]
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
test_negated
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue negated.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_negative
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue negative.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_plus
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue + self parameterOperand.
			self assert: res notNil]
!
(reader addMethod: 'tests')
!
test_positive
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue positive.
			self assert: (self valueIsKindOfBoolean: res)]
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
(reader addMethod: 'tests')
!
test_quo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue quo: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_raisedToInteger_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue raisedToInteger: self parameterOperand.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_raisedTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue raisedTo: self parameterOperand.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_reciprocal
	self valuesDo: 
			[:testValue |
			testValue = 0
				ifFalse: 
					[| res |
					res := testValue reciprocal.
					self assert: res notNil]]
!
(reader addMethod: 'tests')
!
test_rem_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue rem: self parameterOperand.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_rounded
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue rounded.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_roundTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue roundTo: self parameterFactor.
			self assert: res notNil]
!
(reader addMethod: 'tests')
!
test_sign
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sign.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_slash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue / self parameterOperand.
			self assert: res notNil]
!
(reader addMethod: 'tests')
!
test_slash_slash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue // self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_sqrt
	self valuesDo: 
			[:testValue |
			testValue positive
				ifTrue: 
					[| res |
					res := testValue sqrt.
					self assert: (self valueIsKindOfNumber: res)]]
!
(reader addMethod: 'tests')
!
test_squared
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue squared.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_strictlyPositive
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue strictlyPositive.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_times
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue * self parameterOperand.
			self assert: res notNil]
!
(reader addMethod: 'tests')
!
test_to_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue to: self parameterStop.
			self assert: (self valueIsKindOfInterval: res)]
!
(reader addMethod: 'tests')
!
test_to_by_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue to: self parameterStop by: self parameterStep.
			self assert: (self valueIsKindOfInterval: res)]
!
(reader addMethod: 'tests')
!
test_to_by_do_
	self valuesDo: 
			[:testValue |
			testValue to: self parameterStop
				by: self parameterStep
				do: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_to_do_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue to: self parameterStop do: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_truncated
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue truncated.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_truncateTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue truncateTo: self parameterFactor.
			self assert: res notNil]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: -1.
	aBlock value: 0.
	aBlock value: 1.
	aBlock value: 23489713298471982374981324.
	aBlock value: '3.0'.
	aBlock value: 721s.
	aBlock value: 3 / 7
!
