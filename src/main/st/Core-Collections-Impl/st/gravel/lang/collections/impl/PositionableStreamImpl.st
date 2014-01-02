(reader defineClass: 'PositionableStreamImpl' superclass: 'st.gravel.lang.collections.impl.StreamImpl')
!
(reader addInstVar: 'position')
!
(reader addInstVar: 'collection')
!
(reader addInstVar: 'readLimit')
!
(reader addMethod: 'accessing')
!
on: aCollection
	collection := aCollection.
	readLimit := aCollection size.
	position := 0.
	self reset
!
(reader addMethod: 'accessing')
!
reset
	position := 0
!
(reader addClassMethod: 'instance creation')
!
collection: anOrderedCollectionImpl
	^self new on: anOrderedCollectionImpl
!
