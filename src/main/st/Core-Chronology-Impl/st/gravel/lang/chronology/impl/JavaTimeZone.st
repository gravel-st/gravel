(reader defineClass: 'JavaTimeZone' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.chronology.Timezone')
!
(reader addSimpleClassTrait: 'st.gravel.lang.chronology.Timezone class')
!
(reader propertyAt: 'javaClass' put: 'java.util.TimeZone')
!
(reader addMethod: 'converting')
!
asJavaTimeZone
	^self
!
(reader addClassMethod: 'instance creation')
!
default
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'defaultTimeZone')>
	
!
(reader addClassMethod: 'instance creation')
!
named: aString
	<primitive: #('st.gravel.support.jvm.TimeExtensions' 'getTimeZoneNamed_')>
	
!
