(reader defineClass: 'ExceptionBuilderTest' superclass: 'st.gravel.ansitests.ANSITest')
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
test_messageText_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue messageText: self parameterSignalerText.
			self assert: (self valueIsKindOfExceptionBuilder: res).
			self assert: res messageText = self parameterSignalerText]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Exception new
!
