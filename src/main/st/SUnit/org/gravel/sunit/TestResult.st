(reader defineClass: 'TestResult' superclass: 'org.gravel.lang.Object')
!
(reader addInstVar: 'failures')
!
(reader addInstVar: 'errors')
!
(reader addInstVar: 'passed')
!
(reader addMethod: 'gravel')
!
addError: aTestCase
	^self errors add: aTestCase
!
(reader addMethod: 'gravel')
!
addFailure: aTestCase
	^self failures add: aTestCase
!
(reader addMethod: 'gravel')
!
addPass: aTestCase
	^self passed add: aTestCase
!
(reader addMethod: 'gravel')
!
correctCount
	^self passedCount
!
(reader addMethod: 'gravel')
!
defects
	^(OrderedCollection new)
		addAll: self errors;
		addAll: self failures;
		yourself
!
(reader addMethod: 'gravel')
!
errorCount
	^self errors size
!
(reader addMethod: 'gravel')
!
errors
	errors isNil ifTrue: [errors := OrderedCollection new].
	^errors
!
(reader addMethod: 'gravel')
!
failureCount
	^self failures size
!
(reader addMethod: 'gravel')
!
failures
	failures isNil ifTrue: [failures := Set new].
	^failures
!
(reader addMethod: 'gravel')
!
hasErrors
	^self errors size > 0
!
(reader addMethod: 'gravel')
!
hasFailures
	^self failures size > 0
!
(reader addMethod: 'gravel')
!
hasPassed
	^self hasErrors not and: [self hasFailures not]
!
(reader addMethod: 'gravel')
!
initialize
	
!
(reader addMethod: 'gravel')
!
isError: aTestCase
	^self errors includes: aTestCase
!
(reader addMethod: 'gravel')
!
isFailure: aTestCase
	^self failures includes: aTestCase
!
(reader addMethod: 'gravel')
!
isPassed: aTestCase
	^self passed includes: aTestCase
!
(reader addMethod: 'gravel')
!
passed
	passed isNil ifTrue: [passed := OrderedCollection new].
	^passed
!
(reader addMethod: 'gravel')
!
passedCount
	^self passed size
!
(reader addMethod: 'gravel')
!
printOn: aStream
	aStream
		nextPutAll: self runCount printString;
		nextPutAll: ' run, ';
		nextPutAll: self correctCount printString;
		nextPutAll: ' passed, ';
		nextPutAll: self failureCount printString;
		nextPutAll: ' failed, ';
		nextPutAll: self errorCount printString;
		nextPutAll: ' error'.
	self errorCount ~= 1 ifTrue: [aStream nextPut: $s]
!
(reader addMethod: 'gravel')
!
runCase: aTestCase
	
	[aTestCase runCase.
	self addPass: aTestCase]
			sunitOn: self class failure , self class error
			do: [:ex | ex sunitAnnounce: aTestCase toResult: self]
!
(reader addMethod: 'gravel')
!
runCount
	^self passedCount + self failureCount + self errorCount
!
(reader addMethod: 'gravel')
!
tests
	^(OrderedCollection new: self runCount)
		addAll: self passed;
		addAll: self errors;
		addAll: self failures;
		yourself
!
(reader addClassMethod: 'gravel')
!
error
	^self exError
!
(reader addClassMethod: 'gravel')
!
exError
	^Error
!
(reader addClassMethod: 'gravel')
!
failure
	^TestFailure
!
(reader addClassMethod: 'gravel')
!
new
	^super new initialize
!
(reader addClassMethod: 'gravel')
!
resumableFailure
	^ResumableTestFailure
!
(reader addClassMethod: 'gravel')
!
signalErrorWith: aString
	self error sunitSignalWith: aString
!
(reader addClassMethod: 'gravel')
!
signalFailureWith: aString
	self failure sunitSignalWith: aString
!
