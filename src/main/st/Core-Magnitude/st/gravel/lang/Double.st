(reader defineClass: 'Double' superclass: 'st.gravel.lang.LimitedPrecisionReal')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Double')
!
(reader addMethod: 'converting')
!
asDouble
	^self
!
(reader addMethod: 'converting')
!
asFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'asFloat')>
	
!
