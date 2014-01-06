(reader extendTrait: 'Timezone')
!
(reader addMethod: 'converting')
!
asJavaTimeZone
	^self traitRequirement
!
