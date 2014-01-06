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
millisecondsSince1970
	<primitive: 'getTimeInMillis'>
	
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
