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
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromDouble: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromDouble: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromDouble: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromDouble: self
!
(reader addMethod: 'comparing')
!
< operand
	^operand lessFromDouble: self
!
(reader addMethod: 'comparing')
!
= aMagnitude
	<primitive: 'equals'>
	
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
(reader addMethod: 'private-arithmetic')
!
differenceFromDouble: aDouble
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'differenceFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'differenceFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'differenceFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromScaledDecimal: operand
	^operand asDouble - self
!
(reader addMethod: 'private-arithmetic')
!
differenceFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'differenceFromSmallInteger_')>
	
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
(reader addMethod: 'testing')
!
isNaN
	^self = NaN
!
(reader addMethod: 'private-arithmetic')
!
lessFromDouble: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'lessFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'lessFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'lessFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'lessFromSmallInteger_')>
	
!
(reader addMethod: 'mathematical functions')
!
ln
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'ln')>
	
!
(reader addMethod: 'printing')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'printBase_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromDouble: aDouble
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'productFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'productFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	^aFraction asDouble * self
!
(reader addMethod: 'private-arithmetic')
!
productFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'productFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromScaledDecimal: operand
	^operand asDouble * self
!
(reader addMethod: 'private-arithmetic')
!
productFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'productFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromDouble: aDouble
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'quotientFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'quotientFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromLargeInteger: anInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'quotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromScaledDecimal: operand
	^operand asDouble / self
!
(reader addMethod: 'private-arithmetic')
!
quotientFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'quotientFromSmallInteger_')>
	
!
(reader addMethod: 'converting')
!
radiansToDegrees
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'radiansToDegrees')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromDouble: anObject
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'raisedFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromFloat: anObject
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'raisedFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'raisedFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'raisedFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
raisedTo: operand
	^operand raisedFromDouble: self
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
(reader addMethod: 'private-arithmetic')
!
sumFromDouble: aDouble
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sumFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sumFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sumFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromScaledDecimal: operand
	^operand asDouble + self
!
(reader addMethod: 'private-arithmetic')
!
sumFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.DoubleExtensions' 'sumFromSmallInteger_')>
	
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
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromDouble: self
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
	^53
!
