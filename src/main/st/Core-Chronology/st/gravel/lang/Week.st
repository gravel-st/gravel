(reader defineClass: 'Week' superclass: 'st.gravel.lang.Timespan')
!
(reader addClassMethod: 'accessing')
!
nameOfDay: anIndex
	^DayNames at: anIndex
!
