(reader defineClass: 'Float' superclass: 'st.gravel.lang.Number')
!
(reader defineSharedVariable: 'Infinity' init: nil)
!
(reader defineSharedVariable: 'NaN' init: nil)
!
(reader defineSharedVariable: 'NegativeInfinity' init: nil)
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
(reader addMethod: 'private-arithmetic')
!
differenceFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'differenceFromFloat_')>
	
!
(reader addMethod: 'truncation and round off')
!
floor
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'floor')>
	
!
(reader addMethod: 'truncation and round off')
!
fractionPart
	^self - self truncated
!
(reader addMethod: 'truncation and round off')
!
integerPart
	^self - self fractionPart
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
productFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'productFromFloat_')>
	
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^(self / operand) truncated
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'quotientFromFloat_')>
	
!
(reader addMethod: 'truncation and round off')
!
rounded
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'rounded')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromFloat: aFloat
	<primitive: #('st.gravel.support.jvm.FloatExtensions' 'sumFromFloat_')>
	
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
(reader addClassMethod: 'class initialization')
!
initialize
	Infinity := self javaPositiveInfinity.
	NegativeInfinity := self javaNegativeInfinity.
	NaN := self javaNaN
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
precision
	^24
!
(reader addClassMethod: 'constants')
!
unity
	^1.0
!
