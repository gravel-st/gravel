(reader defineTrait: 'WriteStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.SequencedStream')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.CharacterWriteable')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.SequencedStream class')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.CharacterWriteable class')
!
(reader addMethod: 'accessing')
!
contents
	self traitRequirement
!
(reader addMethod: 'character writing')
!
crtab
	self
		cr;
		tab
!
(reader addMethod: 'character writing')
!
crtab: anInteger
	self cr.
	anInteger timesRepeat: [self tab]
!
(reader addMethod: 'testing')
!
isWriteStream
	^true
!
(reader addMethod: 'accessing')
!
next: anInteger put: anObject
	anInteger timesRepeat: [self nextPut: anObject].
	^anObject
!
(reader addMethod: 'accessing')
!
nextPut: anElement
	self traitRequirement
!
(reader addMethod: 'accessing')
!
nextPutAll: aCollection
	aCollection do: [:elem | self nextPut: elem]
!
(reader addMethod: 'accessing')
!
position
	^self traitRequirement
!
(reader addMethod: 'character writing')
!
space: anInteger
	anInteger timesRepeat: [self space]
!
(reader addMethod: 'character writing')
!
tab: anInteger
	anInteger timesRepeat: [self tab]
!
(reader addClassMethod: 'instance creation')
!
on: aCollection
	^aCollection writeStream
!
(reader addClassMethod: 'instance creation')
!
with: aCollection
	^(self on: aCollection) setToEnd
!
