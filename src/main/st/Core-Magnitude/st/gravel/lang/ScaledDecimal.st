(reader defineClass: 'ScaledDecimal' superclass: 'st.gravel.lang.Number')
!
(reader addInstVar: 'fraction')
!
(reader addInstVar: 'scale')
!
(reader addMethod: 'arithmetic')
!
* operand
	^operand productFromScaledDecimal: self
!
(reader addMethod: 'arithmetic')
!
+ operand
	^operand sumFromScaledDecimal: self
!
(reader addMethod: 'arithmetic')
!
- operand
	^operand differenceFromScaledDecimal: self
!
(reader addMethod: 'arithmetic')
!
/ operand
	^operand quotientFromScaledDecimal: self
!
(reader addMethod: 'arithmetic')
!
// operand
	^fraction // operand
!
(reader addMethod: 'comparing')
!
< operand
	^operand lessFromScaledDecimal: self
!
(reader addMethod: 'comparing')
!
= comparand
	comparand isNumber ifFalse: [^false].
	^fraction = comparand asFraction
!
(reader addMethod: 'converting')
!
asDouble
	^fraction asDouble
!
(reader addMethod: 'converting')
!
asFloat
	<squeak>
	^fraction asFloat
!
(reader addMethod: 'converting')
!
asFraction
	<squeak>
	^fraction
!
(reader addMethod: 'converting')
!
asScaledDecimal: scaleIn
	^ScaledDecimal newFromNumber: fraction scale: scaleIn
!
(reader addMethod: 'private-arithmetic')
!
differenceFromInteger: anInteger
	^ScaledDecimal newFromNumber: anInteger - fraction scale: scale
!
(reader addMethod: 'private-arithmetic')
!
differenceFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction - fraction
		scale: (operand scale max: scale)
!
(reader addMethod: 'truncation and round off')
!
floor
	^fraction floor
!
(reader addMethod: 'truncation and round off')
!
fractionPart
	<squeak>
	^ScaledDecimal newFromNumber: fraction fractionPart scale: scale
!
(reader addMethod: 'truncation and round off')
!
integerPart
	<squeak>
	^ScaledDecimal newFromNumber: fraction integerPart scale: scale
!
(reader addMethod: 'testing')
!
isScaledDecimal
	^true
!
(reader addMethod: 'private-arithmetic')
!
lessFromFraction: aFraction
	^aFraction < fraction
!
(reader addMethod: 'private-arithmetic')
!
lessFromInteger: anInteger
	^anInteger < fraction
!
(reader addMethod: 'private-arithmetic')
!
lessFromScaledDecimal: aScaledDecimal
	^aScaledDecimal asFraction < fraction
!
(reader addMethod: 'mathematical functions')
!
ln
	^self asFraction ln
!
(reader addMethod: 'arithmetic')
!
negated
	^ScaledDecimal newFromNumber: fraction negated scale: scale
!
(reader addMethod: 'testing')
!
negative
	<squeak>
	^fraction negative
!
(reader addMethod: 'printing')
!
printFractionAsDecimalOn: stream
	fraction printTruncatedOn: stream showingDecimalPlaces: scale
!
(reader addMethod: 'printing')
!
printOn: stream
	self
		printFractionAsDecimalOn: stream;
		printScaleOn: stream
!
(reader addMethod: 'printing')
!
printScaleOn: stream
	stream nextPut: $s.
	scale = 1 ifFalse: [scale printOn: stream]
!
(reader addMethod: 'private-arithmetic')
!
productFromInteger: anInteger
	^ScaledDecimal newFromNumber: anInteger * fraction scale: scale
!
(reader addMethod: 'private-arithmetic')
!
productFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction * fraction
		scale: (operand scale max: self scale)
!
(reader addMethod: 'private-arithmetic')
!
quotientFromInteger: anInteger
	^ScaledDecimal newFromNumber: anInteger / fraction scale: scale
!
(reader addMethod: 'private-arithmetic')
!
quotientFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction / fraction
		scale: (operand scale max: scale)
!
(reader addMethod: 'arithmetic')
!
raisedTo: operand
	^ScaledDecimal newFromNumber: (fraction raisedTo: operand) scale: scale
!
(reader addMethod: 'arithmetic')
!
reciprocal
	self = 0 ifTrue: [^(ZeroDivide dividend: 1) signal].
	^ScaledDecimal newFromNumber: fraction reciprocal scale: scale
!
(reader addMethod: 'private')
!
scale
	<squeak>
	^scale
!
(reader addMethod: 'private')
!
setFraction: fractionIn scale: scaleIn
	<squeak>
	fraction := fractionIn.
	scale := scaleIn
!
(reader addMethod: 'mathematical functions')
!
sqrt
	| squareRoot |
	squareRoot := self asFraction sqrt.
	^squareRoot isLimitedPrecisionReal
		ifTrue: [squareRoot]
		ifFalse: [squareRoot asScaledDecimal: scale]
!
(reader addMethod: 'mathematical functions')
!
squared
	^ScaledDecimal newFromNumber: fraction squared scale: scale
!
(reader addMethod: 'private-arithmetic')
!
sumFromInteger: anInteger
	^ScaledDecimal newFromNumber: anInteger + fraction scale: scale
!
(reader addMethod: 'private-arithmetic')
!
sumFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction + fraction
		scale: (operand scale max: scale)
!
(reader addMethod: 'truncation and round off')
!
truncated
	<squeak>
	^fraction truncated
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^ScaledDecimal newFromNumber: fraction \\ operand scale: scale
!
(reader addClassMethod: 'instance creation')
!
newFromNumber: aNumber scale: scaleIn
 <squeak>| temp |
	temp := (self basicNew).
	temp setFraction: (aNumber asFraction) scale: scaleIn.
	^temp
!
(reader addClassMethod: 'instance creation')
!
readFrom: stringOrStream
	<squeak>
	^(SqNumberParser on: stringOrStream) nextScaledDecimal
!
