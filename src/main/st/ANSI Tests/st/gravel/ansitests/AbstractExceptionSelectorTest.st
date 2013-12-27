(reader defineClass: 'AbstractExceptionSelectorTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterAnotherException
	^Error
!
(reader addMethod: 'As yet unclassified')
!
parameterException
	^Error new
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Error.
	aBlock value: ZeroDivide , MessageNotUnderstood
!
