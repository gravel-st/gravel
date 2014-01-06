(reader defineClass: 'TestAsserter' superclass: 'st.gravel.lang.Object')
!
(reader addMethod: 'gravel')
!
assert: aBoolean
	aBoolean
		ifFalse: 
			[self logFailure: 'Assertion failed'.
			TestResult failure sunitSignalWith: 'Assertion failed']
!
(reader addMethod: 'gravel')
!
assert: aBoolean description: aString
	aBoolean
		ifFalse: 
			[self logFailure: aString.
			TestResult failure sunitSignalWith: aString]
!
(reader addMethod: 'gravel')
!
assert: aBoolean description: aString resumable: resumableBoolean
	| exception |
	aBoolean
		ifFalse: 
			[self logFailure: aString.
			exception := resumableBoolean
						ifTrue: [TestResult resumableFailure]
						ifFalse: [TestResult failure].
			exception sunitSignalWith: aString]
!
(reader addMethod: 'gravel')
!
assert: anObject equals: anotherObject
	self assert: anObject = anotherObject
		description: anObject printString , ' is not equal to ' , anotherObject printString
!
(reader addMethod: 'gravel')
!
assert: aNumber {Number} equals: otherNumber {Number} delta: aDelta {Number} {^Self}
	self assert: (aNumber - otherNumber) abs <= aDelta
!
(reader addMethod: 'gravel')
!
deny: aBoolean
	self assert: aBoolean not
!
(reader addMethod: 'gravel')
!
deny: aBoolean description: aString
	self assert: aBoolean not description: aString
!
(reader addMethod: 'gravel')
!
deny: aBoolean description: aString resumable: resumableBoolean
	self
		assert: aBoolean not
		description: aString
		resumable: resumableBoolean
!
(reader addMethod: 'gravel')
!
executeShould: aBlock inScopeOf: anExceptionalEvent
	^
	[aBlock value.
	false] sunitOn: anExceptionalEvent do: [:ex | ex sunitExitWith: true]
!
(reader addMethod: 'gravel')
!
logFailure: aString
	self class logFailure: aString
!
(reader addMethod: 'gravel')
!
should: aBlock raise: anExceptionalEvent
	self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
!
(reader addMethod: 'gravel')
!
should: aBlock raise: anExceptionalEvent description: aString
	self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
		description: aString
!
(reader addMethod: 'gravel')
!
shouldnt: aBlock raise: anExceptionalEvent
	self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
!
(reader addMethod: 'gravel')
!
shouldnt: aBlock raise: anExceptionalEvent description: aString
	self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
		description: aString
!
(reader addClassMethod: 'gravel')
!
assert: aBoolean description: aString
	aBoolean
		ifFalse: 
			[self logFailure: aString.
			TestResult failure sunitSignalWith: aString]
!
(reader addClassMethod: 'gravel')
!
failureLog
	^SUnitNameResolver defaultLogDevice
!
(reader addClassMethod: 'gravel')
!
isLogging
	^false
!
(reader addClassMethod: 'gravel')
!
logFailure: aString
	self isLogging
		ifTrue: 
			[(self failureLog)
				cr;
				nextPutAll: aString;
				flush]
!
