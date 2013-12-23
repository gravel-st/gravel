(reader defineClass: 'GettableStreamTest' superclass: 'st.gravel.ansitests.ANSITest')
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
			res := testValue nextMatchFor: self parameterAnObject.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_next_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue next: self parameterAmount.
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
			res := testValue peekFor: self parameterAnObject.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_skipTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue skipTo: self parameterAnObject.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_skip_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue skip: self parameterAmount]
!
(reader addMethod: 'tests')
!
test_upTo_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue upTo: self parameterAnObject.
			self assert: (self valueIsKindOfSequencedReadableCollection: res)]
!
