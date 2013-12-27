(reader defineClass: 'ZeroDivideTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_dividend
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dividend.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_isResumable
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isResumable.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	[1 / 0] on: ZeroDivide do: [:ex | aBlock value: ex]
!
