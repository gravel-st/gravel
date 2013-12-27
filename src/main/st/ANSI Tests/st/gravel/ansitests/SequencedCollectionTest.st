(reader defineClass: 'SequencedCollectionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterIndex
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterIndices
	^#(1 3)
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElement
	^#fromage
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementElements
	^#(1 2)
!
(reader addMethod: 'As yet unclassified')
!
parameterReplacementStart
	^2
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
			testValue
				replaceFrom: self parameterStart
				to: self parameterStop
				withObject: self parameterReplacementElement]
!
(reader addMethod: 'tests')
!
test_replaceFrom_to_with_
	self valuesDo: 
			[:testValue |
			testValue
				replaceFrom: self parameterStart
				to: self parameterStop
				with: self parameterReplacementElements]
!
(reader addMethod: 'tests')
!
test_replaceFrom_to_with_startingAt_
	self valuesDo: 
			[:testValue |
			testValue
				replaceFrom: self parameterStop
				to: self parameterStart
				with: self parameterReplacementElements
				startingAt: self parameterReplacementStart]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: #(#a #b #c) copy.
	aBlock value: (OrderedCollection with: 1 with: 2 with: 3)
!
