(reader defineClass: 'Date' superclass: 'st.gravel.lang.Temporal')
!
(reader addInstVar: 'daysSince1970')
!
(reader addMethod: 'accessing')
!
dayOfWeek
	^(daysSince1970 + 3 rem: 7) + 1
!
(reader addMethod: 'accessing')
!
dayOfWeekName
	^Week nameOfDay: self dayOfWeek
!
(reader addMethod: 'accessing')
!
fromDaysSince1970
	^daysSince1970
!
(reader addMethod: 'initialize-release')
!
initializeFromDaysSince1970: anInteger
	daysSince1970 := anInteger.
	self initialize
!
(reader addMethod: 'accessing')
!
monthAbbreviation
	^self monthName copyFrom: 1 to: 3
!
(reader addMethod: 'accessing')
!
monthName
	^Month nameOfMonth: self monthIndex
!
(reader addClassMethod: 'instance creation')
!
fromDaysSince1970: anInteger
	^self new initializeFromDaysSince1970: anInteger
!
