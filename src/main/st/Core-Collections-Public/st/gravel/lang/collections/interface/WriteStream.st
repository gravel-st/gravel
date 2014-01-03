(reader defineTrait: 'WriteStream' superclass: nil)
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.SequencedStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.SequencedStream class')
!
(reader addMethod: 'accessing')
!
contents
	self traitRequirement
!
(reader addMethod: 'character writing')
!
cr
	self nextPut: Character cr
!
(reader addMethod: 'character writing')
!
crtab
	self nextPut: Character cr.
	self nextPut: Character tab
!
(reader addMethod: 'character writing')
!
crtab: anInteger
	self nextPut: Character cr.
	anInteger timesRepeat: [self nextPut: Character tab]
!
(reader addMethod: 'testing')
!
isWriteStream
	^true
!
(reader addMethod: 'character writing')
!
lf
	self nextPut: Character lf
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
(reader addMethod: 'printing')
!
print: anObject
	anObject printOn: self
!
(reader addMethod: 'character writing')
!
space
	self nextPut: Character space
!
(reader addMethod: 'character writing')
!
space: anInteger
	anInteger timesRepeat: [self space]
!
(reader addMethod: 'character writing')
!
tab
	self nextPut: Character tab
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
