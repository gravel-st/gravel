(reader defineTrait: 'ReadWriteStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.WriteStream')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.WriteStream class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.ReadStream class')
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
