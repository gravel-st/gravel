(reader defineTrait: 'IdentityDictionary' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.CollectionFactory')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.CollectionFactory class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Removable class')
!
(reader addMethod: 'testing')
!
isIdentityDictionary
	^true
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^IdentityDictionaryImpl
!
