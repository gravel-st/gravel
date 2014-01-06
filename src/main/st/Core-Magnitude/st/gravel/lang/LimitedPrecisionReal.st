(reader defineClass: 'LimitedPrecisionReal' superclass: 'st.gravel.lang.Number')
!
(reader addMethod: 'converting')
!
asLimitedPrecisionReal
	^self
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
isLimitedPrecisionReal
	^true
!
(reader addClassMethod: 'constants')
!
denormalized
	^true
!
(reader addClassMethod: 'constants')
!
radix
	^2
!
