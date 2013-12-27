(reader defineClass: 'ExceptionClassTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterException
	^Exception new
!
(reader addMethod: 'tests')
!
test_handles_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue handles: self parameterException.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new.
			self assert: (self valueIsKindOfException: res)]
!
(reader addMethod: 'tests')
!
test_signal
	self valuesDo: 
			[:testValue |
			| reachedHandler |
			reachedHandler := false.
			[testValue signal] on: testValue
				do: 
					[:ex |
					reachedHandler := true.
					self assert: ex class = testValue].
			self assert: reachedHandler]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Error
!
