(reader defineClass: 'WriteStreamImpl' superclass: 'st.gravel.lang.collections.impl.PositionableStreamImpl')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.WriteStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.WriteStream class')
!
(reader addInstVar: 'writeLimit')
!
(reader addMethod: 'testing')
!
atEnd
	^position >= collection size
!
(reader addMethod: 'accessing')
!
collection
	^collection
!
(reader addMethod: 'accessing')
!
contents
	collection size = position ifTrue: [^collection].
	^collection copyTo: position
!
(reader addMethod: 'accessing')
!
nextPut: anObject
	^collection size < position
		ifTrue: [self pastEndPut: anObject]
		ifFalse: 
			[position := position + 1.
			collection at: position put: anObject]
!
(reader addMethod: 'accessing')
!
on: aCollection
	super on: aCollection.
	readLimit := 0.
	writeLimit := aCollection size
!
(reader addMethod: 'private')
!
pastEndPut: anObject
	| oldSize grownCollection |
	oldSize := collection size.
	grownCollection := collection class new: oldSize + ((oldSize max: 20) min: 1000000).
	collection := grownCollection
				replaceFrom: 1
				to: oldSize
				with: collection
				startingAt: 1.
	collection at: (position := position + 1) put: anObject.
	^anObject
!
(reader addMethod: 'accessing')
!
position
	^position
!
(reader addMethod: 'accessing')
!
position: aPosition
	position := aPosition
!
(reader addMethod: 'positioning')
!
reset
	readLimit := readLimit max: position.
	position := 0
!
(reader addMethod: 'accessing')
!
setToEnd
	position := collection size
!
(reader addMethod: 'accessing')
!
with: aCollection
	super on: aCollection.
	position := readLimit := writeLimit := aCollection size
!
(reader addClassMethod: 'instance creation')
!
collection: anOrderedCollectionImpl
	^self new on: anOrderedCollectionImpl
!
