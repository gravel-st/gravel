(reader defineTrait: 'ReadWriteStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.WriteStream')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.WriteStream class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ReadStream class')
!
(reader addMethod: 'testing')
!
isReadWriteStream
	^true
!
(reader addClassMethod: 'traits - conflicts')
!
on: aCollection
	^aCollection readWriteStream
!
