(reader defineClass: 'ObjectTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterCandidateClass
	^Number
!
(reader addMethod: 'As yet unclassified')
!
parameterMessage
	^Message selector: #foo: arguments: #(1)
!
(reader addMethod: 'As yet unclassified')
!
parameterSelector
	^#printString
!
(reader addMethod: 'As yet unclassified')
!
parameterSignalerText
	^'fromage'
!
(reader addMethod: 'tests')
!
test_class
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue class.
			self assert: (self valueIsKindOfClassDescription: res)]
!
(reader addMethod: 'tests')
!
test_copy
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue copy.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_doesNotUnderstand_
	self valuesDo: 
			[:testValue |
			| reachedHandler |
			reachedHandler := false.
			[testValue doesNotUnderstand: self parameterMessage] on: MessageNotUnderstood
				do: [:ex | reachedHandler := true].
			self assert: reachedHandler]
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
test_equals_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue == self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_error_
	self valuesDo: 
			[:testValue |
			| reachedHandler |
			reachedHandler := false.
			[testValue error: self parameterSignalerText] on: Error
				do: 
					[:ex |
					self assert: ex messageText = self parameterSignalerText.
					reachedHandler := true].
			self assert: reachedHandler]
!
(reader addMethod: 'tests')
!
test_hash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue hash.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_identityHash
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue identityHash.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_isKindOf_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isKindOf: self parameterCandidateClass.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isMemberOf_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isMemberOf: self parameterCandidateClass.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_isNil
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isNil.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_notNil
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue notNil.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_perform_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue perform: self parameterSelector.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_perform_withArguments_
	| res |
	res := #(1) perform: #, withArguments: #(#(2 3)).
	self assert: res = #(1 2 3)
!
(reader addMethod: 'tests')
!
test_perform_with_
	| res |
	res := #(1) perform: #copyWith: with: 2.
	self assert: res = #(1 2)
!
(reader addMethod: 'tests')
!
test_perform_with_with_
	| res |
	res := 1 perform: #to:by: with: 2 with: 1.
	self assert: res isInterval
!
(reader addMethod: 'tests')
!
test_perform_with_with_with_
	| blockReached |
	blockReached := false.
	1
		perform: #to:by:do:
		with: 2
		with: 1
		with: [:i | blockReached := true].
	self assert: blockReached
!
(reader addMethod: 'tests')
!
test_printOn_
	self valuesDo: [:testValue | testValue printOn: (WriteStream on: String new)]
!
(reader addMethod: 'tests')
!
test_printString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printString.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_respondsTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue respondsTo: self parameterSelector.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_tilde_equals
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ~= self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_tilde_tilde
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue ~~ self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_yourself
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue yourself.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Object new
!
