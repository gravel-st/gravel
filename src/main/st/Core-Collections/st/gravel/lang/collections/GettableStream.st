(reader defineTrait: 'GettableStream' superclass: nil)
!
(reader addMethod: 'accessing')
!
atEnd
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
do: aBlock
	[self atEnd] whileFalse: [aBlock value: self next]
!
(reader addMethod: 'accessing')
!
next
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
nextLine
	^self upTo: Character cr
!
(reader addMethod: 'accessing')
!
nextMatchFor: anObject
	^anObject = self next
!
(reader addMethod: 'accessing')
!
peek
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
peekFor: item
	| next |
	(next := self peek) == nil ifTrue: [^false].
	item = next
		ifTrue: 
			[self next.
			^true].
	^false
!
(reader addMethod: 'accessing')
!
skipTo: anObject
	[self atEnd] whileFalse: [self next = anObject ifTrue: [^true]].
	^false
!
(reader addMethod: 'accessing')
!
upTo: anElement
	^self traitRequirement
!
(reader addMethod: 'accessing')
!
upToAnyOf: subcollection do: aBlock
	^self collectionSpecies new: 1000
		streamContents: 
			[:stream |
			| ch |
			
			[self atEnd or: 
					[(subcollection includes: (ch := self next)) and: 
							[aBlock value: ch.
							true]]]
					whileFalse: [stream nextPut: ch]]
!
