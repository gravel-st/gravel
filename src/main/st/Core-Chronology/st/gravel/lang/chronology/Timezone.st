(reader defineTrait: 'Timezone' superclass: nil)
!
(reader addClassMethod: 'instance creation')
!
default
	^self defaultImplementation default
!
(reader addClassMethod: 'instance creation')
!
defaultImplementation
	^JavaTimeZone
!
(reader addClassMethod: 'instance creation')
!
named: aString
	^self defaultImplementation named: aString
!
(reader addClassMethod: 'instance creation')
!
utc
	^self named: 'UTC'
!
