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
isFinite
	^self - self = 0.0
!
(reader addMethod: 'testing')
!
isLimitedPrecisionReal
	^true
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
