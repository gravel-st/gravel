(reader defineClass: 'ZeroDivideFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterArgument
	^3
!
(reader addMethod: 'tests')
!
test_dividend_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dividend: self parameterArgument.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_signal
	self
		valuesDo: [:testValue | 
			[testValue signal.
			self deny: true] on: ZeroDivide do: [:ex | ]]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: ZeroDivide
!
