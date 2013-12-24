(reader defineTrait: 'ByteArray' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ArrayedCollection')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ArrayedCollection class')
!
(reader addClassMethod: 'As yet unclassified')
!
defaultImplementation
	^JavaByteArray
!
(reader addClassMethod: 'As yet unclassified')
!
withSize: size
	^self defaultImplementation new: size
!
