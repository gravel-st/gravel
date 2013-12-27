(reader defineClass: 'FloatTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^'0.2'
!
(reader addMethod: 'tests')
!
test_arcCos
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue arcCos.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_arcSin
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue arcSin.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_arcTan
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue arcTan.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_cos
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue cos.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_degreesToRadians
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue degreesToRadians.
			self assert: (self valueIsKindOfFloat: res)]
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
test_exp
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue exp.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_floorLog_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue floorLog: self parameterOperand.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_ln
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ln.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_log_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue log: self parameterOperand.
			self assert: (self valueIsKindOfFloat: res)]
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
test_radiansToDegrees
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue radiansToDegrees.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_sin
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sin.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'tests')
!
test_tan
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue tan.
			self assert: (self valueIsKindOfFloat: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: '0.1'
!
