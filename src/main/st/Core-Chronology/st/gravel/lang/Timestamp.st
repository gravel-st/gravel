(reader defineClass: 'Timestamp' superclass: 'st.gravel.lang.Temporal')
!
(reader defineSharedVariable: 'MillisecondsSinceJulianDay' init: nil)
!
(reader addInstVar: 'msSince1970')
!
(reader addInstVar: 'offsetMS')
!
(reader addMethod: 'arithmetic')
!
+ aDurationOrTimestamp
	^aDurationOrTimestamp sumFromTimestamp: self
!
(reader addMethod: 'arithmetic')
!
- aDurationOrTimestamp
	^aDurationOrTimestamp differenceFromTimestamp: self
!
(reader addMethod: 'visitor')
!
accept: visitor
	^visitor visitTimestamp: self
!
(reader addMethod: 'As yet unclassified')
!
dayMonthYearDo: aBlock
	| l n i j dd mm yyyy |
	l := jdn + 68569.
	n := 4 * l // 146097.
	l := l - ((146097 * n + 3) // 4).
	i := 4000 * (l + 1) // 1461001.
	l := l - (1461 * i // 4) + 31.
	j := 80 * l // 2447.
	dd := l - (2447 * j // 80).
	l := j // 11.
	mm := j + 2 - (12 * l).
	yyyy := 100 * (n - 49) + i + l.
	^aBlock value: dd value: mm value: yyyy
!
(reader addMethod: 'arithmetic')
!
differenceFromTimestamp: aTimestamp
	^(aTimestamp millisecondsSince1970 - self millisecondsSince1970) milliseconds
!
(reader addMethod: 'initialize-release')
!
initializeMsSince1970: anInteger offsetMS: anInteger2
	msSince1970 := anInteger.
	offsetMS := anInteger2.
	self initialize
!
(reader addMethod: 'accessing')
!
millisecondsSince1970
	^msSince1970
!
(reader addMethod: 'accessing')
!
offsetMS
	^offsetMS
!
(reader addMethod: 'accessing')
!
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $[.
	aStream
		nextPutAll: 'msSince1970: ';
		print: msSince1970.
	aStream
		nextPutAll: ', offsetMS: ';
		print: offsetMS.
	aStream nextPut: $]
!
(reader addClassMethod: 'As yet unclassified')
!
clockPrecision
	^self clockPrecisionNS nanoseconds
!
(reader addClassMethod: 'As yet unclassified')
!
clockPrecisionNS
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'clockPrecisionNS')>
	
!
(reader addClassMethod: 'class initialization')
!
initialize
	MillisecondsSinceJulianDay := (self
				julianDayDuration: 1970
				month: 1
				day: 1
				hour: 0
				minute: 0
				second: 0
				nanoSecond: 0) asMilliseconds
!
(reader addClassMethod: 'instance creation')
!
julianDayDuration: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second nanoSecond: nanoCount
	| julianDayNumber r s daysInMonth p q |
	daysInMonth := Month daysInMonthIndex: monthIndex forYear: year.
	dayOfMonth < 1 ifTrue: [self error: 'day may not be zero or negative'].
	dayOfMonth > daysInMonth ifTrue: [self error: 'day is after month ends'].
	p := monthIndex - 14 quo: 12.
	q := year + 4800 + p.
	r := monthIndex - 2 - (12 * p).
	s := year + 4900 + p quo: 100.
	julianDayNumber := (1461 * q quo: 4) + (367 * r quo: 12) - (3 * s quo: 4)
				+ (dayOfMonth - 32075).
	^Duration
		days: julianDayNumber
		hours: hour
		minutes: minute
		seconds: second
		nanoSeconds: nanoCount
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970
	^self millisecondsSince1970: millisecondsSince1970
		offsetMS: (self timezoneOffsetMS: millisecondsSince1970)
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970 offsetMS: offsetMS
	^self new initializeMsSince1970: millisecondsSince1970 offsetMS: offsetMS
!
(reader addClassMethod: 'As yet unclassified')
!
now
	^self millisecondsSince1970: Time currentTimeMillis
!
(reader addClassMethod: 'As yet unclassified')
!
timezoneOffsetMS: msSince1970
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'timezoneOffsetMS_')>
	
!
(reader addClassMethod: 'instance creation')
!
year: year day: dayOfYear hour: hour minute: minute second: second
	| y d |
	y := self
				year: year
				month: 1
				day: 1
				hour: hour
				minute: minute
				second: second
				nanoSecond: 0.
	d := Duration days: dayOfYear - 1.
	^y + d
!
(reader addClassMethod: 'instance creation')
!
year: year day: dayOfYear hour: hour minute: minute second: second offset: offset
	| y d |
	y := self
				year: year
				month: 1
				day: 1
				hour: hour
				minute: minute
				second: second
				nanoSecond: 0
				offset: offset.
	d := Duration days: dayOfYear - 1.
	^y + d
!
(reader addClassMethod: 'instance creation')
!
year: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second
	^self
		year: year
		month: monthIndex
		day: dayOfMonth
		hour: hour
		minute: minute
		second: second
		nanoSecond: 0
!
(reader addClassMethod: 'instance creation')
!
year: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second nanoSecond: nanoCount
	| since |
	since := self
				julianDayDuration: year
				month: monthIndex
				day: dayOfMonth
				hour: hour
				minute: minute
				second: second
				nanoSecond: nanoCount.
	^self millisecondsSince1970: since asMilliseconds - MillisecondsSinceJulianDay
!
(reader addClassMethod: 'instance creation')
!
year: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second nanoSecond: nanoCount offset: offset
	^self
		year: year
		month: monthIndex
		day: dayOfMonth
		hour: hour
		minute: minute
		second: second
		nanoSecond: nanoCount
		offsetMS: offset asMilliseconds
!
(reader addClassMethod: 'instance creation')
!
year: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second nanoSecond: nanoCount offsetMS: offsetMS
	| since |
	since := self
				julianDayDuration: year
				month: monthIndex
				day: dayOfMonth
				hour: hour
				minute: minute
				second: second
				nanoSecond: nanoCount.
	^self millisecondsSince1970: since asMilliseconds - MillisecondsSinceJulianDay
		offsetMS: offsetMS
!
(reader addClassMethod: 'instance creation')
!
year: year month: monthIndex day: dayOfMonth hour: hour minute: minute second: second offset: offset
	^self
		year: year
		month: monthIndex
		day: dayOfMonth
		hour: hour
		minute: minute
		second: second
		nanoSecond: 0
		offset: offset
!
