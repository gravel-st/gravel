(reader defineClass: 'Double' superclass: 'st.gravel.lang.LimitedPrecisionReal')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Double')
!
(reader addMethod: 'mathematical functions')
!
arcCos
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'arcCos')>
	
!
(reader addMethod: 'mathematical functions')
!
arcSin
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'arcSin')>
	
!
(reader addMethod: 'mathematical functions')
!
arcTan
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'arcTan')>
	
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
(reader addMethod: 'mathematical functions')
!
cos
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'cos')>
	
!
(reader addMethod: 'converting')
!
degreesToRadians
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'degreesToRadians')>
	
!
(reader addMethod: 'mathematical functions')
!
exp
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'exp')>
	
!
(reader addMethod: 'mathematical functions')
!
ln
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'ln')>
	
!
(reader addMethod: 'converting')
!
radiansToDegrees
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'radiansToDegrees')>
	
!
(reader addMethod: 'mathematical functions')
!
sin
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sin')>
	
!
(reader addMethod: 'mathematical functions')
!
sqrt
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sqrt')>
	
!
(reader addMethod: 'mathematical functions')
!
tan
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'tan')>
	
!
