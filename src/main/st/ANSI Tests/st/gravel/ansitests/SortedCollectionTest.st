(reader defineClass: 'SortedCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^#(#d #e #f)
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElement
	^#zuurkool
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElements
	^#(#d #e #f)
!
(reader addMethod: 'As yet unclassified')
!
parameterStart
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterStop
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElement
	^#b
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElements
	^#(#a)
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
						copyReplaceFrom: self parameterStart
						to: self parameterStop
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
			res := testValue sortBlock: [:a :b | a printString < b printString].
			self assert: (self valueIsKindOfSortedCollection: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #(#c #b #a) asSortedCollection
!
