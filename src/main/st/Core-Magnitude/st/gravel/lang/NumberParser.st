(reader defineClass: 'NumberParser' superclass: 'st.gravel.lang.Object')
!
(reader addInstVar: 'sourceStream')
!
(reader addInstVar: 'base')
!
(reader addInstVar: 'neg')
!
(reader addInstVar: 'integerPart')
!
(reader addInstVar: 'fractionPart')
!
(reader addInstVar: 'exponent')
!
(reader addInstVar: 'scale')
!
(reader addInstVar: 'nDigits')
!
(reader addInstVar: 'lastNonZero')
!
(reader addInstVar: 'requestor')
!
(reader addInstVar: 'failBlock')
!
(reader addMethod: 'parsing-large int')
!
nextElementaryLargeIntegerBase: aRadix
 <squeak>| value digit char |
	value := 0.
	nDigits := 0.
	lastNonZero := 0.
	[ (value isLarge) or: [ ((char := (sourceStream next)) == nil) or: [ digit := (char digitValue).
 ((0 > digit) or: [ digit >= aRadix]) and: [ sourceStream skip: -1.
 true]]]] whileFalse: [ nDigits := (nDigits + 1).
 (0 = digit) ifFalse: [ lastNonZero := nDigits].
 value := ((value * aRadix) + digit)].
	^value
!
(reader addMethod: 'parsing-public')
!
nextIntegerBase: aRadix
 <squeak>| isNeg value |
	isNeg := (self peekSignIsMinus).
	value := (self nextUnsignedIntegerBase: aRadix).
	^(isNeg ifTrue: [ value negated] ifFalse: [ value])
!
(reader addMethod: 'parsing-private')
!
nextLargeIntegerBase: aRadix nPackets: nPackets
	| high nDigitsHigh low nDigitsLow halfPackets |
	halfPackets := nPackets bitShift: -1.
	halfPackets = 0 ifTrue: [^self nextElementaryLargeIntegerBase: aRadix].
	high := self nextLargeIntegerBase: aRadix nPackets: halfPackets.
	high isLarge ifFalse: [^high].
	nDigitsHigh := nDigits.
	low := self nextLargeIntegerBase: aRadix nPackets: halfPackets.
	nDigitsLow := nDigits.
	nDigits := nDigitsHigh + nDigitsLow.
	lastNonZero = 0 ifFalse: [lastNonZero := lastNonZero + nDigitsHigh].
	^high * (aRadix raisedToInteger: nDigitsLow) + low
!
(reader addMethod: 'parsing-public')
!
nextUnsignedIntegerBase: aRadix
 <squeak>| value |
	value := (self nextUnsignedIntegerOrNilBase: aRadix).
	value ifNil: [ ^(self expected: ('a digit between 0 and ' copyWith: (Character digitValue: (aRadix - 1))))].
	^value
!
(reader addMethod: 'parsing-public')
!
nextUnsignedIntegerOrNilBase: aRadix
 <squeak>| nPackets high nDigitsHigh lastNonZeroHigh low |
	high := (self nextElementaryLargeIntegerBase: aRadix).
	(nDigits = 0) ifTrue: [ ^nil].
	(high isLarge) ifFalse: [ ^high].
	nPackets := 1.
	nDigitsHigh := nDigits.
	lastNonZeroHigh := lastNonZero.
	[ low := (self nextLargeIntegerBase: aRadix nPackets: nPackets).
 high := ((high * (aRadix raisedToInteger: nDigits)) + low).
 (lastNonZero = 0) ifFalse: [ lastNonZeroHigh := (lastNonZero + nDigitsHigh)].
 nDigitsHigh := (nDigitsHigh + nDigits).
 low isLarge] whileTrue: [ nPackets := (nPackets * 2)].
	nDigits := nDigitsHigh.
	lastNonZero := lastNonZeroHigh.
	^high
!
(reader addMethod: 'initialize-release')
!
on: aStringOrStream
	<squeak>
	sourceStream := aStringOrStream isString
				ifTrue: [aStringOrStream readStream]
				ifFalse: [aStringOrStream].
	base := 10.
	neg := false.
	integerPart := fractionPart := exponent := scale := 0.
	requestor := failBlock := nil
!
(reader addMethod: 'parsing-private')
!
peekSignIsMinus
 <squeak>| isMinus |
	isMinus := (sourceStream peekFor: $-).
	isMinus ifFalse: [ (self allowPlusSign) ifTrue: [ sourceStream peekFor: $+]].
	^isMinus
!
