(reader defineClass: 'SequencedReadableCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterExceptionHandler
	^[#ex]
!
(reader addMethod: 'As yet unclassified')
!
parameterIndex
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterNewElement
	^$z
!
(reader addMethod: 'As yet unclassified')
!
parameterOldElement
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterOperation
	^[:e | e printString]
!
(reader addMethod: 'As yet unclassified')
!
parameterOtherCollection: anInteger
	^Array new: anInteger withAll: #fromage
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElement
	^$c
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElements
	^#(#kaas #aap)
!
(reader addMethod: 'As yet unclassified')
!
parameterStart
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterStop
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterTarget
	^#b
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElement
	^$a
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetElements
	^#(1)
!
(reader addMethod: 'As yet unclassified')
!
parameterTargetSequence
	^'bc'
!
(reader addMethod: 'tests')
!
test_after_
	| res |
	res := #(#a #b #c) after: self parameterTarget.
	self assert: res = #c
!
(reader addMethod: 'tests')
!
test_at_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterIndex.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_at_ifAbsent_
	| handlerReached |
	self valuesDo: 
			[:testValue |
			| res |
			handlerReached := false.
			res := testValue at: 1
						ifAbsent: 
							[handlerReached := true.
							Object new].
			self deny: handlerReached.
			self assert: res = testValue first.
			res := testValue at: -1
						ifAbsent: 
							[handlerReached := true.
							#foo].
			self assert: handlerReached.
			self assert: res = #foo]
!
(reader addMethod: 'tests')
!
test_before_
	| res |
	res := #(#a #b #c) before: self parameterTarget.
	self assert: res = #a
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , 'abc'.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyFrom_to_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyFrom: self parameterStart to: self parameterStop.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceAll_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplaceAll: self parameterTargetElements
						with: self parameterReplacementElements.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
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
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
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
						with: 'def'.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplacing_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplacing: self parameterTargetElement
						withObject: self parameterReplacementElement.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyWithout_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyWithout: self parameterOldElement.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyWith_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyWith: self parameterNewElement.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_do_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue do: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue = self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_findFirst_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue findFirst: self parameterDiscriminator.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_findLast_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue findLast: self parameterDiscriminator.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_first
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue first.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_from_to_do_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						from: self parameterStop
						to: self parameterStart
						do: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_from_to_keysAndValuesDo_
	self valuesDo: 
			[:testValue |
			testValue
				from: self parameterStart
				to: self parameterStop
				keysAndValuesDo: [:i :v | ]]
!
(reader addMethod: 'tests')
!
test_indexOfSubCollection_startingAt_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue indexOfSubCollection: self parameterTargetSequence
						startingAt: self parameterStart.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_indexOfSubCollection_startingAt_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						indexOfSubCollection: self parameterTargetSequence
						startingAt: self parameterStart
						ifAbsent: self parameterExceptionHandler.
			self assert: (self valueIsKindOfInteger: res) | (res = #ex)]
!
(reader addMethod: 'tests')
!
test_indexOf_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue indexOf: self parameterTarget.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_indexOf_ifAbsent_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue indexOf: self parameterTarget ifAbsent: self parameterExceptionHandler.
			self assert: (self valueIsKindOfInteger: res) | (res = #ex)]
!
(reader addMethod: 'tests')
!
test_keysAndValuesDo_
	self valuesDo: [:testValue | testValue keysAndValuesDo: [:k :v | ]]
!
(reader addMethod: 'tests')
!
test_last
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue last.
			self assert: (self valueIsKindOfObject: res)]
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
test_reverseDo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reverseDo: self parameterOperation]
!
(reader addMethod: 'tests')
!
test_with_do_
	self
		valuesDo: [:testValue | testValue with: (self parameterOtherCollection: testValue size) do: [:a :b | ]]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 'abc'.
	aBlock value: #(1 2 3).
	aBlock value: (OrderedCollection with: 1 with: #zork).
	aBlock value: (1 to: 10)
!
