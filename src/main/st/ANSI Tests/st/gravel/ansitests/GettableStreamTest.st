(reader defineClass: 'GettableStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterOperation
	^[:e | e printString]
!
(reader addMethod: 'tests')
!
test_atEnd
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue atEnd.
			self assert: (self valueIsKindOfBoolean: res)]
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
test_next
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue next.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_nextLine
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue nextLine.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_nextMatchFor_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue nextMatchFor: $a.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_next_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue next: 2.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'tests')
!
test_peek
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue peek.
			self assert: (self valueIsKindOfObject: res)]
!
(reader addMethod: 'tests')
!
test_peekFor_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue peekFor: $a.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_skipTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue skipTo: $a.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_skip_
	self valuesDo: [:testValue | testValue skip: 2]
!
(reader addMethod: 'tests')
!
test_upTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue upTo: $a.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: 'abc' readStream
!
