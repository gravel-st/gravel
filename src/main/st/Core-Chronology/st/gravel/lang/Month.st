(reader defineClass: 'Month' superclass: 'st.gravel.lang.Timespan')
!
(reader addClassMethod: 'instance creation')
!
daysInMonth: indexOrName forYear: yearInteger
	| index |
	index := indexOrName isInteger
				ifTrue: [indexOrName]
				ifFalse: [self indexOfMonth: indexOrName].
	^self daysInMonthIndex: index forYear: yearInteger
!
(reader addClassMethod: 'instance creation')
!
daysInMonthIndex: index forYear: yearInteger
	^(DaysInMonth at: index)
		+ ((index = 2 and: [Year isLeapYear: yearInteger]) ifTrue: [1] ifFalse: [0])
!
(reader addClassMethod: 'instance creation')
!
indexOfMonth: aMonthName
	1 to: 12 do: [:i | (aMonthName , '*' match: (MonthNames at: i)) ifTrue: [^i]].
	self error: aMonthName , ' is not a recognized month name'
!
(reader addClassMethod: 'instance creation')
!
nameOfMonth: anIndex
	^MonthNames at: anIndex
!
