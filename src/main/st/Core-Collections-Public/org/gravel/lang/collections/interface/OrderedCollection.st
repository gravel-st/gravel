(reader defineTrait: 'OrderedCollection' superclass: nil)
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.AddableCollection class')
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^OrderedCollectionImpl
!
