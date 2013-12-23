(reader defineClass: 'ObjectTest' superclass: 'st.gravel.ansitests.ANSITest')
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
			| res |
			res := testValue doesNotUnderstand: self parameterMessage.
			self assert: (self valueIsKindOfObject: res)]
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
			| res |
			res := testValue error: self parameterSignalerText]
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
	message not understood message not understood self valuesDo: 
			[:testValue |
			| res |
			res := testValue perform: self parameterSelector.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_perform_withArguments_
	message not understood message not understood self valuesDo: 
			[:testValue |
			| res |
			res := testValue perform: self parameterSelector withArguments: self parameterArguments.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_perform_with_
	message not understood message not understood self valuesDo: 
			[:testValue |
			| res |
			res := testValue perform: self parameterArgument1 with: self parameterSelector.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_perform_with_with_
	message not understood message not understood self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						perform: self parameterSelector
						with: self parameterArgument1
						with: self parameterArgument2.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_perform_with_with_with_
	message not understood message not understood self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						perform: self parameterArgument3
						with: self parameterArgument1
						with: self parameterArgument2
						with: self parameterSelector.
			self assert: (self valueIsKindOfANY: res)]
!
(reader addMethod: 'tests')
!
test_printOn_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printOn: self parameterTarget]
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
	equivalent equivalent self valuesDo: 
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
