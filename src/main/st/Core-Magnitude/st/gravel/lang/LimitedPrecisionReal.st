(reader defineClass: 'LimitedPrecisionReal' superclass: 'st.gravel.lang.Number')
!
(reader addMethod: 'converting')
!
asLimitedPrecisionReal
	^self
!
(reader addMethod: 'testing')
!
isLimitedPrecisionReal
	^true
!
