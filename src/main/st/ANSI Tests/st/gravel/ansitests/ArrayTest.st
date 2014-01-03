(reader defineClass: 'ArrayTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_copy
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copy.
			self assert: (self valueIsKindOfArray: res).
			self assert: res = testValue.
			self assert: res ~~ testValue]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #(#a #b #c)
!
