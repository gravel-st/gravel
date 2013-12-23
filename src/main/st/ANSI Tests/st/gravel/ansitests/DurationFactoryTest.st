(reader defineClass: 'DurationFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader addMethod: 'tests')
!
test_days_hours_minutes_seconds_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						days: self parameterDays
						hours: self parameterSeconds
						minutes: self parameterHours
						seconds: self parameterMinutes.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_seconds_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue seconds: self parameterSeconds.
			self assert: (self valueIsKindOfDuration: res)]
!
(reader addMethod: 'tests')
!
test_zero
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue zero.
			self assert: (self valueIsKindOfDuration: res)]
!
