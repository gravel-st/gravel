(reader defineTrait: 'SortedCollection' superclass: nil)
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.AddableCollection')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.AddableCollection class')
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
(reader addClassMethod: 'gravel')
!
sortBlock: aBlock
	^self traitRequirement
!
