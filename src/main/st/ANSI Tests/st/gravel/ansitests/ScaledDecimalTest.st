(reader defineClass: 'ScaledDecimalTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_scale
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue scale.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 2.01s
!
