(reader defineTrait: 'IdentityDictionary' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.Dictionary')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.Dictionary class')
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^IdentityDictionaryImpl
!
