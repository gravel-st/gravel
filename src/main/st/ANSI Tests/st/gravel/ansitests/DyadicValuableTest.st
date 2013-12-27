(reader defineClass: 'DyadicValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterArgument1
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterArgument2
	^2
!
(reader addMethod: 'tests')
!
test_argumentCount
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue argumentCount.
			self assert: res = 2.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_value_value_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue value: self parameterArgument1 value: self parameterArgument2.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: [:a :b | a + b]
!
