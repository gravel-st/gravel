(reader defineClass: 'SequencedReadableCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_after_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue after: self parameterTarget.
			self assert: (self valueIsKindOfObject: res)]
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
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterIndex ifAbsent: self parameterExceptionBlock.
			self assert: (self valueIsKindOfANY: res).
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_before_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue before: self parameterTarget.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_comma
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue , self parameterOperand.
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
						copyReplaceFrom: self parameterStop
						to: self parameterStart
						with: self parameterReplacementElements.
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
	equivalent equivalent self valuesDo: 
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
			| res |
			res := testValue
						from: self parameterStart
						to: self parameterStop
						keysAndValuesDo: self parameterOperation]
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
						startingAt: self parameterExceptionHandler
						ifAbsent: self parameterStart.
			self assert: (self valueIsKindOfObject: res).
			self assert: (self valueIsKindOfInteger: res)]
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
			res := testValue indexOf: self parameterExceptionHandler ifAbsent: self parameterTarget.
			self assert: (self valueIsKindOfObject: res).
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_keysAndValuesDo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue keysAndValuesDo: self parameterOperation]
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
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue with: self parameterOtherCollection do: self parameterOperation]
!
