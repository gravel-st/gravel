(reader defineClass: 'SortedCollectionFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
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
						with: self parameterThirdElement
						with: self parameterSecondElement
						with: self parameterFirstElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_with_with_with_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						with: self parameterThirdElement
						with: self parameterFourthElement
						with: self parameterFirstElement
						with: self parameterSecondElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
