(reader defineTrait: 'Timestamp' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.Comparable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.Comparable class')
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
(reader addMethod: 'gravel')
!
< aMagnitude
	^aMagnitude lessFromTimestamp: self
!
(reader addMethod: 'converting')
!
asDate
	^Date fromDaysSince1970: self millisecondsSince1970 // 86400000
!
(reader addMethod: 'converting')
!
asLocal
	^Timestamp millisecondsSince1970: self millisecondsSince1970 timezone: Timezone default
!
(reader addMethod: 'converting')
!
asUTC
	^Timestamp millisecondsSince1970: self millisecondsSince1970 timezone: Timezone utc
!
(reader addMethod: 'accessing')
!
dayOfMonth
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
dayOfWeek
	^(self daysSince1970 + 3 rem: 7) + 1
!
(reader addMethod: 'accessing')
!
dayOfWeekAbbreviation
	^self dayOfWeekName copyFrom: 1 to: 3
!
(reader addMethod: 'accessing')
!
dayOfWeekName
	^Week nameOfDay: self dayOfWeek
!
(reader addMethod: 'accessing')
!
dayOfYear
	^self traitRequirement
!
(reader addMethod: 'converting')
!
daysSince1970
	^self millisecondsSince1970 // 86400000
!
(reader addMethod: 'private-arithmetic')
!
differenceFromTimestamp: aTimestamp
	^(aTimestamp millisecondsSince1970 - self millisecondsSince1970) milliseconds
!
(reader addMethod: 'accessing')
!
hour
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
hour12
	^(self hour - 1) \\ 12 + 1
!
(reader addMethod: 'accessing')
!
hour24
	^self hour
!
(reader addMethod: 'accessing')
!
isLeapYear
	^self traitRequirement
!
(reader addMethod: 'testing')
!
isTimestamp
	^true
!
(reader addMethod: 'private-arithmetic')
!
lessFromTimestamp: aTimestamp
	^aTimestamp millisecondsSince1970 < self millisecondsSince1970
!
(reader addMethod: 'accessing')
!
meridianAbbreviation
	^self hour < 12 ifTrue: ['AM'] ifFalse: ['PM']
!
(reader addMethod: 'accessing')
!
millisecondsSince1970
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
minute
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
month
	^self monthIndex
!
(reader addMethod: 'accessing')
!
monthAbbreviation
	^self monthName copyFrom: 1 to: 3
!
(reader addMethod: 'accessing')
!
monthIndex
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
monthName
	^Month nameOfMonth: self monthIndex
!
(reader addMethod: 'accessing')
!
offset
	^self timezone offset
!
(reader addMethod: 'accessing')
!
offset: aDuration
	^Timestamp millisecondsSince1970: self millisecondsSince1970 offset: aDuration
!
(reader addMethod: 'accessing')
!
second
	^self traitRequirement
!
(reader addMethod: 'private-arithmetic')
!
sumFromTimestamp: aTimestamp
	^self error: 'This doesn''t mean anything'
!
(reader addMethod: 'accessing')
!
timezone
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
timeZoneAbbreviation
	^self timezone abbreviation
!
(reader addMethod: 'accessing')
!
timeZoneName
	^self timezone name
!
(reader addMethod: 'accessing')
!
year
	^self traitRequirement
!
(reader addClassMethod: 'accessing')
!
clockPrecision
	^self clockPrecisionNS nanoseconds
!
(reader addClassMethod: 'accessing')
!
clockPrecisionNS
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'clockPrecisionNS')>
	
!
(reader addClassMethod: 'instance creation')
!
defaultImplementation
	^JavaCalendar
!
(reader addClassMethod: 'instance creation')
!
fromString: aString
	^self traitRequirement
!
(reader addClassMethod: 'tools')
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
	^self millisecondsSince1970: millisecondsSince1970 timezone: Timezone default
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970 offset: aDuration
	^self millisecondsSince1970: millisecondsSince1970 offsetMS: aDuration asMilliseconds
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970 offsetMS: offsetMS
	^self millisecondsSince1970: millisecondsSince1970
		timezone: (Timezone forOffsetMS: offsetMS)
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970 timezone: aTimezone
	^self defaultImplementation millisecondsSince1970: millisecondsSince1970
		timezone: aTimezone
!
(reader addClassMethod: 'instance creation')
!
now
	^self millisecondsSince1970: Time currentTimeMillis
!
(reader addClassMethod: 'instance creation')
!
readFrom: aStream
	^self defaultImplementation fromString: aStream contents
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
