(reader defineClass: 'ReadStreamImpl' superclass: 'st.gravel.lang.Object')
!
(reader addSimpleTrait: 'st.gravel.lang.collections.interface.ReadStream')
!
(reader addSimpleClassTrait: 'st.gravel.lang.collections.interface.ReadStream class')
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
(reader addClassMethod: 'instance creation')
!
collection: aCollection
	^self new initializeCollection: aCollection
!
