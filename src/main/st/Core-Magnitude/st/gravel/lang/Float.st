(reader defineClass: 'Float' superclass: 'st.gravel.lang.LimitedPrecisionReal')
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
(reader defineSharedVariable: 'RadiansPerDegree' init: nil)
!
(reader propertyAt: 'javaClass' put: 'java.lang.Float')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromFloat: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromFloat: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromFloat: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromFloat: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^(self / operand) floor
!
(reader addMethod: 'comparing')
!
< operand
	^operand lessFromFloat: self
!
(reader addMethod: 'comparing')
!
= aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'converting')
!
asDouble
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'asDouble')>
	
!
(reader addMethod: 'converting')
!
asFloat
	^self
!
(reader addMethod: 'converting')
!
asFraction
	^self asTrueFraction
!
(reader addMethod: 'converting')
!
asTrueFraction
	^(self * 100000000.0) truncated / 100000000
!
(reader addMethod: 'truncation and round off')
!
ceiling
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'ceiling')>
	
!
(reader addMethod: 'converting')
!
degreesToRadians
	^self * RadiansPerDegree
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'differenceFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'differenceFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromScaledDecimal: operand
	^operand asFloat - self
!
(reader addMethod: 'private-arithmetic')
!
differenceFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'differenceFromSmallInteger_')>
	
!
(reader addMethod: 'truncation and round off')
!
exponent
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'exponent')>
	
!
(reader addMethod: 'truncation and round off')
!
floor
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'floor')>
	
!
(reader addMethod: 'mathematical functions')
!
floorLog: radix
	(radix = 2 and: [self > 0.0 and: [self isFinite]]) ifTrue: [^self exponent].
	^(self log: radix) floor
!
(reader addMethod: 'testing')
!
isFinite
	^self - self = 0.0
!
(reader addMethod: 'testing')
!
isFloat
	^true
!
(reader addMethod: 'testing')
!
isInfinite
	^self = Infinity or: [self = NegativeInfinity]
!
(reader addMethod: 'testing')
!
isLiteral
	^self isFinite
!
(reader addMethod: 'testing')
!
isNaN
	^self ~= self
!
(reader addMethod: 'private-arithmetic')
!
lessFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'lessFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromFraction: aFraction
	^aFraction < self asFraction
!
(reader addMethod: 'private-arithmetic')
!
lessFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'lessFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'lessFromSmallInteger_')>
	
!
(reader addMethod: 'mathematical functions')
!
ln
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'ln')>
	
!
(reader addMethod: 'printing')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'printBase_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'productFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	^aFraction asFloat * self
!
(reader addMethod: 'private-arithmetic')
!
productFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'productFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromScaledDecimal: operand
	^operand asFloat * self
!
(reader addMethod: 'private-arithmetic')
!
productFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'productFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'quotientFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'quotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quotientFromScaledDecimal: operand
	^operand asFloat / self
!
(reader addMethod: 'private-arithmetic')
!
quotientFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'quotientFromSmallInteger_')>
	
!
(reader addMethod: 'converting')
!
radiansToDegrees
	^self / RadiansPerDegree
!
(reader addMethod: 'private-arithmetic')
!
raising: aNumber
	^aNumber raisedToFloat: self
!
(reader addMethod: 'truncation and round off')
!
rounded
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'rounded')>
	
!
(reader addMethod: 'mathematical functions')
!
sqrt
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'sqrt')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'sumFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'sumFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromScaledDecimal: operand
	^operand asFloat + self
!
(reader addMethod: 'private-arithmetic')
!
sumFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'sumFromSmallInteger_')>
	
!
(reader addMethod: 'truncation and round off')
!
truncated
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'truncated')>
	
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromFloat: self
!
(reader addClassMethod: 'constants')
!
e
	^E
!
(reader addClassMethod: 'constants')
!
emax
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'emax')>
	
!
(reader addClassMethod: 'constants')
!
emin
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'emin')>
	
!
(reader addClassMethod: 'constants')
!
epsilon
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'epsilon')>
	
!
(reader addClassMethod: 'constants')
!
fmax
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'fmax')>
	
!
(reader addClassMethod: 'constants')
!
fmin
	^self fminDenormalized
!
(reader addClassMethod: 'constants')
!
fminDenormalized
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'fminDenormalized')>
	
!
(reader addClassMethod: 'constants')
!
fminNormalized
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'fminNormalized')>
	
!
(reader addClassMethod: 'class initialization')
!
initialize
	Infinity := self javaPositiveInfinity.
	NegativeInfinity := self javaNegativeInfinity.
	NaN := self javaNaN.
	Pi := 3.1415927.
	E := 2.7182817.
	RadiansPerDegree := 0.017453292
!
(reader addClassMethod: 'private-initialization')
!
javaNaN
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'javaNaN')>
	
!
(reader addClassMethod: 'private-initialization')
!
javaNegativeInfinity
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'javaNegativeInfinity')>
	
!
(reader addClassMethod: 'private-initialization')
!
javaPositiveInfinity
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'javaPositiveInfinity')>
	
!
(reader addClassMethod: 'constants')
!
one
	<squeak>
	^1.0
!
(reader addClassMethod: 'constants')
!
pi
	^Pi
!
(reader addClassMethod: 'constants')
!
precision
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'precision')>
	
!
(reader addClassMethod: 'constants')
!
unity
	^1.0
!
