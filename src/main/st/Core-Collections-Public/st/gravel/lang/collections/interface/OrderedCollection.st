(reader defineTrait: 'OrderedCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Removable class')
!
(reader addMethod: 'adding')
!
add: anObject afterIndex: spot
	^self add: anObject beforeIndex: spot + 1
!
(reader addMethod: 'accessing')
!
add: anObject beforeIndex: spot
	^self traitRequirement
!
(reader addMethod: 'adding')
!
addAll: aCollection after: anElement
	^self addAll: aCollection
		afterIndex: (self indexOf: anElement ifAbsent: [self notFoundError])
!
(reader addMethod: 'adding')
!
addAll: aCollection afterIndex: spot
	^self addAll: aCollection beforeIndex: spot + 1
!
(reader addMethod: 'adding')
!
addAll: aCollection before: anElement
	^self addAll: aCollection
		beforeIndex: (self indexOf: anElement ifAbsent: [self notFoundError])
!
(reader addMethod: 'adding')
!
addAll: aCollection beforeIndex: spot
	| i |
	i := 0.
	aCollection do: 
			[:elem |
			self add: elem beforeIndex: spot + i.
			i := i + 1]
!
(reader addMethod: 'testing')
!
isOrderedCollection
	^true
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^OrderedCollectionImpl
!
(reader addClassMethod: 'instance creation')
!
ofSize: size
	^(self new: size) changeSizeTo: size
!
