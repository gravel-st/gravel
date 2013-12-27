(reader defineClass: 'ExceptionDescriptionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_defaultAction
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue defaultAction.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_description
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue description.
			self assert: (self valueIsKindOfReadableString: res)]
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
(reader addMethod: 'tests')
!
test_messageText
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue messageText.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_tag
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue tag.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Notification new
!
