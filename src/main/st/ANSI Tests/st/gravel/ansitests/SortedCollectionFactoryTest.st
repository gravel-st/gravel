(reader defineClass: 'SortedCollectionFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterFirstElement
	^#a
!
(reader addMethod: 'As yet unclassified')
!
parameterFourthElement
	^#d
!
(reader addMethod: 'As yet unclassified')
!
parameterNewElements
	^#(#a #b #c)
!
(reader addMethod: 'As yet unclassified')
!
parameterSecondElement
	^#b
!
(reader addMethod: 'As yet unclassified')
!
parameterThirdElement
	^#c
!
(reader addMethod: 'tests')
!
test_new
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new]
!
(reader addMethod: 'tests')
!
test_new_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue new: self parameterCount.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_sortBlock_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sortBlock: self parameterSortBlock.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_withAll_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue withAll: self parameterNewElements.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterFirstElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterFirstElement with: self parameterSecondElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterFirstElement
						with: self parameterSecondElement
						with: self parameterThirdElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterFirstElement
						with: self parameterSecondElement
						with: self parameterThirdElement
						with: self parameterFourthElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: SortedCollection
!
