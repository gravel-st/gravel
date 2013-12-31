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
asFloat
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asFloatD
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asFloatE
	^self subclassResponsibility
!
(reader addMethod: 'converting')
!
asFloatQ
	^self subclassResponsibility
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
	^self subclassResponsibility
!
(reader addMethod: 'private-arithmetic')
!
differenceFromFraction: aFraction
	^self asFraction differenceFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
differenceFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand fraction - self asFraction scale: operand scale
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
(reader addMethod: 'truncation and round off')
!
fractionPart
	^self subclassResponsibility
!
(reader addMethod: 'truncation and round off')
!
integerPart
	^self - self fractionPart
!
(reader addMethod: 'testing')
!
isNumber
	^true
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
(reader addMethod: 'private-arithmetic')
!
productFromFraction: aFraction
	^self asFraction productFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
productFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand fraction * self asFraction scale: operand scale
!
(reader addMethod: 'arithmetic')
!
quo: operand
	^self subclassResponsibility
!
(reader addMethod: 'private-arithmetic')
!
quoFromInteger: anInteger
	^(anInteger / self) truncated
!
(reader addMethod: 'private-arithmetic')
!
quotientFromFraction: aFraction
	^self asFraction quotientFromFraction: aFraction
!
(reader addMethod: 'private-arithmetic')
!
quotientFromScaledDecimal: operand
	^ScaledDecimal newFromNumber: operand fraction / self asFraction scale: operand scale
!
(reader addMethod: 'arithmetic')
!
raisedTo: operand
	^self subclassResponsibility
!
(reader addMethod: 'arithmetic')
!
raisedToInteger: operand
	^self subclassResponsibility
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
(reader addMethod: 'truncation and round off')
!
rounded
	^self subclassResponsibility
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
(reader addMethod: 'arithmetic')
!
sqrt
	^self subclassResponsibility
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
	^ScaledDecimal newFromNumber: operand fraction + self asFraction scale: operand scale
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
	^self to: stop
		by: step
		do: [:i | aBlock value: i]
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
unity
	^self subclassResponsibility
!
