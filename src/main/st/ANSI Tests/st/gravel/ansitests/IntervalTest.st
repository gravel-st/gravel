(reader defineClass: 'IntervalTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterOldElement
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterOperand
	^#(1 2 3)
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElement
	^7
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
parameterTargetElement
	^1
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
			res := testValue copyFrom: self parameterStart to: self parameterStop.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_copyReplaceAll_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copyReplaceAll: #(1 2) with: #(4 5).
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
						with: #(9 -1).
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: (1 to: 2).
	aBlock value: (200 to: 400 by: 20).
	aBlock value: (80 to: -40 by: -3)
!
