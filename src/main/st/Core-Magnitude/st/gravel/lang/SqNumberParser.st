(reader defineClass: 'SqNumberParser' superclass: 'st.gravel.lang.NumberParser')
!
(reader addMethod: 'parsing-private')
!
makeScaledDecimalWithNumberOfNonZeroFractionDigits: numberOfNonZeroFractionDigits andNumberOfTrailingZeroInFractionPart: numberOfTrailingZeroInFractionPart
 <squeak>| decimalMultiplier decimalFraction |
	decimalMultiplier := (base raisedToInteger: numberOfNonZeroFractionDigits).
	decimalFraction := (((integerPart * decimalMultiplier) + (fractionPart // (base raisedTo: numberOfTrailingZeroInFractionPart))) / decimalMultiplier).
	^(ScaledDecimal newFromNumber: (neg ifTrue: [ decimalFraction negated] ifFalse: [ decimalFraction]) scale: scale)
!
(reader addMethod: 'parsing-public')
!
nextScaledDecimal
 <squeak>| numberOfNonZeroFractionDigits numberOfTrailingZeroInFractionPart |
	base := 10.
	neg := (sourceStream peekFor: $-).
	integerPart := (self nextUnsignedIntegerBase: base).
	(sourceStream peekFor: $.) ifTrue: [ fractionPart := (self nextUnsignedIntegerOrNilBase: base).
 fractionPart ifNil: [ sourceStream skip: -1.
 ^(neg ifTrue: [ (integerPart negated) asScaledDecimal: 0] ifFalse: [ integerPart asScaledDecimal: 0])].
 numberOfNonZeroFractionDigits := lastNonZero.
 numberOfTrailingZeroInFractionPart := (nDigits - lastNonZero).
 (self readScale) ifFalse: [ scale := nDigits].
 ^(self makeScaledDecimalWithNumberOfNonZeroFractionDigits: numberOfNonZeroFractionDigits andNumberOfTrailingZeroInFractionPart: numberOfTrailingZeroInFractionPart)].
	self readScale.
	neg ifTrue: [ integerPart := (integerPart negated)].
	^(integerPart asScaledDecimal: scale)
!
(reader addMethod: 'parsing-private')
!
readScale
	<squeak>
	scale := 0.
	sourceStream atEnd ifTrue: [^false].
	(sourceStream peekFor: $s) ifFalse: [^false].
	scale := self nextUnsignedIntegerOrNilBase: 10.
	scale
		ifNil: 
			[scale := 0.
			sourceStream skip: -1.
			^false].
	^true
!
(reader addClassMethod: 'instance creation')
!
on: aStringOrStream
	<squeak>
	^self new on: aStringOrStream
!
