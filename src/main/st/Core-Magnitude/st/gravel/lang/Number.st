(reader defineClass: 'Number' superclass: 'st.gravel.lang.Magnitude')
!
(reader addMethod: 'arithmetic')
!
* operand
	^self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
+ operand
	^self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
- operand
	^self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
/ operand
	^self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
// operand
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
abs
	^self negative ifTrue: [self negated] ifFalse: [self]
!
(reader addMethod: 'converting')
!
asDouble
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asFloat
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asFloatD
	^self asDouble
!
(reader addMethod: 'converting')
!
asFloatE
	^self asFloat
!
(reader addMethod: 'converting')
!
asFloatQ
	^self asDouble
!
(reader addMethod: 'converting')
!
asFraction
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asInteger
	^self truncated
!
(reader addMethod: 'converting')
!
asScaledDecimal: scale
	^ScaledDecimal newFromNumber: self scale: scale
!
(reader addMethod: 'truncation and round off')
!
ceiling
	| truncation |
	truncation := self truncated.
	self <= 0 ifTrue: [^truncation].
	self = truncation ifTrue: [^truncation] ifFalse: [^truncation + 1]
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFloat: aFloat
	^aFloat - self asFloat
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFraction: aFraction
	^self asFraction differenceFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
differenceFromLargeInteger: aSmallInteger
	^self differenceFromInteger: aSmallInteger
!
(reader addMethod: 'private-arithmetic')
!
differenceFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction - self asFraction scale: operand scale
!
(reader addMethod: 'private-arithmetic')
!
differenceFromSmallInteger: aSmallInteger
	^self differenceFromInteger: aSmallInteger
!
(reader addMethod: 'testing')
!
even
	^self \\ 2 = 0
!
(reader addMethod: 'truncation and round off')
!
floor
	^self subclassResponsibility
!
(reader addMethod: 'mathematical functions')
!
floorLog: radix
	^(self log: radix) floor
!
(reader addMethod: 'arithmetic')
!
fractionPart
	^self asFloat fractionPart
!
(reader addMethod: 'truncation and round off')
!
integerPart
	^self - self fractionPart
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromInteger: anInteger
	^(anInteger / self) floor
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromLargeInteger: anObject
	^self integerQuotientFromInteger: anObject
!
(reader addMethod: 'private-arithmetic')
!
integerQuotientFromSmallInteger: anObject
	^self integerQuotientFromInteger: anObject
!
(reader addMethod: 'testing')
!
isNumber
	^true
!
(reader addMethod: 'private-arithmetic')
!
lessFromFloat: aFloat
	^aFloat < self asFloat
!
(reader addMethod: 'private-arithmetic')
!
lessFromLargeInteger: aSmallInteger
	^self lessFromInteger: aSmallInteger
!
(reader addMethod: 'private-arithmetic')
!
lessFromScaledDecimal: aScaledDecimal
	^aScaledDecimal asFraction < self
!
(reader addMethod: 'private-arithmetic')
!
lessFromSmallInteger: aSmallInteger
	^self lessFromInteger: aSmallInteger
!
(reader addMethod: 'mathematical functions')
!
ln
	^self asFloat ln
!
(reader addMethod: 'mathematical functions')
!
log: aNumber
	^self ln / aNumber ln
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromFloat: aFloat
	^self moduloQuotientFromNumber: aFloat
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromFraction: anInteger
	^self moduloQuotientFromNumber: anInteger
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromInteger: anInteger
	^self moduloQuotientFromNumber: anInteger
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromLargeInteger: anInteger
	^self moduloQuotientFromInteger: anInteger
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromNumber: anInteger
	^anInteger - (anInteger // self * self)
!
(reader addMethod: 'private-arithmetic')
!
moduloQuotientFromSmallInteger: anInteger
	^self moduloQuotientFromInteger: anInteger
!
(reader addMethod: 'arithmetic')
!
negated
	^0 - self
!
(reader addMethod: 'testing')
!
negative
	^self < 0
!
(reader addMethod: 'testing')
!
positive
	^self >= 0
!
(reader addMethod: 'printing')
!
printOn: aStream
	self printOn: aStream base: 10
!
(reader addMethod: 'printing')
!
printOn: aStream base: base
	aStream nextPutAll: (self printBase: base)
!
(reader addMethod: 'private-arithmetic')
!
productFromFloat: aFloat
	^self asFloat productFromFloat: aFloat
!
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	^self asFraction productFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
productFromLargeInteger: anObject
	^self productFromInteger: anObject
!
(reader addMethod: 'private-arithmetic')
!
productFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction * self asFraction scale: operand scale
!
(reader addMethod: 'private-arithmetic')
!
productFromSmallInteger: anObject
	^self productFromInteger: anObject
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^(self / operand) truncated
!
(reader addMethod: 'private-arithmetic')
!
quoFromInteger: anInteger
	^(anInteger / self) truncated
!
(reader addMethod: 'private-arithmetic')
!
quoFromLargeInteger: anInteger
	^self quoFromInteger: anInteger
!
(reader addMethod: 'private-arithmetic')
!
quoFromSmallInteger: anInteger
	^self quoFromInteger: anInteger
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFloat: aFloat
	^aFloat / self asFloat
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFraction: aFraction
	^self asFraction quotientFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
quotientFromLargeInteger: anInteger
	^self quotientFromInteger: anInteger
!
(reader addMethod: 'private-arithmetic')
!
quotientFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction / self asFraction scale: operand scale
!
(reader addMethod: 'private-arithmetic')
!
quotientFromSmallInteger: anInteger
	^self quotientFromInteger: anInteger
!
(reader addMethod: 'arithmetic')
!
raisedTo: aNumber
	^aNumber raising: self
!
(reader addMethod: 'arithmetic')
!
raisedToInteger: anInteger
	| bitProbe result |
	anInteger negative ifTrue: [^(self raisedToInteger: anInteger negated) reciprocal].
	bitProbe := 1 bitShift: anInteger highBit - 1.
	result := self class one.
	
	[(anInteger bitAnd: bitProbe) = 0 ifFalse: [result := result * self].
	bitProbe := bitProbe bitShift: -1.
	bitProbe > 0]
			whileTrue: [result := result * result].
	^result
!
(reader addMethod: 'private-arithmetic')
!
raising: aNumber
	self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
reciprocal
	^self class unity / self
!
(reader addMethod: 'arithmetic')
!
rem: aNumber
	^self - ((self quo: aNumber) * aNumber)
!
(reader addMethod: 'private-arithmetic')
!
remFromInteger: anObject
	^anObject - ((anObject quo: self) * self)
!
(reader addMethod: 'private-arithmetic')
!
remFromLargeInteger: anObject
	^self remFromInteger: anObject
!
(reader addMethod: 'private-arithmetic')
!
remFromSmallInteger: anObject
	^self remFromInteger: anObject
!
(reader addMethod: 'truncation and round off')
!
rounded
	^(self + (self sign / 2)) truncated
!
(reader addMethod: 'truncation and round off')
!
roundTo: aNumber
	^(self / aNumber) rounded * aNumber
!
(reader addMethod: 'testing')
!
sign
	self strictlyPositive ifTrue: [^1].
	self negative ifTrue: [^-1].
	^0
!
(reader addMethod: 'mathematical functions')
!
sqrt
	^self asFloat sqrt
!
(reader addMethod: 'arithmetic')
!
squared
	^self * self
!
(reader addMethod: 'testing')
!
strictlyPositive
	^self > 0
!
(reader addMethod: 'private-arithmetic')
!
sumFromFloat: aFloat
	^aFloat + self asFloat
!
(reader addMethod: 'private-arithmetic')
!
sumFromFraction: aFraction
	^self asFraction sumFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
sumFromLargeInteger: aSmallInteger
	^self sumFromInteger: aSmallInteger
!
(reader addMethod: 'private-arithmetic')
!
sumFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand asFraction + self asFraction scale: operand scale
!
(reader addMethod: 'private-arithmetic')
!
sumFromSmallInteger: aSmallInteger
	^self sumFromInteger: aSmallInteger
!
(reader addMethod: 'gravel')
!
to: stop
	^Interval from: self to: stop by: 1
!
(reader addMethod: 'gravel')
!
to: stop by: step
	^Interval from: self to: stop by: step
!
(reader addMethod: 'gravel')
!
to: stop by: step do: aBlock
	(Interval from: self to: stop by: step) do: aBlock
!
(reader addMethod: 'gravel')
!
to: stop do: aBlock
	^self to: stop do: [:i | aBlock value: i]
!
(reader addMethod: 'As yet unclassified')
!
toMinimumGenerality
	^self subclassResponsibility
!
(reader addMethod: 'truncation and round off')
!
truncated
	^self subclassResponsibility
!
(reader addMethod: 'truncation and round off')
!
truncateTo: aNumber
	^(self quo: aNumber) * aNumber
!
(reader addMethod: 'arithmetic')
!
\\ operand
	^self subclassResponsibility
!
(reader addClassMethod: 'constants')
!
one
	<squeak>
	^1
!
(reader addClassMethod: 'constants')
!
unity
	^self subclassResponsibility
!
