(reader defineClass: 'DateAndTimeFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_clockPrecision
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue clockPrecision]
!
(reader addMethod: 'tests')
!
test_now
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue now.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_day_hour_minute_second_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterYear
						day: self parameterDayOfYear
						hour: self parameterHour
						minute: self parameterMinute
						second: self parameterSecond.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_day_hour_minute_second_offset_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterSecond
						day: self parameterHour
						hour: self parameterOffset
						minute: self parameterYear
						second: self parameterDayOfYear
						offset: self parameterMinute.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_month_day_hour_minute_second_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterHour
						month: self parameterSecond
						day: self parameterMinute
						hour: self parameterMonth
						minute: self parameterDayOfMonth
						second: self parameterYear.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_month_day_hour_minute_second_offset_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterMinute
						month: self parameterHour
						day: self parameterMonth
						hour: self parameterSecond
						minute: self parameterOffset
						second: self parameterDayOfMonth
						offset: self parameterYear.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
