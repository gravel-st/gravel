(reader defineTrait: 'ReadStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequencedStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequencedStream class')
!
(reader addMethod: 'testing')
!
isReadStream
	^true
!
(reader addClassMethod: 'instance creation')
!
on: aCollection
	^aCollection readStream
!
