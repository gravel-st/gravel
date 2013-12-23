(reader defineClass: 'DateAndTimeTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_asLocal
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asLocal.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_asUTC
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue asUTC.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_dayOfMonth
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dayOfMonth.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_dayOfWeek
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dayOfWeek.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_dayOfWeekAbbreviation
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dayOfWeekAbbreviation.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_dayOfWeekName
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dayOfWeekName.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_dayOfYear
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue dayOfYear.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_equals
	equivalent equivalent self valuesDo: 
			[:testValue |
			| res |
			res := testValue = self parameterComparand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_hour
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue hour.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_hour12
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue hour12.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_hour24
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue hour24.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_isLeapYear
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue isLeapYear.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_less
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue < self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_meridianAbbreviation
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue meridianAbbreviation.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_minus
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue - self parameterOperand.
			self assert: (self valueIsKindOfDuration: res).
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_minute
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue minute.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_month
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue month.
			self assert: (self valueIsKindOfInteger: res)]
!
(reader addMethod: 'tests')
!
test_monthAbbreviation
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue monthAbbreviation.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_monthName
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue monthName.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_more
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue > self parameterOperand.
			self assert: (self valueIsKindOfBoolean: res)]
!
(reader addMethod: 'tests')
!
test_offset
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue offset.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_offset_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue offset: self parameterOffset.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_plus
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue + self parameterOperand.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_printString
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue printString.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_second
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue second.
			self assert: (self valueIsKindOfNumber: res)]
!
(reader addMethod: 'tests')
!
test_timeZoneAbbreviation
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue timeZoneAbbreviation.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_timeZoneName
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue timeZoneName.
			self assert: (self valueIsKindOfReadableString: res)]
!
(reader addMethod: 'tests')
!
test_year
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue year.
			self assert: (self valueIsKindOfInteger: res)]
!
