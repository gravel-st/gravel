(reader defineClass: 'DurationTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^1 seconds
!
(reader addMethod: 'tests')
!
test_abs
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue abs.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_asSeconds
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSeconds.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_days
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue days.
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
test_hours
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue hours.
			self assert: (self valueIsKindOfInteger: res)]
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
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_minutes
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue minutes.
			self assert: (self valueIsKindOfInteger: res)]
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
			self assert: (self valueIsKindOfDuration: res)]
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
			self assert: (self valueIsKindOfDuration: res)]
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
test_seconds
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue seconds.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_slash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue / 3.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_times
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue * 3.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 1 milliseconds.
	aBlock value: 1 milliseconds + 100 days
!
