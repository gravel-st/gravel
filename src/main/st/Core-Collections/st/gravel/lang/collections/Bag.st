(reader defineTrait: 'Bag' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Collection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Collection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Removable class')
!
(reader addMethod: 'testing')
!
isBag
	^true
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^BagImpl
!
