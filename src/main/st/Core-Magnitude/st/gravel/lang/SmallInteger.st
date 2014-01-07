(reader defineClass: 'SmallInteger' superclass: 'st.gravel.lang.Integer')
!
(reader propertyAt: 'javaClass' put: 'java.lang.Integer')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromSmallInteger: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromSmallInteger: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromSmallInteger: self
!
(reader addMethod: 'arithmetic')
!
/ aNumber
	^aNumber quotientFromSmallInteger: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^operand integerQuotientFromSmallInteger: self
!
(reader addMethod: 'comparing')
!
< aMagnitude
	^aMagnitude lessFromSmallInteger: self
!
(reader addMethod: '')
!
== aMagnitude
	<primitive: 'equals'>
	
!
(reader addMethod: 'converting')
!
asDouble
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'asDouble')>
	
!
(reader addMethod: 'converting')
!
asFloat
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'asFloat')>
	
!
(reader addMethod: 'bit manipulation')
!
bitAnd: anObject
	^anObject bitAndFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitAndFromLargeInteger: aLargeInteger
	^aLargeInteger bitAndFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitAndFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitAnd_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitInvert
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitInvert')>
	
!
(reader addMethod: 'bit manipulation')
!
bitOr: anObject
	^anObject bitOrFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitOrFromLargeInteger: aLargeInteger
	^aLargeInteger bitOrFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitOrFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitOr_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitShift: anInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitShift_')>
	
!
(reader addMethod: 'bit manipulation')
!
bitXor: anObject
	^anObject bitXorFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitXorFromLargeInteger: aLargeInteger
	^aLargeInteger bitXorFromSmallInteger: self
!
(reader addMethod: 'private - bit manipulation')
!
bitXorFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'bitXor_')>
	
!
(reader addMethod: 'As yet unclassified')
!
compressed
	^self
!
(reader addMethod: 'private-arithmetic')
!
differenceFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'differenceFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
differenceFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'differenceFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
doubleDiv: operand
	^operand doubleDivFromSmallInteger: self
!
(reader addMethod: 'private-arithmetic')
!
doubleDivFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'doubleDivFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
doubleDivFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'doubleDivFromSmallInteger_')>
	
!
(reader addMethod: 'testing')
!
even
	^(self bitAnd: 1) = 0
!
(reader addMethod: 'arithmetic')
!
floatDiv: operand
	^operand floatDivFromSmallInteger: self
!
(reader addMethod: 'private-arithmetic')
!
floatDivFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'floatDivFromLargeInteger:')>
	
!
(reader addMethod: 'private-arithmetic')
!
floatDivFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'floatDivFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
gcd: aNumber
	^aNumber gcdFromSmallInteger: self
!
(reader addMethod: 'private-arithmetic')
!
gcdFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'gcdFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
gcdFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'gcdFromSmallInteger_')>
	
!
(reader addMethod: 'comparing')
!
hash
	^self
!
(reader addMethod: 'comparing')
!
hashMultiply
 <primitive: #('st.gravel.support.jvm.IntegerExtensions' 'hashMultiply')>| low14Bits a b c d e f g |
	low14Bits := (self bitAnd: 16383).
	a := (self bitShift: -14).
	b := (101 * low14Bits).
	c := ((9741 * a) + b).
	d := (c bitAnd: 16383).
	e := (9741 * low14Bits).
	f := (16384 * d).
	g := (f + e).
	^(g bitAnd: 268435455)
!
(reader addMethod: 'bit manipulation')
!
highBit
	self < 0 ifTrue: [^self error: 'highBit is not defined for negative integers'].
	^self highBitOfPositiveReceiver
!
(reader addMethod: 'private')
!
highBitOfByte
	^#[0 1 2 2 3 3 3 3 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]
		at: self + 1
!
(reader addMethod: 'bit manipulation')
!
highBitOfMagnitude
	self < 0 ifTrue: [^self negated highBitOfMagnitude].
	^self highBitOfPositiveReceiver
!
(reader addMethod: 'private')
!
highBitOfPositiveReceiver
	| shifted bitNo |
	shifted := self.
	bitNo := 0.
	[shifted < 65536] whileFalse: 
			[shifted := shifted bitShift: -16.
			bitNo := bitNo + 16].
	shifted < 256
		ifFalse: 
			[shifted := shifted bitShift: -8.
			bitNo := bitNo + 8].
	^bitNo + shifted highBitOfByte
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.IntegerExtensions' 'integerQuotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.IntegerExtensions' 'integerQuotientFromSmallInteger_')>
	
!
(reader addMethod: 'testing')
!
isPowerOfTwo
	^self > 0 and: [(self bitAnd: self - 1) = 0]
!
(reader addMethod: 'private-arithmetic')
!
lessFromLargeInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'lessFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
lessFromSmallInteger: aSmallInteger
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'lessFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromLargeInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.IntegerExtensions' 'moduloQuotientFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromSmallInteger: anObject
	<
	primitive: #('st.gravel.support.jvm.IntegerExtensions' 'moduloQuotientFromSmallInteger_')>
	
!
(reader addMethod: 'testing')
!
odd
	^(self bitAnd: 1) = 1
!
(reader addMethod: 'private-arithmetic')
!
positiveRaisedFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'raisedFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
positiveRaisedFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'raisedFromSmallInteger_')>
	
!
(reader addMethod: '')
!
printBase: base
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'printBase_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'productFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
productFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'productFromSmallInteger_')>
	
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^operand quoFromSmallInteger: self
!
(reader addMethod: 'private-arithmetic')
!
quoFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'quoFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
quoFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'quoFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromDouble: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'raisedFromDouble_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromFloat: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'raisedFromFloat_')>
	
!
(reader addMethod: 'private-arithmetic')
!
raisedFromFraction: aFraction
	^(aFraction numerator raisedTo: self) / (aFraction denominator raisedTo: self)
!
(reader addMethod: 'private-arithmetic')
!
raisedFromLargeInteger: anObject
	self > 0 ifTrue: [^self positiveRaisedFromLargeInteger: anObject].
	^1 / (self abs positiveRaisedFromLargeInteger: anObject)
!
(reader addMethod: 'private-arithmetic')
!
raisedFromSmallInteger: anObject
	self > 0 ifTrue: [^self positiveRaisedFromSmallInteger: anObject].
	^(self abs positiveRaisedFromSmallInteger: anObject) reciprocal
!
(reader addMethod: 'arithmetic')
!
raisedTo: operand
	^operand raisedFromSmallInteger: self
!
(reader addMethod: '')
!
rem: operand
	^operand remFromSmallInteger: self
!
(reader addMethod: 'private-arithmetic')
!
remFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'remFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
remFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'remFromSmallInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromLargeInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'sumFromLargeInteger_')>
	
!
(reader addMethod: 'private-arithmetic')
!
sumFromSmallInteger: anObject
	<primitive: #('st.gravel.support.jvm.IntegerExtensions' 'sumFromSmallInteger_')>
	
!
(reader addMethod: 'gravel')
!
timesRepeat: aBlock
	1 to: self do: [:i | aBlock value].
	^nil
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromSmallInteger: self
!
