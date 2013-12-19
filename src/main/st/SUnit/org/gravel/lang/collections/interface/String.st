(reader extendTrait: 'String')
!
(reader addSimpleTrait: 'org.gravel.lang.Comparable')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.SequenceableCollection')
!
(reader addSimpleTrait: 'org.gravel.lang.collections.interface.IndexedCollection')
!
(reader addSimpleClassTrait: 'org.gravel.lang.Comparable class')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'org.gravel.lang.collections.interface.IndexedCollection class')
!
(reader addMethod: 'As yet unclassified')
!
sunitMatch: aString
	^self match: aString
!
