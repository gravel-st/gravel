(reader defineClass: 'WriteStreamImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.WriteStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.WriteStream class')
!
(reader addInstVar: 'collection')
!
(reader addInstVar: 'position')
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
(reader addMethod: 'gravel')
!
initialize
	position := 0
!
(reader addMethod: 'initialize-release')
!
initializeCollection: anOrderedCollectionImpl
	collection := anOrderedCollectionImpl.
	self initialize
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
(reader addClassMethod: 'instance creation')
!
collection: anOrderedCollectionImpl
	^self new initializeCollection: anOrderedCollectionImpl
!
