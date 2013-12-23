(reader defineClass: 'SequencedCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_atAllPut_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue atAllPut: self parameterNewElement]
!
(reader addMethod: 'tests')
!
test_atAll_put_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue atAll: self parameterIndices put: self parameterNewElement]
!
(reader addMethod: 'tests')
!
test_at_put_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue at: self parameterIndex put: self parameterNewElement.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_replaceFrom_to_withObject_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						replaceFrom: self parameterStart
						to: self parameterReplacementElement
						withObject: self parameterStop]
!
(reader addMethod: 'tests')
!
test_replaceFrom_to_with_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						replaceFrom: self parameterStart
						to: self parameterReplacementElements
						with: self parameterStop]
!
(reader addMethod: 'tests')
!
test_replaceFrom_to_with_startingAt_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						replaceFrom: self parameterStop
						to: self parameterStart
						with: self parameterReplacementStart
						startingAt: self parameterReplacementElements]
!
