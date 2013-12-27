(reader defineClass: 'ReadFileStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterAmount
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterAnObject
	^$b
!
(reader addMethod: 'tests')
!
test_next_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue next: self parameterAmount.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_upTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue upTo: self parameterAnObject.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 'abc' readStream
!
