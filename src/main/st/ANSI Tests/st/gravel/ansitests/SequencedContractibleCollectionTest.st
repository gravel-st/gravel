(reader defineClass: 'SequencedContractibleCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterIndex
	^2
!
(reader addMethod: 'tests')
!
test_removeAtIndex_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeAtIndex: self parameterIndex.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_removeFirst
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeFirst.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_removeLast
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue removeLast.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #(#a #b #c) asOrderedCollection
!
