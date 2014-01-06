(reader defineTrait: 'ByteArray' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequenceableCollection')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.ArrayedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequenceableCollection class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.ArrayedCollection class')
!
(reader addMethod: 'testing')
!
isByteArray
	^true
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^JavaByteArray
!
