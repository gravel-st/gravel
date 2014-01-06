(reader defineClass: 'Double' superclass: 'st.gravel.lang.LimitedPrecisionReal')
!
(reader defineSharedVariable: 'E' init: nil)
!
(reader defineSharedVariable: 'Infinity' init: nil)
!
(reader defineSharedVariable: 'NaN' init: nil)
!
(reader defineSharedVariable: 'NegativeInfinity' init: nil)
!
(reader defineSharedVariable: 'Pi' init: nil)
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
(reader addMethod: 'truncation and round off')
!
ceiling
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'ceiling')>
	
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
(reader addMethod: 'truncation and round off')
!
exponent
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'exponent')>
	
!
(reader addMethod: 'truncation and round off')
!
floor
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'floor')>
	
!
(reader addMethod: 'testing')
!
isInfinite
	^self = Infinity or: [self = NegativeInfinity]
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
(reader addMethod: 'truncation and round off')
!
rounded
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'rounded')>
	
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
(reader addMethod: 'truncation and round off')
!
truncated
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'truncated')>
	
!
(reader addClassMethod: 'constants')
!
e
	^E
!
(reader addClassMethod: 'constants')
!
emax
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'emax')>
	
!
(reader addClassMethod: 'constants')
!
emin
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'emin')>
	
!
(reader addClassMethod: 'constants')
!
epsilon
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'epsilon')>
	
!
(reader addClassMethod: 'constants')
!
fmax
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'fmax')>
	
!
(reader addClassMethod: 'constants')
!
fmin
	^self fminDenormalized
!
(reader addClassMethod: 'constants')
!
fminDenormalized
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'fminDenormalized')>
	
!
(reader addClassMethod: 'constants')
!
fminNormalized
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'fminNormalized')>
	
!
(reader addClassMethod: 'class initialization')
!
initialize
	Infinity := self javaPositiveInfinity.
	NegativeInfinity := self javaNegativeInfinity.
	NaN := self javaNaN.
	Pi := 3.141592653589793.
	E := 2.718281828459045
!
(reader addClassMethod: 'private-initialization')
!
javaNaN
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'naN')>
	
!
(reader addClassMethod: 'private-initialization')
!
javaNegativeInfinity
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'negativeInfinity')>
	
!
(reader addClassMethod: 'private-initialization')
!
javaPositiveInfinity
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'positiveInfinity')>
	
!
(reader addClassMethod: 'constants')
!
precision
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'precision')>
	
!
