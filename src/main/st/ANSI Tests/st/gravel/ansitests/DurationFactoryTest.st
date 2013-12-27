(reader defineClass: 'DurationFactoryTest' superclass: 'st.gravel.ansitests.ANSITest')
!
(reader propertyAt: 'isSystemTest' put: 'Ja')
!
(reader addMethod: 'As yet unclassified')
!
parameterDays
	^13
!
(reader addMethod: 'As yet unclassified')
!
parameterHours
	^3
!
(reader addMethod: 'As yet unclassified')
!
parameterMinutes
	^40
!
(reader addMethod: 'As yet unclassified')
!
parameterSeconds
	^2
!
(reader addMethod: 'tests')
!
test_days_hours_minutes_seconds_
	self valuesDo: 
			[:testValue |
			| res |
			res := testValue
						days: self parameterDays
						hours: self parameterHours
						minutes: self parameterMinutes
						seconds: self parameterSeconds.
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
(reader addMethod: 'As yet unclassified')
!
valuesDo: aBlock
	aBlock value: Duration
!
