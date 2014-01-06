(reader defineClass: 'WriteStreamImpl' superclass: 'st.gravel.lang.collections.impl.PositionableStreamImpl')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.WriteStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.WriteStream class')
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
(reader addMethod: 'private')
!
growCollection
	| grownCollection oldSize |
	oldSize := collection size.
	grownCollection := collection class new: oldSize + ((oldSize max: 20) min: 1000000).
	collection := grownCollection
				replaceFrom: 1
				to: oldSize
				with: collection
				startingAt: 1
!
(reader addMethod: 'accessing')
!
nextPut: anObject
	position := position + 1.
	collection size < position ifTrue: [self growCollection].
	collection at: position put: anObject.
	^anObject
!
(reader addMethod: 'accessing')
!
on: aCollection
	super on: aCollection.
	readLimit := 0.
	writeLimit := aCollection size
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
