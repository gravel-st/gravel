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
(reader addMethod: 'As yet unclassified')
!
upToAny: aCollection
	| newStream element |
	newStream := self contentsSpecies new writeStream.
	[self atEnd] whileFalse: 
			[element := self next.
			(aCollection includes: element) ifTrue: [^newStream contents].
			newStream nextPut: element].
	^newStream contents
!
(reader addClassMethod: 'instance creation')
!
on: aCollection
	^aCollection readStream
!
