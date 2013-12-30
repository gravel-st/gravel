(reader defineClass: 'Year' superclass: 'st.gravel.lang.Timespan')
!
(reader addClassMethod: 'instance creation')
!
daysInYear: yearInteger
	^365 + ((self isLeapYear: yearInteger) ifTrue: [1] ifFalse: [0])
!
(reader addClassMethod: 'instance creation')
!
isLeapYear: aYearInteger
	| adjustedYear |
	adjustedYear := aYearInteger > 0
				ifTrue: [aYearInteger]
				ifFalse: [(aYearInteger + 1) negated].
	^(adjustedYear \\ 4 ~= 0 or: [adjustedYear \\ 100 = 0 and: [adjustedYear \\ 400 ~= 0]])
		not
!
(reader addClassMethod: 'instance creation')
!
leapYear: yearInteger
	^(self isLeapYear: yearInteger) ifTrue: [1] ifFalse: [0]
!
