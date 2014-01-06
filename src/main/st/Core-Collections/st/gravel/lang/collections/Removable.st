(reader defineTrait: 'Removable' superclass: nil)
!
(reader addMethod: 'accessing')
!
notFoundError
	^NotFoundError raise
!
(reader addMethod: 'accessing')
!
remove: oldObject
	^self remove: oldObject ifAbsent: [self notFoundError]
!
(reader addMethod: 'accessing')
!
remove: anElement ifAbsent: aBlock
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
removeAll: aCollection
	aCollection do: [:each | self remove: each].
	^aCollection
!
