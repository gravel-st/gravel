(reader defineClass: 'SequencedStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterAmount
	^3
!
(reader addMethod: 'tests')
!
test_close
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue close]
!
(reader addMethod: 'tests')
!
test_contents
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue contents.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_isEmpty
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isEmpty.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_position
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue position.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_position_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue position: self parameterAmount]
!
(reader addMethod: 'tests')
!
test_reset
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reset]
!
(reader addMethod: 'tests')
!
test_setToEnd
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue setToEnd]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (ReadStream on: 'fromage')
!
