(reader defineClass: 'SignaledExceptionTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'tests')
!
test_isNested
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isNested.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_outer
	
	[self valuesDo: 
			[:testValue |
			| res |
			res := testValue outer.
			self assert: (self valueIsKindOfObject: res)]]
			on: TestError1
			do: [:ex | #foo]
!
(reader addMethod: 'tests')
!
test_pass
	| outerReached |
	outerReached := false.
	[self valuesDo: [:testValue | testValue pass]] on: TestError1
		do: [:ex | outerReached := true].
	self assert: outerReached
!
(reader addMethod: 'tests')
!
test_resignalAs_
	| outerReached |
	outerReached := false.
	[self valuesDo: [:testValue | testValue resignalAs: TestError2 new]] on: TestError2
		do: [:ex | outerReached := true].
	self assert: outerReached
!
(reader addMethod: 'tests')
!
test_resume
	| res |
	res := 
			[TestError1 raiseResumable.
			7] on: TestError1 do: [:ex | ex resume].
	self assert: res = 7
!
(reader addMethod: 'tests')
!
test_resume_
	| res |
	res := [TestError1 raiseResumable] on: TestError1 do: [:ex | ex resume: 11].
	self assert: res = 11.
	res := 
			[TestError1 raiseResumable.
			7] on: TestError1 do: [:ex | ex resume: 11].
	self assert: res = 7
!
(reader addMethod: 'tests')
!
test_retry
	| first second |
	first := true.
	second := false.
	
	[first
		ifTrue: 
			[first := false.
			TestError1 raise]
		ifFalse: [second := true]]
			on: TestError1
			do: [:ex | ex retry].
	self assert: second
!
(reader addMethod: 'tests')
!
test_retryUsing_
	| first second retriedOriginal res |
	first := true.
	second := false.
	retriedOriginal := false.
	res := 
			[first
				ifTrue: 
					[first := false.
					TestError1 raise]
				ifFalse: [retriedOriginal := true]]
					on: TestError1
					do: [:ex | ex retryUsing: 
								[second := true.
								#fromage]].
	self assert: second.
	self deny: retriedOriginal.
	self assert: res = #fromage
!
(reader addMethod: 'tests')
!
test_return
	
	[TestError1 raise.
	self assert: false] on: TestError1 do: [:ex | ex return]
!
(reader addMethod: 'tests')
!
test_return_
	| res |
	res := 
			[TestError1 raise.
			self assert: false] on: TestError1 do: [:ex | ex return: #fromage].
	self assert: res = #fromage
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	[TestError1 raise] on: TestError1 do: [:ex | aBlock value: ex]
!
