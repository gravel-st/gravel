(reader defineTrait: 'Emptyness' superclass: nil)
!
(reader addMethod: 'As yet unclassified')
!
ifEmpty: aBlock
	self isEmpty ifTrue: [^aBlock value].
	^self
!
(reader addMethod: 'As yet unclassified')
!
ifNotEmpty: aBlock
	self isEmpty ifFalse: [^aBlock cull: self].
	^self
!
(reader addMethod: 'As yet unclassified')
!
isEmpty
	^self traitRequirement
!
(reader addMethod: 'As yet unclassified')
!
notEmpty
	^self isEmpty not
!
