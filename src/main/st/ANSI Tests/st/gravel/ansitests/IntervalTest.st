(reader defineClass: 'IntervalTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_collect_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue collect: self parameterTransformer.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
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
			res := testValue copyFrom: self parameterStop to: self parameterStart.
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
						copyReplaceFrom: self parameterReplacementElement
						to: self parameterStart
						withObject: self parameterStop.
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
						with: self parameterReplacementElements.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplacing_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplacing: self parameterReplacementElement
						withObject: self parameterTargetElement.
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
test_reject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue reject: self parameterDiscriminator.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
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
test_select_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue select: self parameterDiscriminator.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
