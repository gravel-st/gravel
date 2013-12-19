(reader defineTrait: 'Comparable' superclass: nil)
!
(reader addMethod: 'gravel')
!
< aMagnitude
	^self traitRequirement
!
(reader addMethod: 'gravel')
!
<= aMagnitude
	^(self > aMagnitude) not
!
(reader addMethod: 'gravel')
!
> aMagnitude
	^aMagnitude < self
!
(reader addMethod: 'gravel')
!
>= aMagnitude
	^(self < aMagnitude) not
!
(reader addMethod: 'gravel')
!
between: min and: max
	^self >= min and: [self <= max]
!
(reader addMethod: 'gravel')
!
max: aMagnitude
	^self > aMagnitude ifTrue: [self] ifFalse: [aMagnitude]
!
(reader addMethod: 'gravel')
!
min: aMagnitude
	^self < aMagnitude ifTrue: [self] ifFalse: [aMagnitude]
!
