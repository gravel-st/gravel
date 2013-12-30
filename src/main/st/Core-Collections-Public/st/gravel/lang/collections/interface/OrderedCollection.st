(reader defineTrait: 'OrderedCollection' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Addable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Addable class')
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
