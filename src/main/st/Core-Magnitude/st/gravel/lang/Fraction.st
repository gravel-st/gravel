(reader defineClass: 'Fraction' superclass: 'st.gravel.lang.Number')
!
(reader addInstVar: 'numerator')
!
(reader addInstVar: 'denominator')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromFraction: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromFraction: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromFraction: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromFraction: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^operand integerQuotientFromFraction: self
!
(reader addMethod: 'gravel')
!
< aFraction
	^aFraction lessFromFraction: self
!
(reader addMethod: 'comparing')
!
= aNumber
	aNumber isNumber ifFalse: [^false].
	(aNumber isFraction or: [aNumber isInteger])
		ifTrue: 
			[numerator = 0 ifTrue: [^aNumber numerator = 0].
			^numerator * aNumber denominator = (aNumber numerator * denominator)].
	^aNumber asFraction = self
!
(reader addMethod: 'converting')
!
asFloat
	| a b mantissa exponent hasTruncatedBits lostBit n ha hb hm |
	a := numerator abs.
	b := denominator.
	ha := a highBitOfMagnitude.
	hb := b highBitOfMagnitude.
	n := 1 + Float precision.
	(ha < n and: [hb < n]) ifTrue: [^numerator asFloat / denominator asFloat].
	exponent := ha - hb - n.
	exponent >= 0
		ifTrue: [b := b bitShift: exponent]
		ifFalse: [a := a bitShift: exponent negated].
	mantissa := a quo: b.
	hasTruncatedBits := a > (mantissa * b).
	hm := mantissa highBit.
	lostBit := Float emin - (exponent + hm - 1).
	lostBit > 0 ifTrue: [n := n - lostBit max: 1].
	hm > n
		ifTrue: 
			[exponent := exponent + hm - n.
			hasTruncatedBits := hasTruncatedBits or: [mantissa anyBitOfMagnitudeFrom: 1 to: hm - n].
			mantissa := mantissa bitShift: n - hm].
	(hasTruncatedBits and: [mantissa odd]) ifTrue: [mantissa := mantissa + 1].
	^(self positive ifTrue: [mantissa asFloat] ifFalse: [mantissa asFloat negated])
		timesTwoPower: exponent
!
(reader addMethod: 'converting')
!
asFraction
	^self
!
(reader addMethod: 'accessing')
!
denominator
	^denominator
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFraction: aFraction
	^aFraction + self negated
!
(reader addMethod: 'comparing')
!
hash
	| tmp |
	denominator isPowerOfTwo
		ifTrue: 
			[tmp := self asFloat.
			tmp isFinite ifTrue: [^tmp hash]].
	^numerator hash bitXor: denominator hash
!
(reader addMethod: 'initialize-release')
!
initializeNumerator: n denominator: d
	d = 0
		ifTrue: [^(ZeroDivide dividend: n) signal]
		ifFalse: 
			[numerator := n asInteger.
			denominator := d asInteger abs.
			d < 0 ifTrue: [numerator := numerator negated]]
!
(reader addMethod: 'testing')
!
isFraction
	^true
!
(reader addMethod: 'gravel')
!
lessFromFraction: aFraction
	| neg |
	(neg := aFraction negative) = self negative ifFalse: [^neg].
	^aFraction numerator * denominator < (numerator * aFraction denominator)
!
(reader addMethod: 'private-arithmetic')
!
lessFromInteger: anInteger
	^anInteger * denominator < numerator
!
(reader addMethod: 'testing')
!
negative
	^numerator negative
!
(reader addMethod: 'accessing')
!
numerator
	^numerator
!
(reader addMethod: 'printing')
!
printOn: aStream
	aStream
		nextPut: $(;
		print: numerator.
	aStream
		nextPutAll: ' / ';
		print: denominator;
		nextPut: $)
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	| d1 d2 |
	d1 := aFraction numerator gcd: denominator.
	d2 := aFraction denominator gcd: numerator.
	(d2 = aFraction denominator and: [d1 = denominator])
		ifTrue: [^aFraction numerator // d1 * (numerator // d2)].
	^Fraction numerator: aFraction numerator // d1 * (numerator // d2)
		denominator: aFraction denominator // d2 * (denominator // d1)
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^operand quoFromFraction: self
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFraction: aFraction
	^aFraction * self reciprocal
!
(reader addMethod: 'arithmetic')
!
raisedToInteger: anInteger
	anInteger = 0 ifTrue: [^1].
	anInteger < 0 ifTrue: [^self reciprocal raisedToInteger: anInteger negated].
	^Fraction numerator: (numerator raisedToInteger: anInteger)
		denominator: (denominator raisedToInteger: anInteger)
!
(reader addMethod: 'arithmetic')
!
reciprocal
	numerator abs = 1 ifTrue: [^denominator * numerator].
	^self class numerator: denominator denominator: numerator
!
(reader addMethod: 'private')
!
reduced
	| gcd numer denom |
	numerator = 0 ifTrue: [^0].
	gcd := numerator gcd: denominator.
	numer := numerator // gcd.
	denom := denominator // gcd.
	denom = 1 ifTrue: [^numer].
	^Fraction numerator: numer denominator: denom
!
(reader addMethod: 'private-arithmetic')
!
sumFromFraction: aFraction
	| d n d1 d2 |
	d := aFraction denominator gcd: denominator.
	n := aFraction numerator * (d1 := denominator // d)
				+ (numerator * (d2 := aFraction denominator // d)).
	d1 := d1 * d2.
	n := n // (d2 := n gcd: d).
	(d := d1 * (d // d2)) = 1 ifTrue: [^n].
	^Fraction numerator: n denominator: d
!
(reader addMethod: 'private-arithmetic')
!
sumFromInteger: anInteger
	^self class numerator: anInteger * denominator + numerator denominator: denominator
!
(reader addMethod: 'truncation and round off')
!
truncated
	^numerator quo: denominator
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^operand moduloQuotientFromFraction: self
!
(reader addClassMethod: 'instance creation')
!
numerator: numInteger denominator: denInteger
	^self new initializeNumerator: numInteger denominator: denInteger
!
(reader addClassMethod: 'constants')
!
unity
	^self numerator: 1 denominator: 1
!
