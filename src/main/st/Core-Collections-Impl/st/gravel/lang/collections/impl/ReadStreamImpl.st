(reader defineClass: 'ReadStreamImpl' superclass: 'st.gravel.lang.collections.impl.PositionableStreamImpl')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ReadStream class')
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
	^collection
!
(reader addMethod: 'gravel')
!
initialize
	position := 0
!
(reader addMethod: 'initialize-release')
!
initializeCollection: anArray
	collection := anArray.
	self initialize
!
(reader addMethod: 'accessing')
!
position
	^position
!
(reader addMethod: 'positioning')
!
position: aPosition
	position := aPosition
!
(reader addMethod: 'positioning')
!
setToEnd
	position := collection size
!
(reader addClassMethod: 'instance creation')
!
collection: aCollection
	^self new initializeCollection: aCollection
!
