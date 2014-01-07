(reader defineClass: 'LimitedPrecisionReal' superclass: 'st.gravel.lang.Number')
!
(reader addMethod: 'arithmetic')
!
// operand
	^(self / operand) floor
!
(reader addMethod: 'converting')
!
asFraction
	| precision |
	(self isInfinite or: [self isNaN]) ifTrue: [self shouldNotOccur].
	precision := self class precision.
	^(self abs timesTwoPower: precision) truncated * self sign / (2 raisedTo: precision)
!
(reader addMethod: 'converting')
!
asLimitedPrecisionReal
	^self
!
(reader addMethod: 'converting')
!
exponent
	^self subclassResponsibility
!
(reader addMethod: 'truncation and round off')
!
fractionPart
	^self - self truncated
!
(reader addMethod: 'truncation and round off')
!
integerPart
	^self - self fractionPart
!
(reader addMethod: 'testing')
!
isFinite
	^self - self = 0.0
!
(reader addMethod: 'converting')
!
isInfinite
	^self subclassResponsibility
!
(reader addMethod: 'testing')
!
isLimitedPrecisionReal
	^true
!
(reader addMethod: 'private-arithmetic')
!
lessFromFraction: aFraction
	^aFraction < self asFraction
!
(reader addMethod: 'mathematical functions')
!
timesTwoPower: anInteger
	self = 0.0 ifTrue: [^self].
	^self * (2 raisedTo: anInteger)
!
(reader addClassMethod: 'constants')
!
denormalized
	<primitive: #('st.gravel.support.jvm.LimitedPrecisionRealExtensions' 'denormalized')>
	
!
(reader addClassMethod: 'constants')
!
radix
	<primitive: #('st.gravel.support.jvm.LimitedPrecisionRealExtensions' 'radix')>
	
!
