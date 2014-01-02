(reader defineClass: 'Integer' superclass: 'st.gravel.lang.Number')
!
(reader addMethod: 'arithmetic')
!
/ aNumber
	^aNumber quotientFromInteger: self
!
(reader addMethod: 'gravel')
!
> aMagnitude
	^aMagnitude < self
!
(reader addMethod: 'arithmetic')
!
abs
	^self < 0 ifTrue: [0 - self] ifFalse: [self]
!
(reader addMethod: 'converting')
!
asFraction
	^self
!
(reader addMethod: 'converting')
!
asInteger
	^self
!
(reader addMethod: 'converting')
!
asScaledDecimal: scale
	^ScaledDecimal newFromNumber: self scale: scale
!
(reader addMethod: 'As yet unclassified')
!
benchFib
	^self < 2 ifTrue: [1] ifFalse: [(self - 1) benchFib + (self - 2) benchFib + 1]
!
(reader addMethod: 'As yet unclassified')
!
benchmark
	| size flags prime k count |
	size := 8190.
	1 to: self
		do: 
			[:iter |
			count := 0.
			flags := (Array new: size) atAllPut: true.
			1 to: size
				do: 
					[:i |
					(flags at: i)
						ifTrue: 
							[prime := i + 1.
							k := i + prime.
							[k <= size] whileTrue: 
									[flags at: k put: false.
									k := k + prime].
							count := count + 1]]].
	^count
!
(reader addMethod: 'accessing')
!
denominator
	^1
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFraction: aFraction
	^(Fraction numerator: aFraction numerator - (aFraction denominator * self)
		denominator: aFraction denominator) reduced
!
(reader addMethod: 'gravel')
!
factorial
	| tmp |
	tmp := 1.
	2 to: self do: [:i | tmp := tmp * i].
	^tmp
!
(reader addMethod: 'arithmetic')
!
gcd: operand
	^self subclassResponsibility
!
(reader addMethod: 'As yet unclassified')
!
hashMultiply
	^(self bitAnd: 268435455) hashMultiply
!
(reader addMethod: 'testing')
!
isFraction
	^true
!
(reader addMethod: 'testing')
!
isInteger
	^true
!
(reader addMethod: 'testing')
!
isLarge
	^false
!
(reader addMethod: 'testing')
!
isZero
	^self = 0
!
(reader addMethod: 'comparing')
!
lessFromFraction: aFraction
	^aFraction numerator < (self * aFraction denominator)
!
(reader addMethod: 'accessing')
!
numerator
	^self
!
(reader addMethod: 'gravel')
!
printBase: base
	self subclassResponsibility
!
(reader addMethod: 'gravel')
!
printOn: aStream
	self printOn: aStream base: 10
!
(reader addMethod: 'gravel')
!
printOn: aStream base: base
	aStream nextPutAll: (self printBase: base)
!
(reader addMethod: 'printing')
!
printOn: aStream paddedTo: anInteger
	self printOn: aStream paddedWith: $0 to: anInteger
!
(reader addMethod: 'printing')
!
printOn: aStream paddedWith: aCharacter to: anInteger
	self
		printOn: aStream
		paddedWith: aCharacter
		to: anInteger
		base: 10
!
(reader addMethod: 'printing')
!
printOn: aStream paddedWith: aCharacter to: anInteger base: aRadix
	| digitStream digits |
	digitStream := WriteStream on: (String new: 10).
	self printOn: digitStream base: aRadix.
	digits := digitStream contents.
	anInteger - digits size timesRepeat: [aStream nextPut: aCharacter].
	aStream nextPutAll: digits
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	self = 0 ifTrue: [^self].
	^(Fraction numerator: 1 denominator: self) productFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
quotientFromInteger: anInteger
	^(Fraction numerator: anInteger denominator: self) reduced
!
(reader addMethod: 'As yet unclassified')
!
raisedTo: aNumber
	| n |
	(n := aNumber toMinimumGenerality) isInteger ifTrue: [^self raisedToInteger: n].
	self notImplementedYet
!
(reader addMethod: 'As yet unclassified')
!
raisedToInteger: aNumber
	^self subclassResponsibility
!
(reader addMethod: 'gravel')
!
rounded
	^self
!
(reader addMethod: 'private-arithmetic')
!
sumFromFraction: aFraction
	^Fraction numerator: aFraction numerator + (aFraction denominator * self)
		denominator: aFraction denominator
!
(reader addMethod: 'As yet unclassified')
!
tinyBenchmarks
	| t1 t2 r n1 n2 |
	n1 := 1.
	
	[t1 := Time millisecondsToRun: [n1 benchmark].
	t1 < 1000] whileTrue: [n1 := n1 * 2].
	n2 := 28.
	
	[t2 := Time millisecondsToRun: [r := n2 benchFib].
	t2 < 1000] whileTrue: [n2 := n2 + 1].
	^(n1 * 500000 * 1000 // t1) printString , ' bytecodes/sec; '
		, (r * 1000 // t2) printString , ' sends/sec'
!
(reader addMethod: 'converting')
!
truncated
	^self
!
(reader addClassMethod: 'constants')
!
unity
	^1
!
