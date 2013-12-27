(reader defineClass: 'ValuableTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterArgumentArray
	^#()
!
(reader addMethod: 'tests')
!
test_argumentCount
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue argumentCount.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_valueWithArguments_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue valueWithArguments: self parameterArgumentArray.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: []
!
