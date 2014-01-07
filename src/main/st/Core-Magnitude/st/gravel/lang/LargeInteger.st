(reader defineClass: 'LargeInteger' superclass: 'st.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.math.BigInteger')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromLargeInteger: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromLargeInteger: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromLargeInteger: self
!
(reader addMethod: 'arithmetic')
!
/ aNumber
	^aNumber quotientFromLargeInteger: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^operand integerQuotientFromLargeInteger: self
!
(reader addMethod: '')
!
< aMagnitude
	^aMagnitude lessFromLargeInteger: self
!
(reader addMethod: '')
!
= aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'converting')
!
asDouble
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'asDouble')>
	
!
(reader addMethod: 'converting')
!
asFloat
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'asFloat')>
	
!
(reader addMethod: 'bit - manipulation')
!
bitAnd: anInteger
	^anInteger bitAndFromLargeInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitAndFromLargeInteger: aLargeInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitAndFromLargeInteger_')>
	
!
(reader addMethod: 'private - bit manipulation')
!
bitAndFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitAndFromSmallInteger_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitAt: anInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitAt_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitAt: anInteger put: value
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitAt_put_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitInvert
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitInvert')>
	
!
(reader addMethod: 'bit manipulation')
!
bitOr: anInteger
	^anInteger bitOrFromLargeInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitOrFromLargeInteger: aLargeInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitOrFromLargeInteger_')>
	
!
(reader addMethod: 'private - bit manipulation')
!
bitOrFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitOrFromSmallInteger_')>
	
!
(reader addMethod: 'bit - manipulation')
!
bitShift: anInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitShift_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitXor: anInteger
	^anInteger bitXorFromLargeInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitXorFromLargeInteger: aLargeInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitXorFromLargeInteger_')>
	
!
(reader addMethod: 'private - bit manipulation')
!
bitXorFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'bitXorFromSmallInteger_')>
	
!
(reader addMethod: '')
!
compressed
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'compressed')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'differenceFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'differenceFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
doubleDiv: operand
	^operand doubleDivFromLargeInteger: self
!
(reader addMethod: 'private-arithmetic')
!
doubleDivFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'doubleDivFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
doubleDivFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'doubleDivFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
floatDiv: operand
	^operand floatDivFromLargeInteger: self
!
(reader addMethod: 'private-arithmetic')
!
floatDivFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'floatDivFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
floatDivFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'floatDivFromSmallInteger_')>
	
!
(reader addMethod: '')
!
gcd: aNumber
	^aNumber gcdFromLargeInteger: self
!
(reader addMethod: 'private-arithmetic')
!
gcdFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'gcdFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
gcdFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'gcdFromSmallInteger_')>
	
!
(reader addMethod: 'bit manipulation')
!
highBit
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'highBit')>
	
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'integerQuotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'integerQuotientFromSmallInteger_')>
	
!
(reader addMethod: 'testing')
!
isLarge
	^true
!
(reader addMethod: 'testing')
!
isZero
	^false
!
(reader addMethod: 'private-arithmetic')
!
lessFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'lessFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'lessFromSmallInteger_')>
	
!
(reader addMethod: 'mathematical functions')
!
ln
	| res h |
	res := super ln.
	res isFinite ifTrue: [^res].
	h := self highBit.
	^2 ln * h + (self / (1 << h)) asFloat ln
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'moduloQuotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'moduloQuotientFromSmallInteger_')>
	
!
(reader addMethod: '')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'printBase_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'productFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'productFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^operand quoFromLargeInteger: self
!
(reader addMethod: 'private-arithmetic')
!
quoFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'quoFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quoFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'quoFromSmallInteger_')>
	
!
(reader addMethod: '')
!
rem: operand
	^operand remFromLargeInteger: self
!
(reader addMethod: 'private-arithmetic')
!
remFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'remFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
remFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'remFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'sumFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.LargeIntegerExtensions' 'sumFromSmallInteger_')>
	
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self compressed
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromLargeInteger: self
!
