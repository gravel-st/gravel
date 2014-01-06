(reader defineTrait: 'ReadStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequencedStream')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.GettableStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequencedStream class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.GettableStream class')
!
(reader addMethod: 'testing')
!
isReadStream
	^true
!
(reader addMethod: 'accessing')
!
next
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
next: anInteger
	| newStream |
	newStream := self contentsSpecies new writeStream.
	anInteger timesRepeat: 
			[self atEnd ifTrue: [^newStream contents].
			newStream nextPut: self next].
	^newStream contents
!
(reader addMethod: 'accessing')
!
upTo: anObject
	| newStream element |
	newStream := self contentsSpecies new writeStream.
	[self atEnd] whileFalse: 
			[element := self next.
			anObject = element ifTrue: [^newStream contents].
			newStream nextPut: element].
	^newStream contents
!
(reader addMethod: 'accessing')
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
