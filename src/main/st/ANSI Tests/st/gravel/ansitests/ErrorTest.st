(reader defineClass: 'ErrorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| uheReached |
			uheReached := false.
			[testValue defaultAction] on: UnhandledException do: [:uhe | uheReached := true].
			self assert: uheReached]
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
	aBlock value: Error new
!
