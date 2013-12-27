(reader defineClass: 'ObjectClassTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Object
!
