(reader defineClass: 'SortedCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_add_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue add: self parameterNewElement]
!
(reader addMethod: 'tests')
!
test_asSortedCollection
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asSortedCollection.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue collect: self parameterTransformer.
			self assert: (self valueIsKindOfSequencedCollection: res)]
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , self parameterOperand.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceAll_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplaceAll: self parameterTargetElements
						with: self parameterReplacementElements.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceFrom_to_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						copyReplaceFrom: self parameterStop
						to: self parameterStart
						withObject: self parameterReplacementElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceFrom_to_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						copyReplaceFrom: self parameterStart
						to: self parameterStop
						with: self parameterReplacementElements.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplacing_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplacing: self parameterTargetElement
						withObject: self parameterReplacementElement.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'tests')
!
test_reverse
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reverse.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_sortBlock
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sortBlock.
			self assert: (self valueIsKindOfDyadicValuable: res)]
!
(reader addMethod: 'tests')
!
test_sortBlock_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue sortBlock: self parameterDiscriminator.
			self assert: (self valueIsKindOfSortedCollection: res)]
!
