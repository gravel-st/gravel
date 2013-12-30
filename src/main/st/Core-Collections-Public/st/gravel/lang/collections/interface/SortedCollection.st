(reader defineTrait: 'SortedCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Addable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Addable class')
!
(reader addMethod: 'gravel')
!
reSort
	self traitRequirement
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^SortedCollectionImpl
!
(reader addClassMethod: 'As yet unclassified')
!
sortBlock: aBlock
	^self defaultImplementation sortBlock: aBlock
!
