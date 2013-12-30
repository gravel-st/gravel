(reader defineClass: 'DateAndTimeFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterDayOfMonth
	^5
!
(reader addMethod: 'As yet unclassified')
!
parameterDayOfYear
	^36
!
(reader addMethod: 'As yet unclassified')
!
parameterHour
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterMinute
	^59
!
(reader addMethod: 'As yet unclassified')
!
parameterMonth
	^2
!
(reader addMethod: 'As yet unclassified')
!
parameterOffset
	^-1 hours
!
(reader addMethod: 'As yet unclassified')
!
parameterSecond
	^1
!
(reader addMethod: 'As yet unclassified')
!
parameterYear
	^2013
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
						year: self parameterYear
						day: self parameterDayOfYear
						hour: self parameterHour
						minute: self parameterMinute
						second: self parameterSecond
						offset: self parameterOffset.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_month_day_hour_minute_second_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterYear
						month: self parameterMonth
						day: self parameterDayOfMonth
						hour: self parameterHour
						minute: self parameterMinute
						second: self parameterSecond.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'tests')
!
test_year_month_day_hour_minute_second_offset_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						year: self parameterYear
						month: self parameterMonth
						day: self parameterDayOfMonth
						hour: self parameterHour
						minute: self parameterMinute
						second: self parameterSecond
						offset: self parameterOffset.
			self assert: (self valueIsKindOfDateAndTime: res)]
!
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Timestamp
!
