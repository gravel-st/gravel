(reader defineClass: 'Duration' superclass: 'st.gravel.lang.Magnitude')
!
(reader addInstVar: 'nanos')
!
(reader addInstVar: 'seconds')
!
(reader addMethod: 'As yet unclassified')
!
* operand
	^self class nanoSeconds: (self asNanoSeconds * operand) asInteger
!
(reader addMethod: 'As yet unclassified')
!
+ operand
	^self class nanoSeconds: self asNanoSeconds + operand asNanoSeconds
!
(reader addMethod: 'As yet unclassified')
!
- operand
	^self + operand negated
!
(reader addMethod: 'As yet unclassified')
!
/ operand
	^operand isNumber
		ifTrue: [self class nanoSeconds: (self asNanoSeconds / operand) asInteger]
		ifFalse: [self asNanoSeconds / operand asDuration asNanoSeconds]
!
(reader addMethod: 'As yet unclassified')
!
// operand
	^operand isNumber
		ifTrue: [self class nanoSeconds: (self asNanoSeconds // operand) asInteger]
		ifFalse: [self asNanoSeconds // operand asDuration asNanoSeconds]
!
(reader addMethod: 'gravel')
!
< comparand
	^self asNanoSeconds < comparand asNanoSeconds
!
(reader addMethod: 'gravel')
!
= comparand
	^self == comparand
		ifTrue: [true]
		ifFalse: 
			[self class = comparand class
				ifTrue: [self asNanoSeconds = comparand asNanoSeconds]
				ifFalse: [false]]
!
(reader addMethod: 'gravel')
!
abs
	^self class seconds: seconds abs nanoSeconds: nanos abs
!
(reader addMethod: 'gravel')
!
asDelay
	^Delay forDuration: self
!
(reader addMethod: 'gravel')
!
asDuration
	^self
!
(reader addMethod: 'gravel')
!
asMilliseconds
	^(seconds * NanosInSecond + nanos) // (10 raisedToInteger: 6)
!
(reader addMethod: 'gravel')
!
asNanoSeconds
	^seconds * NanosInSecond + nanos
!
(reader addMethod: 'gravel')
!
asSeconds
	^seconds
!
(reader addMethod: 'gravel')
!
days
	^seconds quo: SecondsInDay
!
(reader addMethod: 'arithmetic')
!
differenceFromTimestamp: aTimestamp
	^Timestamp millisecondsSince1970: aTimestamp millisecondsSince1970 - self asMilliseconds
		offsetMS: aTimestamp offsetMS
!
(reader addMethod: 'comparing')
!
hash
	^seconds bitXor: nanos
!
(reader addMethod: 'comparing')
!
hours
	^(seconds rem: SecondsInDay) quo: SecondsInHour
!
(reader addMethod: 'gravel')
!
initialize
	self seconds: 0 nanoSeconds: 0
!
(reader addMethod: 'gravel')
!
isZero
	^seconds isZero and: [nanos isZero]
!
(reader addMethod: 'gravel')
!
minutes
	^(seconds rem: SecondsInHour) quo: SecondsInMinute
!
(reader addMethod: 'gravel')
!
nanoseconds
	^nanos
!
(reader addMethod: 'gravel')
!
negated
	^self class seconds: seconds negated nanoSeconds: nanos negated
!
(reader addMethod: 'gravel')
!
negative
	^self positive not
!
(reader addMethod: 'gravel')
!
positive
	^seconds = 0 ifTrue: [nanos positive] ifFalse: [seconds positive]
!
(reader addMethod: 'gravel')
!
printOn: aStream
	| d h m s n |
	d := self days abs.
	h := self hours abs.
	m := self minutes abs.
	s := self seconds abs truncated.
	n := self nanoseconds abs.
	self negative ifTrue: [aStream nextPut: $-].
	d printOn: aStream.
	aStream nextPut: $:.
	h < 10 ifTrue: [aStream nextPut: $0].
	h printOn: aStream.
	aStream nextPut: $:.
	m < 10 ifTrue: [aStream nextPut: $0].
	m printOn: aStream.
	aStream nextPut: $:.
	s < 10 ifTrue: [aStream nextPut: $0].
	s printOn: aStream.
	n = 0 ifFalse: [n printOn: aStream paddedTo: 9]
!
(reader addMethod: 'gravel')
!
roundTo: aDuration
	^self class nanoSeconds: (self asNanoSeconds roundTo: aDuration asNanoSeconds)
!
(reader addMethod: 'gravel')
!
seconds
	^(seconds rem: SecondsInMinute) + (nanos / NanosInSecond)
!
(reader addMethod: 'gravel')
!
seconds: secondCount nanoSeconds: nanoCount
	seconds := secondCount.
	nanos := nanoCount
!
(reader addMethod: 'printing')
!
storeOn: aStream
	aStream
		nextPut: $(;
		nextPutAll: self className;
		nextPutAll: ' seconds: ';
		print: seconds;
		nextPutAll: ' nanoSeconds: ';
		print: nanos;
		nextPut: $)
!
(reader addMethod: 'arithmetic')
!
sumFromTimestamp: aTimestamp
	^Timestamp millisecondsSince1970: aTimestamp millisecondsSince1970 + self asMilliseconds
		offsetMS: aTimestamp offsetMS
!
(reader addMethod: 'printing')
!
ticks
	^Array
		with: self days
		with: self hours * 3600 + (self minutes * 60) + self seconds truncated
		with: self nanoseconds
!
(reader addMethod: 'printing')
!
truncateTo: aDuration
	^self class nanoSeconds: (self asNanoSeconds truncateTo: aDuration asNanoSeconds)
!
(reader addMethod: 'gravel')
!
\\ operand
	^operand isNumber
		ifTrue: [self class nanoSeconds: self asNanoSeconds \\ operand]
		ifFalse: [self - (operand * (self // operand))]
!
(reader addClassMethod: 'As yet unclassified')
!
days: aNumber
	^self
		days: aNumber
		hours: 0
		minutes: 0
		seconds: 0
		nanoSeconds: 0
!
(reader addClassMethod: 'As yet unclassified')
!
days: days hours: hours minutes: minutes seconds: seconds
	^self
		days: days
		hours: hours
		minutes: minutes
		seconds: seconds
		nanoSeconds: 0
!
(reader addClassMethod: 'As yet unclassified')
!
days: days hours: hours minutes: minutes seconds: seconds nanoSeconds: nanos
	^self
		nanoSeconds: (days * SecondsInDay + (hours * SecondsInHour) + (minutes * SecondsInMinute)
				+ seconds) * NanosInSecond
				+ nanos
!
(reader addClassMethod: 'As yet unclassified')
!
fromString: aString
	^self readFrom: (ReadStream on: aString)
!
(reader addClassMethod: 'As yet unclassified')
!
hours: aNumber
	^self
		days: 0
		hours: aNumber
		minutes: 0
		seconds: 0
		nanoSeconds: 0
!
(reader addClassMethod: 'class initialization')
!
initialize
	SecondsInDay := 86400.
	SecondsInHour := 3600.
	SecondsInMinute := 60.
	NanosInSecond := 10 raisedTo: 9.
	NanosInMillisecond := 10 raisedTo: 6.
	DayNames := #(#Sunday #Monday #Tuesday #Wednesday #Thursday #Friday #Saturday).
	MonthNames := #(#January #February #March #April #May #June #July #August #September #October #November #December).
	DaysInMonth := #(31 28 31 30 31 30 31 31 30 31 30 31)
!
(reader addClassMethod: 'As yet unclassified')
!
microSeconds: microSeconds
	^self nanoSeconds: microSeconds * 1000
!
(reader addClassMethod: 'As yet unclassified')
!
milliSeconds: milliCount
	^self
		days: 0
		hours: 0
		minutes: 0
		seconds: 0
		nanoSeconds: milliCount * (10 raisedToInteger: 6)
!
(reader addClassMethod: 'As yet unclassified')
!
minutes: aNumber
	^self
		days: 0
		hours: 0
		minutes: aNumber
		seconds: 0
		nanoSeconds: 0
!
(reader addClassMethod: 'As yet unclassified')
!
month: aMonth
	^(Month month: aMonth year: Year current year) duration
!
(reader addClassMethod: 'As yet unclassified')
!
nanoSeconds: nanos
	^(self new)
		seconds: (nanos quo: NanosInSecond) nanoSeconds: (nanos rem: NanosInSecond) rounded;
		yourself
!
(reader addClassMethod: 'instance creation')
!
readFrom: aStream
	| sign days hours minutes seconds nanos ws ch |
	sign := (aStream peekFor: $-) ifTrue: [-1] ifFalse: [1].
	days := (aStream upTo: $:) asInteger sign: sign.
	hours := (aStream upTo: $:) asInteger sign: sign.
	minutes := (aStream upTo: $:) asInteger sign: sign.
	aStream atEnd
		ifTrue: 
			[seconds := 0.
			nanos := 0]
		ifFalse: 
			[ws := String new writeStream.
			
			[ch := aStream next.
			ch isNil | (ch = $.)] whileFalse: [ws nextPut: ch].
			seconds := ws contents asInteger sign: sign.
			ws reset.
			9 timesRepeat: 
					[ch := aStream next.
					ws nextPut: (ch ifNil: [$0] ifNotNil: [ch])].
			nanos := ws contents asInteger sign: sign].
	^self
		days: days
		hours: hours
		minutes: minutes
		seconds: seconds
		nanoSeconds: nanos
!
(reader addClassMethod: 'instance creation')
!
seconds: aNumber
	^(self basicNew)
		seconds: aNumber nanoSeconds: 0;
		yourself
!
(reader addClassMethod: 'instance creation')
!
seconds: seconds nanoSeconds: nanos
	^self
		days: 0
		hours: 0
		minutes: 0
		seconds: seconds
		nanoSeconds: nanos
!
(reader addClassMethod: 'instance creation')
!
weeks: aNumber
	^self
		days: aNumber * 7
		hours: 0
		minutes: 0
		seconds: 0
		nanoSeconds: 0
!
(reader addClassMethod: 'instance creation')
!
zero
	^(self basicNew)
		seconds: 0 nanoSeconds: 0;
		yourself
!
