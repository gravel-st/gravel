(reader defineTrait: 'Timezone' superclass: nil)
!
(reader addMethod: 'accessing')
!
abbreviation
	^self traitRequirement
!
(reader addMethod: 'converting')
!
asJavaTimeZone
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
name
	^self traitRequirement
!
(reader addMethod: 'converting')
!
offset
	^self offsetMS milliseconds
!
(reader addMethod: 'converting')
!
offsetMS
	^self traitRequirement
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
forOffsetMS: millis
	^self defaultImplementation forOffsetMS: millis
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
