(reader defineTrait: 'IdentityDictionary' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.CollectionFactory')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Addable')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.Removable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.CollectionFactory class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Addable class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.Removable class')
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
