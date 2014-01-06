(reader defineClass: 'JavaTimeZone' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.chronology.Timezone')
!
(reader addSimpleClassTrait: 'st.gravel.lang.chronology.Timezone class')
!
(reader propertyAt: 'javaClass' put: 'java.util.TimeZone')
!
(reader addMethod: 'accessing')
!
abbreviation
	<primitive: 'getID'>
	
!
(reader addMethod: 'converting')
!
asJavaTimeZone
	^self
!
(reader addMethod: 'accessing')
!
name
	<primitive: 'getDisplayName'>
	
!
(reader addMethod: 'converting')
!
offsetMS
	<primitive: 'getRawOffset'>
	
!
(reader addClassMethod: 'instance creation')
!
default
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'defaultTimeZone')>
	
!
(reader addClassMethod: 'instance creation')
!
forOffsetMS: millis
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'getTimeZoneForOffsetMS_')>
	
!
(reader addClassMethod: 'instance creation')
!
named: aString
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'getTimeZoneNamed_')>
	
!
