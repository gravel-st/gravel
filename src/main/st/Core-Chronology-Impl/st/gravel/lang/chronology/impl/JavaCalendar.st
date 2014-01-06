(reader defineClass: 'JavaCalendar' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.chronology.Timestamp')
!
(reader addSimpleClassTrait: 'st.gravel.lang.chronology.Timestamp class')
!
(reader propertyAt: 'javaClass' put: 'java.util.Calendar')
!
(reader addMethod: 'accessing')
!
dayOfMonth
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'dayOfMonth')>
	
!
(reader addMethod: 'accessing')
!
dayOfYear
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'dayOfYear')>
	
!
(reader addMethod: 'accessing')
!
hour
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'hour')>
	
!
(reader addMethod: 'accessing')
!
isLeapYear
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'isLeapYear')>
	
!
(reader addMethod: 'accessing')
!
millisecondsSince1970
	<primitive: 'getTimeInMillis'>
	
!
(reader addMethod: 'accessing')
!
minute
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'minute')>
	
!
(reader addMethod: 'accessing')
!
monthIndex
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'monthIndex')>
	
!
(reader addMethod: 'accessing')
!
second
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'second')>
	
!
(reader addMethod: 'accessing')
!
timezone
	<primitive: 'getTimeZone'>
	
!
(reader addMethod: 'accessing')
!
year
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'year')>
	
!
(reader addClassMethod: 'instance creation')
!
fromString: aString
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'newCalendarFromString_')>
	
!
(reader addClassMethod: 'instance creation')
!
millisecondsSince1970: millisecondsSince1970 timezone: aTimezone
	^self newCalendar: millisecondsSince1970 timeZone: aTimezone asJavaTimeZone
!
(reader addClassMethod: 'instance creation')
!
newCalendar: millisecondsSince1970 timeZone: aTimezone
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'newCalendar_timeZone_')>
	
!
