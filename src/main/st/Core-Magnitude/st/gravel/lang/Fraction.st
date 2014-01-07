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
	^(self / operand) floor
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
asDouble
	^numerator doubleDiv: denominator
!
(reader addMethod: 'converting')
!
asFloat
	^numerator floatDiv: denominator
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
(reader addMethod: 'private-arithmetic')
!
differenceFromInteger: anInteger
	^self class numerator: anInteger * denominator - numerator denominator: denominator
!
(reader addMethod: 'truncation and round off')
!
floor
	^numerator // denominator
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
(reader addMethod: 'mathematical functions')
!
ln
 <squeak>| res |
	(self <= 0) ifTrue: [ DomainError signal: 'ln is only defined for x > 0'].
	(numerator < denominator) ifTrue: [ ^(((self reciprocal) ln) negated)].
	res := (super ln).
	(res isFinite) ifTrue: [ ^res].
	^((numerator ln) - (denominator ln))
!
(reader addMethod: 'arithmetic')
!
negated
	^self class numerator: numerator negated denominator: denominator
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
(reader addMethod: 'printing')
!
printTruncatedOn: aStream showingDecimalPlaces: placesDesired
	| truncatedFractionPart integerPart scaling |
	placesDesired <= 0
		ifTrue: [self truncated printOn: aStream]
		ifFalse: 
			[scaling := 10 raisedToInteger: placesDesired.
			integerPart := numerator abs quo: denominator.
			truncatedFractionPart := (numerator abs - (integerPart * denominator)) * scaling
						quo: denominator.
			numerator negative ifTrue: [aStream nextPut: $-].
			integerPart printOn: aStream.
			aStream nextPut: $..
			truncatedFractionPart
				printOn: aStream
				base: 10
				length: placesDesired
				padded: true]
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	^(Fraction numerator: aFraction numerator * numerator
		denominator: aFraction denominator * denominator) reduced
!
(reader addMethod: 'private-arithmetic')
!
productFromInteger: anInteger
	^(self class numerator: anInteger * numerator denominator: denominator) reduced
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFraction: aFraction
	^aFraction * self reciprocal
!
(reader addMethod: 'private-arithmetic')
!
quotientFromInteger: anInteger
	^(self class numerator: anInteger * denominator denominator: numerator) reduced
!
(reader addMethod: 'arithmetic')
!
raisedTo: operand
	^operand raisedFromFraction: self
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
(reader addMethod: 'mathematical functions')
!
squared
	^Fraction numerator: numerator squared denominator: denominator squared
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
