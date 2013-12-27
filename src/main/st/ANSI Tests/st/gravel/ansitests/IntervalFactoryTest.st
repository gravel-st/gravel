(reader defineClass: 'IntervalFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterStart
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterStep
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterStop
	^7
!
(reader addMethod: 'tests')
!
test_from_to_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue from: self parameterStart to: self parameterStop.
			self assert: (self valueIsKindOfInterval: res)]
!
(reader addMethod: 'tests')
!
test_from_to_by_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						from: self parameterStart
						to: self parameterStop
						by: self parameterStep.
			self assert: (self valueIsKindOfInterval: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Interval
!
