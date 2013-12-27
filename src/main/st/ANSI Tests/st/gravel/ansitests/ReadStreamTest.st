(reader defineClass: 'ReadStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterAmount
	^3
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
	aBlock value: (ReadStream on: 'abc').
	aBlock value: (ReadStream on: #(#foo #bar #baz))
!
