(reader defineClass: 'ExceptionSignalerTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterSignalerText
	^'fromage'
!
(reader addMethod: 'tests')
!
test_signal
	self
		valuesDo: [:testValue | 
			[testValue signal.
			self assert: false] on: testValue do: [:ex | ]]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Exception
!
