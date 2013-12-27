(reader defineClass: 'ExceptionSelectorTest' superclass: 'st.gravel.ansitests.AbstractExceptionSelectorTest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , self parameterAnotherException.
			self assert: (self valueIsKindOfExceptionSet: res)]
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
